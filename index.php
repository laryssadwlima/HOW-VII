<?php

$host = 'localhost'; 
$db = 'imovelhow';
$user = 'root';
$pass = '';

try {
    // Conectar ao banco de dados usando PDO
    $pdo = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Consulta SQL
    $sql = "
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
    ";

    // Preparar e executar a consulta
    $stmt = $pdo->prepare($sql);
    $stmt->execute();

    // Buscar os resultados
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Exibir os resultados
    echo "<h1>Relatório de Pagamentos</h1>";
    echo "<table border='1'>
        <tr>
            <th>ID Venda</th>
            <th>Data do Pagamento</th>
            <th>Valor do Pagamento</th>
            <th>Código do Imóvel</th>
            <th>Descrição do Imóvel</th>
            <th>Tipo de Imóvel</th>
        </tr>";

    foreach ($result as $row) {
        echo "<tr>
            <td>{$row['id_venda']}</td>
            <td>{$row['data_do_pagamento']}</td>
            <td>{$row['valor_do_pagamento']}</td>
            <td>{$row['codigo_imovel']}</td>
            <td>{$row['descricao_imovel']}</td>
            <td>{$row['tipo_imovel']}</td>
        </tr>";
    }

    echo "</table>";

} catch (PDOException $e) {
    echo 'Erro: ' . $e->getMessage();
}
?>
