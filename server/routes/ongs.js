const express = require("express");
const router = express.Router();
const db = require("../db").pool;

// Rota para Acessar as informações de todas as ONGs cadastradas
router.get("/", (req, res, next) => {
  db.getConnection((err, conn) => {
    if (err) {
      return res.status(500).send({ erro: err });
    }
    conn.query("SELECT * FROM ongs", (err, result, field) => {
      conn.release();
      if (err) {
        return res.status(500).send({ erro: err });
      }
      return res.status(200).send({
        request: {
          tipo: "GET",
          descricao: "Retorna todas as ONGs",
          url: "http://localhost:3000/ongs/",
        },
        quantidade: result.length,
        ongs: result,
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
      "INSERT INTO ongs (Nome, Rua, Numero, Bairro, Cidade, Estado, CEP, Nome_Diretora) VALUES (?,?,?,?,?,?,?,?)",
      [
        req.body.nome,
        req.body.rua,
        req.body.numero,
        req.body.bairro,
        req.body.cidade,
        req.body.estado,
        req.body.cep,
        req.body.nome_diretora,
      ],
      (err, result, field) => {
        conn.release();
        if (err) {
          return res.status(500).send({ erro: err });
        }
        return res.status(201).send({
          mensagem: "ONG cadastrada com sucesso",
          ongID: result.insertId,
          request: {
            tipo: "POST",
            descricao: "Cadastra uma ONG",
            url: "http://localhost:3000/ongs",
          },
        });
      }
    );
  });
});

// Rota para acessar as informações de uma ONG específica
router.get("/:cod_ong", (req, res, next) => {
  db.getConnection((err, conn) => {
    if (err) {
      return res.status(500).send({ erro: err });
    }
    conn.query(
      "SELECT * FROM ongs WHERE COD_ONG = ?",
      [req.params.cod_ong],
      (err, result, field) => {
        conn.release();
        if (err) {
          return res.status(500).send({ erro: err });
        }
        if (result.length == 0) {
          return res.status(404).send({
            erro: "Não foi encontrada ONG com esse código",
          });
        }
        return res.status(200).send({
          request: {
            tipo: "GET",
            descricao: "Retorna uma ONG",
            url: "http://localhost:3000/ongs",
          },
          ongs: result,
        });
      }
    );
  });
});

// Rota para atualizar uma ONG
router.patch("/", (req, res, next) => {
  db.getConnection((err, conn) => {
    if (err) {
      return res.status(500).send({ erro: err });
    }
    conn.query(
      `UPDATE ongs
        SET Nome          = ?,
            Rua           = ?,
            Numero        = ?,
            Bairro        = ?,
            Cidade        = ?,
            Estado        = ?,
            CEP           = ?,
            Nome_Diretora = ?
      WHERE COD_ONG       = ?`,
      [
        req.body.nome,
        req.body.rua,
        req.body.numero,
        req.body.bairro,
        req.body.cidade,
        req.body.estado,
        req.body.cep,
        req.body.nome_diretora,
        req.body.cod_ong,
      ],
      (err, result, field) => {
        conn.release();
        if (err) {
          return res.status(500).send({ erro: err });
        }
        return res.status(202).send({
          mensagem: "ONG atualizada com sucesso",
          request: {
            tipo: "PATCH",
            descricao: "Atualiza uma ONG",
            url: "http://localhost:3000/ongs",
          },
        });
      }
    );
  });
});

// Rota para excluir uma ONG
router.delete("/", (req, res, next) => {
  db.getConnection((err, conn) => {
    if (err) {
      return res.status(500).send({ erro: err });
    }
    conn.query(
      "DELETE FROM ongs WHERE COD_ONG = ?",
      [req.body.cod_ong],
      (err, result, field) => {
        conn.release();
        if (err) {
          return res.status(500).send({ erro: err });
        }
        return res.status(202).send({
          mensagem: "ONG removida com sucesso",
          request: {
            tipo: "DELETE",
            descricao: "Remove uma ONG",
            url: "http://localhost:3000/ongs",
          },
        });
      }
    );
  });
});

module.exports = router;
