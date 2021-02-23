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

//node list
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

//react
router.get('/edit/:sid', async (req, res)=>{
    const [rows] = await db.query("SELECT * FROM `members` WHERE sid=?", [ req.params.sid ]);

    //抓資料要轉換時間
    if(rows[0].birth){
        rows[0].birth = moment(rows[0].birth).format('YYYY-MM-DD');
    } else {
        rows[0].birth = '';
    }
    
    res.json(rows[0])
    //node樣板 改這裡！！！！！！
    //res.render('members/memberedit', rows[0]);
    
})


// react
router.post('/edit/:sid', upload.single('avatar'), async (req, res)=>{
    const {name, email, password, mobile, address, birth} = req.body;
    
    const data = {name, email, password, mobile, address, birth};
    if(req.file && req.file.filename){
        data.avatar = req.file.filename;
    }
    
    if(! req.body.birth){
        delete data.birth;
    }
    const [result] = await db.query("UPDATE `members` SET ? WHERE sid=?", [data, req.params.sid]);
    res.json({
        success: result.changedRows===1,
        birth: data.birth
    });
})


router.delete('/:sid', async (req, res)=>{
    const [result] = await db.query("DELETE FROM `members` WHERE sid=?", [ req.params.sid ]);
    res.json({
        success: result.affectedRows===1
    });
})

//node
router.get('/add', async (req, res)=>{
    res.render('members/memberadd');
})

//react
router.post('/add', upload.none(), async (req, res)=>{
    //前端
    const {account, email, password, created_at} = req.body;
    //後端
    const data_member = {account, email, password, created_at};
        data_member.created_at =  new Date();
    const [result_member] = await db.query("INSERT INTO `members` SET ?", [data_member]);
    console.log(result_member);

    if(result_member.affectedRows===1){
        res.json({
            success: true,
            body: req.body,
            sid:result_member.insertId
        });
    } else {
        res.json({
            success: false,
            body: req.body,
        });
    }
})

//react 優惠券
router.post('/coupon', upload.none(), async (req, res)=>{
    const {name, price, code, member_sid, date} = req.body;
    const data_cou = {name, price, code, member_sid, date};
    data_cou.date = new Date();
    console.log('new date',data_cou.date);
    data_cou.date.setMonth(data_cou.date.getMonth() + 1);
    console.log('month+1',data_cou.date);
    const [result_cou] = await db.query("INSERT INTO `coupon` SET ?", [data_cou]);
    console.log(result_cou);
    
    if(result_cou.affectedRows===1){
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

router.get('/coupon/:sid', async (req, res)=>{
    const [rows] = await db.query("SELECT * FROM `coupon` WHERE member_sid=?", [ req.params.sid ]);
    
    res.json(rows)
    //node樣板 改這裡！！！！！！
    //res.render('members/memberedit', rows[0]);
    
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
