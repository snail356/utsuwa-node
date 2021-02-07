require('dotenv').config();

const express = require('express');
const session = require('express-session');
const MysqlStore = require('express-mysql-session')(session);
const cors = require('cors');
const axios = require('axios');
const cheerio = require('cheerio');
const jwt = require('jsonwebtoken');

const moment = require('moment-timezone');
const multer = require('multer');
// const upload = multer({dest: 'tmp_uploads/'});
const upload = require(__dirname + '/modules/upload-imgs')
const db = require(__dirname + '/modules/db_connect2')
const sessionStore = new MysqlStore({}, db)

const app = express();

app.set('view engine', 'ejs');


app.use(express.static('public'));

app.use(express.urlencoded({extended:false}));
app.use(express.json());
app.use(session({
    secret: 'sdkjghoif39097894508tyighdsgkgiso',
    saveUninitialized: false,
    resave: false,
    store: sessionStore,
    cookie: {
        maxAge: 1800000
    }
}));

const corsOptions = {
    credentials: true,
    origin: function(origin, cb){
        console.log('origin:', origin);
        cb(null, true);
    }
}

app.use(cors(corsOptions));
app.use((req, res, next)=>{
    res.locals.baseUrl = req.baseUrl;
    res.locals.url = req.url;
    res.locals.sess = req.session;
    next();
});

app.get('/', (req, res)=>{
    res.render('a', {name:'首頁'})
})

app.get('/try-ejs', (req, res)=>{
    res.render('a', {name:'Shinder'})
})

app.get('/json-sales', (req, res)=>{
    const sales = require(__dirname + '/../data/sales')

    res.render('json-sales', {sales});

})

app.get('/try-qs', (req, res)=>{
    res.json(req.query);
})

app.post('/try-post', (req, res)=>{
    res.json(req.body);
})

app.get('/try-post-form', (req, res)=>{
    res.render('try-post-form')
})

app.post('/try-post-form', (req, res)=>{
    res.render('try-post-form', req.body)
})

app.get('/pending', (req, res)=>{
    // res.send('ok')
})

app.post('/try-upload', upload.single('avatar'), (req, res)=>{
    res.json({
        file: req.file,
        body: req.body,
    })
})
app.post('/try-upload2', upload.array('photo'), (req, res)=>{
    res.json(req.files)
})

app.get('/my-params1/:action/:id', (req, res)=>{
    req.params.second = true;
    res.json(req.params)
})

app.get('/my-params1/:action?/:id?', (req, res)=>{
    req.params.first = true;
    res.json(req.params)
})

app.get(/^\/m\/09\d{2}-?\d{3}-?\d{3}$/i, (req, res)=>{
    let u = req.url.slice(3);
    u = u.split('?')[0]; // query string 的部份不要
    // u = u.split('-').join('');
    u = u.replace(/-/g, '')
    res.send(u)
})

app.use('/ttt', require(__dirname + '/routes/admin2'));
app.use('/', require(__dirname + '/routes/admin2'));

app.get('/try-session', (req, res)=>{
    req.session.my_var = req.session.my_var || 0;
    req.session.my_var++;

    res.json({
        my_var: req.session.my_var,
        session: req.session
    })
})

app.get('/try-moment', (req, res)=>{
    const fm = 'YYYY-MM-DD HH:mm:ss';
    const m1 = moment();
    const m2 = moment('02/29/20', 'MM/DD/YY');

    res.json({
        m1: m1.format(fm),
        m1a: m1.tz('Europe/London').format(fm),
        m2: m2.format(fm),
        m2a: m2.tz('Europe/London').format(fm),
    })
})


app.get('/try-db', async (req, res)=>{
    const [rows] = await db.query("SELECT * FROM `address_book` ORDER BY `sid` DESC LIMIT 6")
    res.json(rows);
})

app.use('/address-book', require(__dirname + '/routes/address-book'))

// 張洛慈 bidding
app.use('/bidding', require(__dirname + '/routes/bidding'))

// 



app.get('/login', async (req, res)=>{
    res.render('login');
})
app.post('/login', upload.none(), async (req, res)=>{
    const [rows] = await db.query("SELECT * FROM admins WHERE account=? AND password=SHA1(?)",
        [req.body.account, req.body.password]);

    if(rows.length===1){
        req.session.admin = rows[0];
        res.json({
            success: true,
        })
    } else {
        res.json({
            success: false,
            body: req.body
        })
    }
})

app.post('/login-jwt', async (req, res)=>{
    const [rows] = await db.query("SELECT sid, account, nickname FROM admins WHERE account=? AND password=SHA1(?)",
        [req.body.account, req.body.password]);

    if(rows.length===1){
        const token = jwt.sign({...rows[0]}, process.env.JWT_KEY);
        res.json({
            success: true,
            token,
        })
    } else {
        res.json({
            success: false,
            body: req.body
        })
    }
})

app.post('/verify-jwt', async (req, res)=>{
    jwt.verify(req.body.token, process.env.JWT_KEY, (error, payload)=>{
        if(error){
            res.json({error});
        } else {
            res.json(payload);
        }
    })
})

// https://bitbucket.org/lsd0125/mfee09-nodejs/src/b048607a7de353e58e5e45f12c83763bc0d9184a/public/set_jwt_token.html
app.post('/verify2-jwt', async (req, res)=>{
    let token = req.get('Authorization');
    if(token.indexOf('Bearer ')===0){
        token = token.slice(7);
        jwt.verify(token, process.env.JWT_KEY, (error, payload)=>{
            if(error){
                res.json({error});
            } else {
                res.json(payload);
            }
        })
    } else {
        res.json({error: 'bad bearer token'});
    }

})

app.get('/logout', (req, res)=>{
    delete req.session.admin;
    res.redirect('/');
})

app.get('/yahoo', async (req, res)=>{
    const response = await axios.get('https://tw.yahoo.com/');
    res.send(response.data);
})

app.get('/yahoo2', async (req, res)=>{
    const response = await axios.get('https://tw.yahoo.com/');
    // res.send(response.data);
    const $ = cheerio.load(response.data);

    $('img').each(function(i, el){
        res.write(el.attribs.src + "\n");
    })
    res.end('');
})


app.use((req, res)=>{
    res.type('text/plain');
    res.status(404).send('找不到頁面')
})

const port = process.env.PORT || 3000;
app.listen(port, ()=>{
    console.log(`port: ${port}`, new Date());
})