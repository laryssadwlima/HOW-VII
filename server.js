
const express = require('express');
const mysql = require('mysql2');


const app = express();
const port = 3000;

// banco de dados
const pool = mysql.createPool({
  host: 'localhost', 
  user: 'root',   
  password: '', 
  database: 'imovelhow' 
});

app.get('/pagamentos', (req, res) => {
  const sql = `
    SELECT 
        p.id_venda,
        p.data_do_pagamento,
        p.valor_do_pagamento,
        i.id AS codigo_imovel,
        i.descricao_imovel,
        t.descricao_tipo AS tipo_imovel
    FROM 
        pagamento p
    JOIN 
        imovel i ON p.codigo_imovel = i.id
    JOIN 
        tipo_imovel t ON i.tipo_imovel_id = t.id;
  `;

  pool.query(sql, (error, results) => {
    if (error) {
      return res.status(500).send('Erro na consulta: ' + error.message);
    }

    // Enviar os resultados como resposta JSON
    res.json(results);
  });
});


app.listen(port, () => {
  console.log(`Servidor rodando na porta ${port}`);
});
