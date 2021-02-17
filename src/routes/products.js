const express = require('express')
const upload = require(__dirname + '/../modules/upload-imgs')
const moment = require('moment-timezone')
const router = express.Router();
const db = require(__dirname + '/../modules/db_connect2');

router.use((req, res, next)=>{
    // if(!req.session.admin){
    //     return res.redirect('/');
    // }
    res.locals.baseUrl = req.baseUrl;
    res.locals.url = req.url;
    next();
});

// **********改資料表
// 抓所有資料
// 算比數
const listHandler = async (req)=>{
    const perPage = 9;
    const [t_rows] = await db.query("SELECT COUNT(1) num FROM `product_winnie`");
    const totalRows = t_rows[0].num;
    const totalPages = Math.ceil(totalRows/perPage);

    let page = parseInt(req.query.page) || 1;//query：?page=1

    let rows = [];
    if(totalRows > 0) {
        if(page < 1) page=1;
        if(page>totalPages) page=totalPages;
        // **********改資料表
        // 顯示一頁有幾筆
        [rows] = await db.query("SELECT * FROM `product_winnie` ORDER BY `sid` LIMIT ?, ?",
            [(page-1)* perPage, perPage]);
        rows.forEach(item=>{
            item.birthday = moment(item.birthday).format('YYYY-MM-DD');//
        });
    }
    return {
        perPage,
        totalRows,
        totalPages,
        page,
        rows,
    }
};

//*****商品後端sql******

//我的寶貝sql
const list = async (req)=>{
   
    let rows = [];
    [rows] = await db.query("SELECT * FROM `product_winnie`");
    return rows
};
//特定id的sql
const listid = async (req)=>{
   
    let rows = [];
    [rows] = await db.query("SELECT * FROM `product_winnie` WHERE sid=?", [ req.query.sid ]);
    return rows
};

//特定分類的sql
const listcate = async (req)=>{
   
    let rows = [];
    [rows] = await db.query("SELECT * FROM `product_winnie` WHERE category_id=?", [ req.query.category_id ]);
    return rows
};

// **********改資料表
// 修改
router.get('/:sid/edit', async (req, res)=>{
    const [rows] = await db.query("SELECT * FROM `product_winnie` WHERE sid=?", [ req.params.sid ]);
    if(rows.length !== 1){
        return res.redirect( res.locals.baseUrl + '/list' );
    }

    // **********改樣板位置
    rows[0].birthday = moment(rows[0].birthday).format('YYYY-MM-DD');
    res.render('products/productsedit', rows[0]);
})

// 改欄位
router.post('/:sid/edit', upload.none(), async (req, res)=>{
    const {product_name, price, color, size, photo, introduction} = req.body;
    const data = {product_name, price, color, size, photo, introduction};

    // **********改資料表
    const [result] = await db.query("UPDATE `product_winnie` SET ? WHERE sid=?", [data, req.params.sid]);
    // affectedRows, changedRows
    res.json({
        success: result.changedRows===1
    });
})


// **********改資料表
// 刪除
router.delete('/:sid', async (req, res)=>{
    const [result] = await db.query("DELETE FROM `product_winnie` WHERE sid=?", [ req.params.sid ]);
    res.json({
        success: result.affectedRows===1
    });
})

// **********改資料表
// 新增
router.get('/add', async (req, res)=>{
    res.render('products/productsadd');
})
router.post('/add', upload.none(), async (req, res)=>{
    // const data = {...req.body};
    const {product_name, price, color, size, photo, introduction} = req.body;
    const data = {product_name, price, color, size, photo, introduction};
        //data.bid_created_time =  new Date();
    // data.stars =  10;
    // **********改資料表
    const [result] = await db.query("INSERT INTO `product_winnie` SET ?", [data]);
    console.log(result);

    if(result.affectedRows===1){
        res.json({
            success: true,
            body: req.body,
        });
    } else {
        res.json({
            success: false,
            body: req.body,
        });
    }
})
//只是讀list
router.get('/list', async (req, res)=>{
    const output = await listHandler(req);
    res.render('products/productsaddlist', output);
})
//跑出json檔
router.get('/api/list', async (req, res)=>{
    const output = await listHandler(req);
    res.json(output);
})

//*****商品後端路由******

//我的寶貝
router.get('/json', async (req, res)=>{
    const output = await list(req);
    res.status(200).json(output);
})
//抓id
router.get('/id', async (req, res)=>{
    const output = await listid(req);
    res.status(200).json(output);
})

//抓分類
router.get('/cate', async (req, res)=>{
    const output = await listcate(req);
    res.status(200).json(output);
})

// router.get('/', listHandler)

module.exports = router;
