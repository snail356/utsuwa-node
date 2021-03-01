const express = require('express')
const upload = require(__dirname + '/../modules/upload-imgs')
const moment = require('moment-timezone')
const router = express.Router();
const db = require(__dirname + '/../modules/db_connect2');
const nodemailer = require('nodemailer');
const ejs = require('ejs');
const  fs = require("fs"); 

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


const ordercart = req.body.ordercart;

ordercart.map(async(item,index)=>{
    const data={
        sid:item.sid,
        product_name:item.product_name,
        price:item.price,
        amount:item.amount,
        color:item.color,
        size:item.size,
        introduction:item.introduction,
        customize:item.customize,
        // CheckoutP1
        discount:req.body.discount,
        totals:req.body.totals,
        selectpay:req.body.selectpay,
        selecttransform:req.body.selecttransform,
        // CheckoutP2
        orderDay:req.body.orderDay,
        orderName:req.body.orderName,
        orderTel:req.body.orderTel,
        orderEmail:req.body.orderEmail,
        orderRecipient:req.body.orderRecipient,
        orderRecipientAddress:req.body.orderRecipientAddress,
        orderRecipientTel:req.body.orderRecipientTel,
        ordercreditcard:req.body.ordercreditcard,
        ordercreditcardcheck:req.body.ordercreditcardcheck,
        ordercreditcardmonth:req.body.ordercreditcardmonth,
        ordercreditcardname:req.body.ordercreditcardname,
        ordercreditcardyear:req.body.ordercreditcardyear,
        orderinvoice:req.body.orderinvoice,
        orderinvoicearea:req.body.orderinvoicearea,
        orderinvoicetype:req.body.orderinvoicetype,
        orderarrivaladdress:req.body.orderarrivaladdress,
        orderarrivaldate:req.body.orderarrivaldate,
        orderarrivaltime:req.body.orderarrivaltime,
        shippingStatus:req.body.shippingStatus,
        ordernum:req.body.ordernum,
        member_sid:req.body.member_sid,
       
    }
    const [result] = await db.query("INSERT INTO `ning_order` SET ?", [data]);
    
})
res.json({msg:'ok'})
})

router.get('/orderlist/:sid', upload.none(), async (req, res)=>{
    const [rows] = await db.query("SELECT * FROM `ning_order` WHERE member_sid=? group by `ordernum`", [ req.params.sid ]);
    // const [rows] = await db.query("SELECT * FROM `ning_order` WHERE member_sid=?", [ req.params.sid ]);
    res.json(rows)
})

router.get('/orderdetail/:sid', upload.none(), async (req, res)=>{
    const [rows] = await db.query("SELECT * FROM `ning_order` WHERE `ordernum`=?", [ req.params.sid ]);
    res.json(rows)
})

// react -> node
// fetch get 訂單資訊
// router.get('/order', upload.none(), async (req, res)=>{
//     const [rows] = await db.query("SELECT * FROM `ning_order` ORDER BY `order_id` DESC LIMIT 1");
//     res.json(rows)
// })
router.get('/email', async (req, res)=>{
    res.render('order');
})

router.post('/email',async(req,res)=>{
    let transporter = nodemailer.createTransport({
        host: "smtp.gmail.com",
        port: 587,
        secure: false, // true for 465, false for other ports
        auth: {
          user: 'utsuwappottery@gmail.com',
          pass:'pottery1234',
        },
        tls: {
            rejectUnauthorized: false
        }
      });
      ejs.renderFile(__dirname +"/../../views/order.ejs", function (err, html) { 
        if (err) { 
            console.log(err); 
        } 
        else{
            transporter.sendMail({
                from: '"utsuwa 窯" <utsuwappottery@gmail.com>', 
                to:req.body.member_email, 
                subject: "utsuwa 窯 - 訂購完成通知",  
                html: html,
              }, 
              function(error, info){
                if(error){
                    console.log(error);
                }else{
                    console.log('訊息發送: ' + info.response);
                }
            });
        }

      });
  })


module.exports = router;
