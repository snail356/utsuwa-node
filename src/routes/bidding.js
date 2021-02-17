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
    const perPage = 10;
    const [t_rows] = await db.query("SELECT COUNT(1) num FROM `bidding_chang`");
    const totalRows = t_rows[0].num;
    const totalPages = Math.ceil(totalRows/perPage);

    let page = parseInt(req.query.page) || 1;

    let rows = [];
    if(totalRows > 0) {
        if(page < 1) page=1;
        if(page>totalPages) page=totalPages;
        // **********改資料表
        // 顯示一頁有幾筆
        [rows] = await db.query("SELECT * FROM `bidding_chang` ORDER BY `bid_id` DESC LIMIT ?, ?",
            [(page-1)* perPage, perPage]);
        rows.forEach(item=>{
            item.birthday = moment(item.birthday).format('YYYY-MM-DD');
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

// **********改資料表
// 修改
router.get('/:bid_id/edit', async (req, res)=>{
    const [rows] = await db.query("SELECT * FROM `bidding_chang` WHERE bid_id=?", [ req.params.bid_id ]);
    if(rows.length !== 1){
        return res.redirect( res.locals.baseUrl + '/list' );
    }

    // **********改樣板位置
    rows[0].birthday = moment(rows[0].birthday).format('YYYY-MM-DD');
    res.render('address-book/biddingedit', rows[0]);
})

// 改欄位
router.post('/:bid_id/edit', upload.none(), async (req, res)=>{
    const {bid_product_number, bid_add_money, bid_sum_money, bid_created_time} = req.body;
    const data = {bid_product_number, bid_add_money, bid_sum_money, bid_created_time};

    // **********改資料表
    const [result] = await db.query("UPDATE `bidding_chang` SET ? WHERE bid_id=?", [data, req.params.bid_id]);
    // affectedRows, changedRows
    res.json({
        success: result.changedRows===1
    });
})


// **********改資料表
// 刪除
router.delete('/:bid_id', async (req, res)=>{
    const [result] = await db.query("DELETE FROM `bidding_chang` WHERE bid_id=?", [ req.params.bid_id ]);
    res.json({
        success: result.affectedRows===1
    });
})

// **********改資料表
// 新增
router.get('/add', async (req, res)=>{
    res.render('address-book/biddingadd');
})
router.post('/add', upload.none(), async (req, res)=>{
    // const data = {...req.body};
    const {sid, bid_product_number, bid_add_money, bid_sum_money, bid_created_time} = req.body;
    const data = {sid, bid_product_number, bid_add_money, bid_sum_money, bid_created_time};
        data.bid_created_time =  new Date();
    // data.stars =  10;
    // **********改資料表
    const [result] = await db.query("INSERT INTO `bidding_chang` SET ?", [data]);
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
router.get('/list', async (req, res)=>{
    const output = await listHandler(req);
    res.render('address-book/biddinglist', output);
})

router.get('/api/list', async (req, res)=>{
    const output = await listHandler(req);
    res.json(output);
})

// router.get('/', listHandler)

module.exports = router;
