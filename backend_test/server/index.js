const express = require('express');
const { Server } = require('ws');
const mysql = require('mysql2');

const ongs = require("./routes/ongs");

var db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '1234',
    database: 'ceasa'
});

db.connect(function(err) {
    if(err) throw err;
})

const PORT = process.env.PORT || 3000; //port for https

const server = express()
    .use(express.json())
    .use(express.urlencoded({
        extended: true,
    }))
    .get("/", (req, res) => {
        res.json({ status: "online" });
    });
    
server.use("/ongs", ongs);
/* Error handler middleware */
server.use((err, req, res, next) => {
  const statusCode = err.statusCode || 500;
  console.error(err.message, err.stack);
  res.status(statusCode).json({ message: err.message });
  return;
});

server.listen(PORT, () => console.log(`Listening on ${PORT}`));

const wss = new Server({ server });

wss.on('connection', function(ws, req) {
    ws.on('message', message => {
        var dataString = message.toString();
        console.log(dataString)
    })
})