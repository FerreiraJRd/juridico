<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
        include './persistencia/Conexao.php';
        include './classes/Search.class.php';

        $idLog = 1;
        $desc = Search::TiposLog($idLog);
        echo $desc;
        ?>
    </body>
</html>
