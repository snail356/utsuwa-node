const express = require('express')
const upload = require(__dirname + '/../modules/upload-imgs')
const moment = require('moment-timezone')
const router = express.Router();
const db = require(__dirname + '/../modules/db_connect2');

router.use((req, res, next)=>{
    res.locals.baseUrl = req.baseUrl;
    res.locals.url = req.url;
    next();
});
// function
// 抓所有比數資料
const listHandler = async (req)=>{
    const perPage = 10;
    const [t_rows] = await db.query("SELECT COUNT(1) num FROM `ning_order`");
    const totalRows = t_rows[0].num;    
    const totalPages = Math.ceil(totalRows/perPage);
    let page = parseInt(req.query.page) || 1;
    let rows = [];
    if(totalRows > 0) {
        if(page < 1) page=1;
        if(page>totalPages) page=totalPages;
        // **********改資料表
        // 顯示一頁有幾筆
        [rows] = await db.query("SELECT * FROM `ning_order` ORDER BY `order_id` DESC LIMIT ?, ?",
            [(page-1)* perPage, perPage]);
        // [rows] = await db.query("SELECT COUNT(1) num FROM `ning_order`",
        //     [(page-1)* perPage, perPage]);
    }
    return {
        perPage,
        totalRows,
        totalPages,
        page,
        rows,
        // baby_rows
    }
};
// only node 
// 訂單資訊列表
router.get('/orderlist', async (req, res)=>{
    const output = await listHandler(req);
    res.render('orders/orderlist', output);
})
// react -> node
// fetch post 訂單資訊
router.post('/add', upload.none(), async (req, res)=>{
    // const data = {...req.body};
    const {sid,product_name,price,amount,color,size,introduction,customize,discount,totals,selectpay,selecttransform,orderDay,orderName,orderTel,orderEmail,orderRecipient,orderRecipientAddress,orderRecipientTel,ordercreditcard,ordercreditcardcheck,ordercreditcardmonth,ordercreditcardname,ordercreditcardyear,orderinvoice,orderinvoicearea,orderinvoicetype,orderarrivaladdress,orderarrivaldate,orderarrivaltime,shippingStatus,member_sid} = req.body;
    const data = {sid,product_name,price,amount,color,size,introduction,customize,discount,totals,selectpay,selecttransform,orderDay,orderName,orderTel,orderEmail,orderRecipient,orderRecipientAddress,orderRecipientTel,ordercreditcard,ordercreditcardcheck,ordercreditcardmonth,ordercreditcardname,ordercreditcardyear,orderinvoice,orderinvoicearea,orderinvoicetype,orderarrivaladdress,orderarrivaldate,orderarrivaltime,shippingStatus,member_sid};
        
    const [result] = await db.query("INSERT INTO `ning_order` SET ?", [data]);
    console.log(result);

    if(result.affectedRows===1){
        res.json({
            success: true,
            body: req.body,
            // sid: req.session.product_chang.product_id
        });
    } else {
        res.json({
            success: false,
            body: req.body,
        });
    }
})

router.get('/orderlist/:sid', upload.none(), async (req, res)=>{
    const [rows] = await db.query("SELECT * FROM `ning_order` WHERE member_sid=?", [ req.params.sid ]);
    res.json(rows)
})


// react -> node
// fetch get 訂單資訊
router.get('/order', upload.none(), async (req, res)=>{
    const [rows] = await db.query("SELECT * FROM `ning_order` ORDER BY `order_id` DESC LIMIT 1");
    res.json(rows)
})

module.exports = router;
