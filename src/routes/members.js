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
    const [t_rows] = await db.query("SELECT COUNT(1) num FROM `members`");
    const totalRows = t_rows[0].num;
    const totalPages = Math.ceil(totalRows/perPage);

    let page = parseInt(req.query.page) || 1;

    let rows = [];
    if(totalRows > 0) {
        if(page < 1) page=1;
        if(page>totalPages) page=totalPages;
        // **********改資料表
        // 顯示一頁有幾筆
        [rows] = await db.query("SELECT * FROM `members` ORDER BY `sid` ASC LIMIT ?, ?",
            [(page-1)* perPage, perPage]);
        rows.forEach(item=>{
            item.created_at = moment(item.created_at).format('YYYY-MM-DD');
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
router.get('/:sid/edit', async (req, res)=>{
    const [rows] = await db.query("SELECT * FROM `members` WHERE sid=?", [ req.params.sid ]);
    if(rows.length !== 1){
        return res.redirect( res.locals.baseUrl + '/list' );
    }

    //抓資料要轉換時間
    if(rows[0].birthday){
        rows[0].birthday = moment(rows[0].birthday).format('YYYY-MM-DD');
    } else {
        rows[0].birthday = '';
    }
    
    res.render('members/memberedit', rows[0]);
})

// 改欄位
router.post('/:sid/edit', upload.none(), async (req, res)=>{
    const {account,email, password, mobile, address, birthday} = req.body;
    const data = {account,email, password, mobile, address, birthday};
    if(! birthday.value){
        delete data.birthday;
    }

    
    // **********改資料表
    const [result] = await db.query("UPDATE `members` SET ? WHERE sid=?", [data, req.params.sid]);
    // affectedRows, changedRows
    res.json({
        success: result.changedRows===1
    });
})


// **********改資料表
// 刪除
router.delete('/:sid', async (req, res)=>{
    const [result] = await db.query("DELETE FROM `members` WHERE sid=?", [ req.params.sid ]);
    res.json({
        success: result.affectedRows===1
    });
})

// **********改資料表
// 新增
router.get('/add', async (req, res)=>{
    res.render('members/memberadd');
})
router.post('/add', upload.none(), async (req, res)=>{
    // const data = {...req.body};
    const {account, email, password, mobile, address, birthday, created_at} = req.body;
    const data = {account, email, password, mobile, address, birthday,created_at};
        data.created_at =  new Date();
        if(! birthday.value){
            delete data.birthday;
        }
    const [result] = await db.query("INSERT INTO `members` SET ?", [data]);
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
    res.render('members/memberlist', output);
})

router.get('/api/list', async (req, res)=>{
    const output = await listHandler(req);
    res.json(output);
})

// router.get('/', listHandler)

module.exports = router;
