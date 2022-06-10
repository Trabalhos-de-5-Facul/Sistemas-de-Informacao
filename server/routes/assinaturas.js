const express = require("express");
const router = express.Router();
const multer = require("multer");
var storage = multer.diskStorage({
  destination: "uploads/",
  filename: function (req, file, cb) {
    cb(
      null,
      file.fieldname + "-" + Date.now() + path.extname(file.originalname)
    );
  },
});
var upload = multer({
  storage: storage,
});
const db = require("../db").pool;

// Rota para cadastrar a Assinatura de um Romaneio
router.post("/", upload.single("signature"), (req, res, next) => {
  console.log(req.file);
  console.log(req.body);

  return res.send({
    mensagem: "Recebida assinatura?",
  });
  /* 
    db.getConnection((err, conn) => {
      if (err) {
        return res.status(500).send({ erro: err });
      }
      conn.query(
        `UPDATE romaneios
          SET Assinatura      = ?
        WHERE NUMERO_ROMANEIO = ?`,
        [req.body.assinatura, req.body.numero],
        (err, result, field) => {
          conn.release();
          if (err) {
            return res.status(500).send({ erro: err });
          }
          return res.status(202).send({
            mensagem: "Assinatura atualizada com sucesso",
            request: {
              tipo: "PATCH",
              descricao: "Atualiza a assinatura do Romaneio",
              url: "http://localhost:3000/romaneios",
            },
          });
        }
      );
    });*/
});

module.exports = router;
