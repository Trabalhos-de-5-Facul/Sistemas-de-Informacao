var mysql = require('mysql2');

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "1234",
  database: "ceasa"
});

con.connect(function(err) {
  if (err) throw err;

  //Create
  console.log("Conectado!");
  var sql = "INSERT INTO ongs (Nome, Rua, Numero, Bairro, Cidade, Estado, CEP, Nome_Diretora) VALUES ('Test', 'Rua Nova', 12348765, 'Jardim Novo', 'TestVille', 'NA', '98765678', 'Rose')";
  con.query(sql, function (err) {
    if (err) throw err;
    console.log("Inserido na tabela");
  });

  //Read
  con.query("SELECT * FROM ongs", function (err, result) {
    if (err) throw err;
    console.log(result);
  });

  //Update
  var update_ong = "UPDATE ongs SET Nome = 'Mudando' WHERE Estado = 'NA'";
  con.query(update_ong, function (err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " ongs modificadas");
  });

  //Delete
  /*
  var delete_ong = "DELETE FROM ongs WHERE Estado = 'NA'";
  con.query(delete_ong, function (err, result) {
    if (err) throw err;
    console.log("Número de ongs deletadas: " + result.affectedRows);
  });
  */

});