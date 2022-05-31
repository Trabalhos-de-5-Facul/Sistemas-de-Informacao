const express = require("express");
const router = express.Router();
const db = require("../db").pool;

// Rota para Acessar as informações de todos os motoristas cadastrados
router.get("/", (req, res, next) => {
  db.getConnection((err, conn) => {
    if (err) {
      return res.status(500).send({ erro: err });
    }
    conn.query("SELECT * FROM motoristas", (err, result, field) => {
      conn.release();
      if (err) {
        return res.status(500).send({ erro: err });
      }
      return res.status(200).send({
        request: {
          tipo: "GET",
          descricao: "Retorna todos os motoristas",
          url: "http://localhost:3000/motoristas/",
        },
        quantidade: result.length,
        motoristas: result,
      });
    });
  });
});

// Rota para cadastrar um novo motoristas
router.post("/", (req, res, next) => {
  db.getConnection((err, conn) => {
    if (err) {
      return res.status(500).send({ erro: err });
    }
    conn.query(
      "INSERT INTO motoristas (CPF_FUNCIONARIO, RG, Nome, Telefone, Endereco) VALUES (?,?,?,?,?)",
      [
        req.body.cpf,
        req.body.rg,
        req.body.nome,
        req.body.telefone,
        req.body.endereco,
      ],
      (err, result, field) => {
        conn.release();
        if (err) {
          return res.status(500).send({ erro: err });
        }
        return res.status(201).send({
          mensagem: "Motorista cadastrado com sucesso",
          request: {
            tipo: "POST",
            descricao: "Cadastra um motorista",
            url: "http://localhost:3000/motoristas",
          },
        });
      }
    );
  });
});

// Rota para acessar as informações de um motorista específico
router.get("/:cpf", (req, res, next) => {
  db.getConnection((err, conn) => {
    if (err) {
      return res.status(500).send({ erro: err });
    }
    conn.query(
      "SELECT * FROM motoristas WHERE CPF_FUNCIONARIO = ?",
      [req.params.cpf],
      (err, result, field) => {
        conn.release();
        if (err) {
          return res.status(500).send({ erro: err });
        }
        if (result.length == 0) {
          return res.status(404).send({
            erro: "Não foi encontrado um motorista com esse CPF",
          });
        }
        return res.status(200).send({
          request: {
            tipo: "GET",
            descricao: "Retorna um motorista pelo seu CPF",
            url: "http://localhost:3000/motoristas",
          },
          motorista: result,
        });
      }
    );
  });
});

// Rota para atualizar as informações de um motorista
router.patch("/", (req, res, next) => {
  db.getConnection((err, conn) => {
    if (err) {
      return res.status(500).send({ erro: err });
    }
    conn.query(
      `UPDATE motoristas
        SET CPF_FUNCIONARIO   = ?,
            Nome              = ?,
            RG                = ?,
            Telefone          = ?,
            Endereco          = ?
        WHERE CPF_FUNCIONARIO = ?`,
      [
        req.body.cpf,
        req.body.nome,
        req.body.rg,
        req.body.telefone,
        req.body.endereco,
        req.body.cpf,
      ],
      (err, result, field) => {
        conn.release();
        if (err) {
          return res.status(500).send({ erro: err });
        }
        return res.status(202).send({
          mensagem: "Motorista atualizado com sucesso",
          request: {
            tipo: "PATCH",
            descricao: "Atualiza um motorista",
            url: "http://localhost:3000/motoristas",
          },
        });
      }
    );
  });
});

// Rota para excluir um motorista
router.delete("/", (req, res, next) => {
  db.getConnection((err, conn) => {
    if (err) {
      return res.status(500).send({ erro: err });
    }
    conn.query(
      "DELETE FROM motoristas WHERE CPF_FUNCIONARIO = ?",
      [req.body.cpf],
      (err, result, field) => {
        conn.release();
        if (err) {
          return res.status(500).send({ erro: err });
        }
        return res.status(202).send({
          mensagem: "Motorista removido com sucesso",
          request: {
            tipo: "DELETE",
            descricao: "Remove um motorista",
            url: "http://localhost:3000/motoristas",
          },
        });
      }
    );
  });
});

module.exports = router;
