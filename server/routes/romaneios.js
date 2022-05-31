const express = require("express");
const router = express.Router();
const db = require("../db").pool;

// Rota para Acessar as informações de todos os romaneios cadastrados
router.get("/", (req, res, next) => {
  db.getConnection((err, conn) => {
    if (err) {
      return res.status(500).send({ erro: err });
    }
    conn.query("SELECT * FROM romaneios", (err, result, field) => {
      conn.release();
      if (err) {
        return res.status(500).send({ erro: err });
      }
      return res.status(200).send({
        request: {
          tipo: "GET",
          descricao: "Retorna todos os romaneios",
          url: "http://localhost:3000/romaneios/",
        },
        quantidade: result.length,
        romaneios: result,
      });
    });
  });
});

// Rota para cadastrar um novo romaneio
router.post("/", (req, res, next) => {
  db.getConnection((err, conn) => {
    if (err) {
      return res.status(500).send({ erro: err });
    }
    conn.query(
      "INSERT INTO romaneios (NUMERO_ROMANEIO, Sequencia, Data, Codigo_Produto, QTD, CPF, fk_ONGs_COD_ONG, fk_Motoristas_CPF_FUNCIONARIO, assinatura) VALUES (?,?,?,?,?,?,?,?,?)",
      [
        req.body.numero,
        req.body.sequencia,
        req.body.data,
        req.body.codigo_produto,
        req.body.qtd,
        req.body.cpf,
        req.body.cod_ong,
        req.body.cpf_funcionario,
        req.body.assinatura,
      ],
      (err, result, field) => {
        conn.release();
        if (err) {
          return res.status(500).send({ erro: err });
        }
        return res.status(201).send({
          mensagem: "Romaneio cadastrado com sucesso",
          request: {
            tipo: "POST",
            descricao: "Cadastra um romaneio",
            url: "http://localhost:3000/romaneios",
          },
        });
      }
    );
  });
});

// Rota para acessar as informações de um romaneio específico
router.get("/:numero", (req, res, next) => {
  db.getConnection((err, conn) => {
    if (err) {
      return res.status(500).send({ erro: err });
    }
    conn.query(
      "SELECT * FROM romaneios WHERE NUMERO_ROMANEIO = ?",
      [req.params.numero],
      (err, result, field) => {
        conn.release();
        if (err) {
          return res.status(500).send({ erro: err });
        }
        if (result.length == 0) {
          return res.status(404).send({
            erro: "Não foi encontrado um romaneio desse número",
          });
        }
        return res.status(200).send({
          request: {
            tipo: "GET",
            descricao: "Retorna um romaneio pelo número",
            url: "http://localhost:3000/romaneios",
          },
          romaneio: result,
        });
      }
    );
  });
});

// Rota para excluir um romaneio
router.delete("/", (req, res, next) => {
  db.getConnection((err, conn) => {
    if (err) {
      return res.status(500).send({ erro: err });
    }
    conn.query(
      "DELETE FROM romaneios WHERE NUMERO_ROMANEIO = ?",
      [req.body.numero],
      (err, result, field) => {
        conn.release();
        if (err) {
          return res.status(500).send({ erro: err });
        }
        return res.status(202).send({
          mensagem: "Romaneio removido com sucesso",
          request: {
            tipo: "DELETE",
            descricao: "Remove um romaneio",
            url: "http://localhost:3000/romaneios",
          },
        });
      }
    );
  });
});

module.exports = router;
