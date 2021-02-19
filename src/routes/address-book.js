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

const listHandler = async (req)=>{
    const perPage = 10;
    const [t_rows] = await db.query("SELECT COUNT(1) num FROM `address_book`");
    const totalRows = t_rows[0].num;
    const totalPages = Math.ceil(totalRows/perPage);

    let page = parseInt(req.query.page) || 1;

    let rows = [];
    if(totalRows > 0) {
        if(page < 1) page=1;
        if(page>totalPages) page=totalPages;
        [rows] = await db.query("SELECT * FROM `address_book` ORDER BY `sid` DESC LIMIT ?, ?",
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


//我的寶貝sql
const list = async (req)=>{
   
    let rows = [];
    [rows] = await db.query("SELECT * FROM `bidding_chang`");
    return rows
};

const list2 = async (req)=>{
   
    let rows = [];
    [rows] = await db.query("select avatar,account,bid_product_number,bid_add_money,bid_sum_money from members t1 inner join bidding_chang t2 on t2.sid=t1.sid");
    return rows
};

router.get('/:sid/edit', async (req, res)=>{
    const [rows] = await db.query("SELECT * FROM `address_book` WHERE sid=?", [ req.params.sid ]);
    if(rows.length !== 1){
        return res.redirect( res.locals.baseUrl + '/list' );
    }
    rows[0].birthday = moment(rows[0].birthday).format('YYYY-MM-DD');
    res.render('address-book/edit', rows[0]);
})

router.post('/:sid/edit', upload.none(), async (req, res)=>{
    const {name, email, mobile, birthday, address} = req.body;
    const data = {name, email, mobile, birthday, address};

    const [result] = await db.query("UPDATE `address_book` SET ? WHERE sid=?", [data, req.params.sid]);
    // affectedRows, changedRows
    res.json({
        success: result.changedRows===1
    });
})

router.delete('/:sid', async (req, res)=>{
    const [result] = await db.query("DELETE FROM `address_book` WHERE sid=?", [ req.params.sid ]);
    res.json({
        success: result.affectedRows===1
    });
})


router.get('/add', async (req, res)=>{
    res.render('address-book/add');
})
router.post('/add', upload.none(), async (req, res)=>{
    // const data = {...req.body};
    const {name, email, mobile, birthday, address} = req.body;
    const data = {name, email, mobile, birthday, address};
        data.created_at =  new Date();
    // data.stars =  10;
    const [result] = await db.query("INSERT INTO `address_book` SET ?", [data]);
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
    res.render('address-book/list', output);
})

router.get('/api/list', async (req, res)=>{
    const output = await listHandler(req);
    res.json(output);
})


//我的寶貝
router.get('/json', async (req, res)=>{
    const output = await list(req);
    res.status(200).json(output);
})

router.get('/json2', async (req, res)=>{
    const output = await list2(req);
    res.status(200).json(output);
})


// router.get('/', listHandler)

module.exports = router;
