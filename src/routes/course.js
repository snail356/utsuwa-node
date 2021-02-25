const express = require("express");
const upload = require(__dirname + "/../modules/upload-imgs");
const moment = require("moment-timezone");
const router = express.Router();
const db = require(__dirname + "/../modules/db_connect2");

router.use((req, res, next) => {
  //若無登入就轉向回首頁->此指令使react抓不到node資料
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
const listHandler = async (req) => {
  const perPage = 10;
  const [t_rows] = await db.query("SELECT COUNT(1) num FROM `course_snail`");
  const totalRows = t_rows[0].num;
  const totalPages = Math.ceil(totalRows / perPage);

  let page = parseInt(req.query.page) || 1;

  let rows = [];
  if (totalRows > 0) {
    if (page < 1) page = 1;
    if (page > totalPages) page = totalPages;
    // **********改資料表
    // 顯示一頁有幾筆
    [
      rows,
    ] = await db.query(
      "SELECT * FROM `course_snail` ORDER BY `sid` DESC LIMIT ?, ?",
      [(page - 1) * perPage, perPage]
    );

    //時間格式
    rows.forEach((item) => {
      item.time = moment(item.time).format("YYYY-MM-DD HH:mm");
    });
  }
  return {
    perPage,
    totalRows,
    totalPages,
    page,
    rows,
  };
};

//純json格式
const list = async (req) => {
  let rows = [];
  [rows] = await db.query("SELECT * FROM `course_snail`");
  return rows;
};

//純json category_id = 11
const list1 = async (req) => {
  let rows = [];
  [rows] = await db.query(
    "SELECT * FROM `course_snail` WHERE `category_id`=11"
  );
  //陣列[rows]整包的資料，抓出單筆資料
  rows.forEach((row) => {
    row.time = moment(row.time).format("YYYY-MM-DD HH:mm");
  });

  return rows;
};

//純json category_id = 12
const list2 = async (req) => {
  let rows = [];
  [rows] = await db.query(
    "SELECT * FROM `course_snail` WHERE `category_id`=12"
  );
  //陣列[rows]整包的資料，抓出單筆資料
  rows.forEach((row) => {
    row.time = moment(row.time).format("YYYY-MM-DD HH:mm");
  });
  return rows;
};

//純json category_id = 13
const list3 = async (req) => {
  let rows = [];
  [rows] = await db.query(
    "SELECT * FROM `course_snail` WHERE `category_id`=13"
  );
  //陣列[rows]整包的資料，抓出單筆資料
  rows.forEach((row) => {
    row.time = moment(row.time).format("YYYY-MM-DD HH:mm");
  });
  return rows;
};

//線上課程json
const list4 = async (req) => {
  let rows = [];
  [rows] = await db.query(
    "SELECT * FROM `course_snail` WHERE `category_id`=14"
  );
  return rows;
};

// **********改資料表
// 修改
router.get("/:sid/edit", async (req, res) => {
  const [rows] = await db.query("SELECT * FROM `course_snail` WHERE sid=?", [
    req.params.sid,
  ]);
  if (rows.length !== 1) {
    return res.redirect(res.locals.baseUrl + "/list");
  }

  // **********改樣板位置
  rows[0].time = moment(rows[0].time).format("YYYY-MM-DD");
  res.render("course/courseedit", rows[0]);
});

// 改欄位
router.post("/:sid/edit", upload.none(), async (req, res) => {
  const {
    product_name,
    category_id,
    price,
    photo,
    introduction,
    time,
  } = req.body;
  const data = { product_name, category_id, price, photo, introduction, time };

  // **********改資料表
  const [result] = await db.query("UPDATE `course_snail` SET ? WHERE sid=?", [
    data,
    req.params.sid,
  ]);
  // affectedRows, changedRows
  res.json({
    success: result.changedRows === 1,
  });
});

// **********改資料表
// 刪除
router.delete("/:sid", async (req, res) => {
  const [result] = await db.query("DELETE FROM `course_snail` WHERE sid=?", [
    req.params.sid,
  ]);
  res.json({
    success: result.affectedRows === 1,
  });
});

// **********改資料表
// 新增
router.get("/add", async (req, res) => {
  res.render("course/courseadd");
});
//新增不會新增sid
router.post("/add", upload.none(), async (req, res) => {
  // const data = {...req.body};
  const {
    product_name,
    category_id,
    price,
    photo,
    introduction,
    time,
  } = req.body;
  const data = { product_name, category_id, price, photo, introduction, time };
  //抓現在的時間
  data.time = new Date();
  data.time.format("YYYY-MM-DD HH:mm");
  
  // data.stars =  10;
  // **********改資料表
  const [result] = await db.query("INSERT INTO `course_snail` SET ?", [data]);
  console.log(result);

  if (result.affectedRows === 1) {
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
});

//新增留言--------------------------------------------------------------------
router.get("/add2", async (req, res) => {
  res.render("course/courseadd");
});
router.post("/add1", async (req, res) => {
  // const data = {...req.body};
  const {
    //message_sid,
    sid, //會員sid
    category_id,
    message,
    star,
    message_created_time,
  } = req.body;
  const data = {
    //message_sid,
    sid,
    category_id,
    message,
    star,
    message_created_time: new Date()
  };
  //抓現在的時間
  message_created_time.time = new Date();
  // data.stars =  10;
  // **********改資料表
  const [result] = await db.query("INSERT INTO `message_snail` SET ?", [data]);
  console.log(result);

  if (result.affectedRows === 1) {
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
});

//拿到資料list----------------------------------------------------------------------
const listm = async (req) => {
  //  SET ? WHERE sid=?", [data, req.params.sid]
  let rows = [];
  [rows] = await db.query(
    "select * from members t1 inner join message_snail t2 on t2.sid=t1.sid inner join category t3 on t3.category_id=t2.category_id ORDER BY message_created_time DESC LIMIT 2"
  );
  rows.forEach((row) => {
    row.message_created_time = moment(row.message_created_time).format("YYYY-MM-DD HH:mm");
  });
  return rows;
  
};

//輸出JSON檔-------------------------------------------------------------------------
router.get("/jsonm", async (req, res) => {
  const output = await listm(req);
  res.status(200).json(output);
});

//後台列表
router.get("/list", async (req, res) => {
  const output = await listHandler(req);
  res.render("course/courselist", output);
});

//跑出json檔(但有)
router.get("/api/list", async (req, res) => {
  const output = await listHandler(req);
  res.json(output);
});

//抓上面list的rows
router.get("/json", async (req, res) => {
  const output = await list(req);
  res.status(200).json(output);
});

//抓上面list1的rows
router.get("/json1", async (req, res) => {
  const output = await list1(req);
  res.status(200).json(output);
});

//抓上面list2的rows
router.get("/json2", async (req, res) => {
  const output = await list2(req);
  res.status(200).json(output);
});

//抓上面list3的rows
router.get("/json3", async (req, res) => {
  const output = await list3(req);
  res.status(200).json(output);
});

//抓上面list4的rows
router.get("/json4", async (req, res) => {
  const output = await list4(req);
  res.json(output);
});

// router.get('/', listHandler)

module.exports = router;
