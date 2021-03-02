const express = require('express')
const upload = require(__dirname + '/../modules/upload-imgs')
const moment = require('moment-timezone')
const router = express.Router();
const db = require(__dirname + '/../modules/db_connect2');
const nodemailer = require('nodemailer');
const ejs = require('ejs');
const  fs = require("fs"); 

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
            item.bid_created_time = moment(item.bid_created_time).format('YYYY-MM-DD HH:mm');
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
// card路由
const list = async (req)=>{
    let rows = [];
    [rows] = await db.query("select photo,bid_product_number,bid_sum_money,bid_deadline from product_chang t1 inner join bidding_chang t2 on t1.product_id=t2.product_id");
    return rows
};

// 競標列表路由
const list2 = async (req)=>{
   
    let rows = [];
    [rows] = await db.query("select avatar,account,bid_product_number,bid_created_time,bid_add_money,bid_sum_money from members t1 inner join product_chang t2 on t2.sid=t1.sid inner join bidding_chang t3 on t3.sid=t1.sid ORDER BY bid_created_time DESC");
    
    // localStorage.getItem(product_id)
    return rows
};

// 競標id路由
const list3 = async (req)=>{
   
    //  SET ? WHERE sid=?", [data, req.params.sid]
    let rows = [];
    [rows] = await db.query("select * from members t1 inner join product_chang t2 on t2.sid=t1.sid inner join bidding_chang t3 on t3.sid=t1.sid ORDER BY bid_created_time DESC");
    rows.forEach((row) => {
        row.bid_created_time = moment(row.bid_created_time).format("YYYY-MM-DD HH:mm");
      });
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

// avatar,account,bid_product_number,bid_created_time,bid_add_money,bid_sum_money
router.post('/add', upload.none(), async (req, res)=>{
    // const data = {...req.body};
    const {sid, product_id, bid_created_time, bid_add_money, bid_sum_money} = req.body;
    const data = {sid, product_id, bid_created_time, bid_add_money, bid_sum_money};
        data.bid_created_time =  new Date();

        console.log('data.bid_sum_money', data.bid_sum_money);
        data.bid_sum_money= parseInt(data.bid_add_money) + parseInt(data.bid_sum_money || 0);
        
        // data.bid_sum_money+= list
  
        // data.bid_product_number = JSON.parse(localStorage.getItem('product_id')) || []
        
    // data.stars =  10;
    const [result] = await db.query("INSERT INTO `bidding_chang` SET ?", [data]);
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

router.get('/json3', async (req, res)=>{
    const output = await list3(req);
    res.status(200).json(output);
})


// router.get('/', listHandler)
//這邊改寄送email

//看EMAIL長怎樣
router.get('/email', async (req, res)=>{
    res.render('bidding');
})
//真正寄送
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
      ejs.renderFile(__dirname +"/../../views/bidding.ejs", function (err, html) { 
        if (err) { 
            console.log(err); 
        } 
        else{
            transporter.sendMail({
                from: '"utsuwa 窯" <utsuwappottery@gmail.com>', 
                to:req.body.email, 
                subject: "utsuwa 窯 - 競標得標通知",  
                html: html,
              }, 
              function(error, info){
                if(error){
                    console.log(error);
                }else{
                    console.log('訊息發送: ' + info.response);
                }
                res.send('ok')
            });
        }

      });
  })
module.exports = router;
