const express = require("express");
const router = express.Router();
const db = require("../db").pool;

// Rota para Acessar as informações de todas as remessas cadastradas
router.get("/", (req, res, next) => {
  db.getConnection((err, conn) => {
    if (err) {
      return res.status(500).send({ erro: err });
    }
    conn.query("SELECT * FROM remessas", (err, result, field) => {
      conn.release();
      if (err) {
        return res.status(500).send({ erro: err });
      }
      return res.status(200).send({
        request: {
          tipo: "GET",
          descricao: "Retorna todos os remessas",
          url: "http://localhost:3000/remessas/",
        },
        quantidade: result.length,
        remessas: result,
      });
    });
  });
});

// Rota para cadastrar uma nova remessa
router.post("/", (req, res, next) => {
  db.getConnection((err, conn) => {
    if (err) {
      return res.status(500).send({ erro: err });
    }
    conn.query(
      "INSERT INTO remessas (COD_REMESSA, Data_validade, Quantidade, fk_Produtos_COD_PRODUTO, fk_Romaneios_NUMERO_ROMANEIO) VALUES (?,?,?,?,?)",
      [
        req.body.cod_remessa,
        req.body.data_validade,
        req.body.qtd,
        req.body.cod_produto,
        req.body.numero_romaneio,
      ],
      (err, result, field) => {
        conn.release();
        if (err) {
          return res.status(500).send({ erro: err });
        }
        return res.status(201).send({
          mensagem: "Remessa cadastrada com sucesso",
          request: {
            tipo: "POST",
            descricao: "Cadastra uma remessa",
            url: "http://localhost:3000/remessas",
          },
        });
      }
    );
  });
});

// Rota para acessar as informações de uma remessa específico
router.get("/:cod_remessa", (req, res, next) => {
  db.getConnection((err, conn) => {
    if (err) {
      return res.status(500).send({ erro: err });
    }
    conn.query(
      "SELECT * FROM remessas WHERE COD_REMESSA = ?",
      [req.params.cod_remessa],
      (err, result, field) => {
        conn.release();
        if (err) {
          return res.status(500).send({ erro: err });
        }
        if (result.length == 0) {
          return res.status(404).send({
            erro: "Não foi encontrado uma remessa com esse código",
          });
        }
        return res.status(200).send({
          request: {
            tipo: "GET",
            descricao: "Retorna uma remessa por código",
            url: "http://localhost:3000/remessas",
          },
          romaneio: result,
        });
      }
    );
  });
});

// Rota para excluir uma remessa
router.delete("/", (req, res, next) => {
  db.getConnection((err, conn) => {
    if (err) {
      return res.status(500).send({ erro: err });
    }
    conn.query(
      "DELETE FROM remessas WHERE COD_REMESSA = ?",
      [req.body.cod_remessa],
      (err, result, field) => {
        conn.release();
        if (err) {
          return res.status(500).send({ erro: err });
        }
        return res.status(202).send({
          mensagem: "Remessa removida com sucesso",
          request: {
            tipo: "DELETE",
            descricao: "Remove um remessa",
            url: "http://localhost:3000/remessas",
          },
        });
      }
    );
  });
});

module.exports = router;
