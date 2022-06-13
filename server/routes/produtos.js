const express = require("express");
const router = express.Router();
const db = require("../db").pool;

// Rota para Acessar as informações de todas as ONGs cadastradas
router.get("/", (req, res, next) => {
  db.getConnection((err, conn) => {
    if (err) {
      return res.status(500).send({ erro: err });
    }
    conn.query("SELECT * FROM produtos", (err, result, field) => {
      conn.release();
      if (err) {
        return res.status(500).send({ erro: err });
      }
      return res.status(200).send({
        request: {
          tipo: "GET",
          descricao: "Retorna todas os produtos",
          url: "http://localhost:3000/produtos/",
        },
        quantidade: result.length,
        produtos: result,
      });
    });
  });
});

// Rota para cadastrar uma nova ONG
router.post("/", (req, res, next) => {
  db.getConnection((err, conn) => {
    if (err) {
      return res.status(500).send({ erro: err });
    }
    conn.query(
      "INSERT INTO produtos (Nome, Fornecedor, Lote, Perecivel) VALUES (?,?,?,?)",
      [
        req.body.Nome,
        req.body.Fornecedor,
        req.body.Lote,
        Boolean(req.body.Perecivel),
      ],
      (err, result, field) => {
        conn.release();
        if (err) {
          return res.status(500).send({ erro: err });
        }
        return res.status(201).send({
          mensagem: "Produto cadastrado com sucesso",
          produtoID: result.insertId,
          request: {
            tipo: "POST",
            descricao: "Cadastra um produto",
            url: "http://localhost:3000/produtos",
          },
        });
      }
    );
  });
});

/*
// Rota para acessar as informações de um produto específico
router.get("/:cod_produto", (req, res, next) => {
  db.getConnection((err, conn) => {
    if (err) {
      return res.status(500).send({ erro: err });
    }
    conn.query(
      "SELECT * FROM produtos WHERE COD_PRODUTO = ?",
      [req.params.cod_produto],
      (err, result, field) => {
        conn.release();
        if (err) {
          return res.status(500).send({ erro: err });
        }
        if (result.length == 0) {
          return res.status(404).send({
            erro: "Não foi encontrado um produto com esse código",
          });
        }
        return res.status(200).send({
          request: {
            tipo: "GET",
            descricao: "Retorna um Produto",
            url: "http://localhost:3000/produtos",
          },
          produtos: result,
        });
      }
    );
  });
});
*/

// Rota para atualizar um Produto
router.patch("/", (req, res, next) => {
  db.getConnection((err, conn) => {
    if (err) {
      return res.status(500).send({ erro: err });
    }
    conn.query(
      `UPDATE produtos
        SET Nome          = ?,
            Fornecedor    = ?,
            Lote          = ?,
            Perecivel     = ?
      WHERE COD_PRODUTO   = ?`,
      [
        req.body.nome,
        req.body.fornecedor,
        req.body.lote,
        req.body.perecivel,
        req.body.cod_produto,
      ],
      (err, result, field) => {
        conn.release();
        if (err) {
          return res.status(500).send({ erro: err });
        }
        return res.status(202).send({
          mensagem: "Produto atualizado com sucesso",
          request: {
            tipo: "PATCH",
            descricao: "Atualiza um Produto",
            url: "http://localhost:3000/produtos",
          },
        });
      }
    );
  });
});

//Rota para excluir um Produto
router.delete("/", (req, res, next) => {
  db.getConnection((err, conn) => {
    if (err) {
      return res.status(500).send({ erro: err });
    }
    conn.query(
      "DELETE FROM produtos WHERE COD_PRODUTO = ?",
      [req.body.cod_produto],
      (err, result, field) => {
        conn.release();
        if (err) {
          return res.status(500).send({ erro: err });
        }
        return res.status(202).send({
          mensagem: "Produto removido com sucesso",
          request: {
            tipo: "DELETE",
            descricao: "Remove um produto",
            url: "http://localhost:3000/produtos",
          },
        });
      }
    );
  });
});

module.exports = router;
