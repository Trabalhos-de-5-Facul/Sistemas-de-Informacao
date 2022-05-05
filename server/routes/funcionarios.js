const express = require("express");
const router = express.Router();
const db = require("../db").pool;

// Rota para Acessar as informações de todos os funcionários cadastrados
router.get("/", (req, res, next) => {
  db.getConnection((err, conn) => {
    if (err) {
      return res.status(500).send({ erro: err });
    }
    conn.query("SELECT * FROM funcionarios_ongs", (err, result, field) => {
      conn.release();
      if (err) {
        return res.status(500).send({ erro: err });
      }
      return res.status(200).send({
        request: {
          tipo: "GET",
          descricao: "Retorna todos os funcionários",
          url: "http://localhost:3000/funcionarios/",
        },
        quantidade: result.length,
        funcionarios: result,
      });
    });
  });
});

// Rota para cadastrar um novo funcionário
router.post("/", (req, res, next) => {
  db.getConnection((err, conn) => {
    if (err) {
      return res.status(500).send({ erro: err });
    }
    conn.query(
      "INSERT INTO funcionarios_ongs (CPF_FUNCIONARIO, Nome, RG, Telefone, Endereco, fk_ONGs_COD_ONG) VALUES (?,?,?,?,?)",
      [
        req.body.cpf,
        req.body.nome,
        req.body.rg,
        req.body.telefone,
        req.body.endereco,
        req.body.cod_ong,
      ],
      (err, result, field) => {
        conn.release();
        if (err) {
          return res.status(500).send({ erro: err });
        }
        return res.status(201).send({
          mensagem: "Funcionário cadastrado com sucesso",
          request: {
            tipo: "POST",
            descricao: "Cadastra um funcionário",
            url: "http://localhost:3000/funcionarios",
          },
        });
      }
    );
  });
});

// Rota para acessar as informações de um funcionário específico
router.get("/:cod_ong", (req, res, next) => {
  db.getConnection((err, conn) => {
    if (err) {
      return res.status(500).send({ erro: err });
    }
    conn.query(
      "SELECT * FROM funcionarios_ongs WHERE fk_ONGs_COD_ONG = ?",
      [req.params.cod_ong],
      (err, result, field) => {
        conn.release();
        if (err) {
          return res.status(500).send({ erro: err });
        }
        if (result.length == 0) {
          return res.status(404).send({
            erro: "Não foi encontrado um funcionário dessa ONG",
          });
        }
        return res.status(200).send({
          request: {
            tipo: "GET",
            descricao: "Retorna funcionário(s) de uma ONG",
            url: "http://localhost:3000/funcionarios",
          },
          funcionario: result,
        });
      }
    );
  });
});

// Rota para atualizar as informações de um funcionário
router.patch("/", (req, res, next) => {
  db.getConnection((err, conn) => {
    if (err) {
      return res.status(500).send({ erro: err });
    }
    conn.query(
      `UPDATE ongs
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
          mensagem: "Funcionário atualizado com sucesso",
          request: {
            tipo: "PATCH",
            descricao: "Atualiza um funcionário",
            url: "http://localhost:3000/funcionarios",
          },
        });
      }
    );
  });
});

// Rota para excluir um funcionário
router.delete("/", (req, res, next) => {
  db.getConnection((err, conn) => {
    if (err) {
      return res.status(500).send({ erro: err });
    }
    conn.query(
      "DELETE FROM funcionarios_ongs WHERE CPF_FUNCIONARIO = ?",
      [req.body.cpf],
      (err, result, field) => {
        conn.release();
        if (err) {
          return res.status(500).send({ erro: err });
        }
        return res.status(202).send({
          mensagem: "Funcionário removido com sucesso",
          request: {
            tipo: "DELETE",
            descricao: "Remove um funcionário",
            url: "http://localhost:3000/funcionarios",
          },
        });
      }
    );
  });
});

module.exports = router;
