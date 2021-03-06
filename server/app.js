const express = require("express");
const app = express();
const morgan = require("morgan");
const bodyParser = require("body-parser");

const rotaOngs = require("./routes/ongs");
const rotaFuncionarios = require("./routes/funcionarios");
const rotaProdutos = require("./routes/produtos");
const rotaMotoristas = require("./routes/motoristas");
const rotaRomaneios = require("./routes/romaneios");
const rotaRemessas = require("./routes/remessas");
const rotaAssinaturas = require("./routes/assinaturas");

// Uso do Morgan para monitoramento de requisições
app.use(morgan("dev"));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json()); // Para dados JSON

// Permissão de origem e cabeçalho para todos os servidores
app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header(
    "Access-Control-Allow-Header",
    "Origin, X-Requested-With, Content-Type, Accept, Authorization"
  );

  if (req.method === "OPTIONS") {
    res.header("Access-Control-Allow-Methods", "PUT, POST, PATCH, DELETE, GET");
    return res.status(200).send({});
  }
  next();
});

// Chamada das rotas das ONGs e Funcionários na aplicação
app.use("/ongs", rotaOngs);
app.use("/funcionarios", rotaFuncionarios);
app.use("/produtos", rotaProdutos);
app.use("/motoristas", rotaMotoristas);
app.use("/romaneios", rotaRomaneios);
app.use("/remessas", rotaRemessas);
app.use("/assinaturas", rotaAssinaturas);

// Tratamento de erro ao não encontrar uma Rota válida
app.use((req, res, next) => {
  const erro = new Error("Rota não encontrada.");
  erro.status = 404;
  next(erro);
});
app.use((error, req, res, next) => {
  res.status(error.status || 500);
  return res.send({
    erro: {
      mensagem: error.message,
    },
  });
});

module.exports = app;
