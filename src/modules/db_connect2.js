const mysql = require('mysql2');

const pool = mysql.createPool({
    host: 'localhost',
    user: 'chang',
    password: 'aaa12345',
    database: 'utsuwa',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

module.exports = pool.promise();