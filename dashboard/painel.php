<?php
session_start();
if (($_SESSION['tipo_acesso_login']) != 1) {

    header('Location: meus_contratos.php');
} else {
    
}
?>
<!DOCTYPE html>
<html lang="pt-br"> 
    <head>    
        <meta charset="UTF-8"/>
        <meta name="description" content="Gestão Eletronico de Contrato">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <link rel="icon" href="favicon.png">   
        <title>GEC - Gestão Eletronico de Contrato</title>
        <!-- CSS -->
        <link rel="stylesheet" href="css/css.css"/>
        <script type="text/javascript" src="js/jquery-1.6.4.js"></script>        
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet"/>
        <script src="js/jquery.min.js"></script>
    </head>
    <body>
        <!-- Conteúdo -->
        <header>
            <nav class="top-nav">
                <div class="logo-nav">
                    <img src="img/logo_benfica.png"/>
                </div>
                <div class="dados-user-nav">
                    <div class="dados-user">
<?php include('includes/topbar.php'); ?>
                    </div>
                </div>
            </nav>
        </header>
        <div class="barra-lateral">
            <nav>
                <div class="barra-lateral-nav">
<?php include('includes/menu.php'); ?>


                </div>
            </nav>
        </div>
        <!-- BOX CONTEUDO DA PAG -->

        <div class="box-conteudo">
            <article class="article-contract-fim" data-aos="zoom-in" >

                <div class="panels ">
                    <input type="text" class="pesquisar_painel" placeholder="PESQUISAR" id="busca" onkeyup="callApi();">
                    <div class="line-contract-panel"> 
                        <div class="title-contract-panel">
                            <label class="lbl-title-panel">
                                PRÓXIMOS VENCIMENTOS
                            </label>
                        </div>
                    </div>
                    <div class="line-contract-panel">
                        <div class="info-contract-panel">
                            <div class="title-info-contract-panel">
                                <label class="lbl-info-title-panel">
                                    CONTRATO
                                </label>
                            </div>
                        </div>
                        <div class="info-contract-panel">
                            <div class="title-info-contract-panel">
                                <label class="lbl-info-title-panel">
                                    CONTRATANTE
                                </label>
                            </div>
                        </div>

                        <div class="info-contract-panel">
                            <div class="title-info-contract-panel">
                                <label class="lbl-info-title-panel">
                                    CONTRATADO
                                </label>
                            </div>
                        </div>

                        <div class="info-contract-panel">
                            <div class="title-info-contract-panel">
                                <select id="vencimento_contrato" class="lbl-info-title-panel" onchange="callApi();">
                                    <option value="0">VENCIMENTO</option>
                                    <option value="1">VENCIDO</option>
                                    <option value="2">À VENCER</option>
                                </select>
                            </div>
                        </div>

                        <div class="info-contract-panel">
                            <div class="title-info-contract-panel">
                                <label class="lbl-info-title-panel">
                                    SETOR
                                </label>
                            </div>
                        </div>

                        <div class="info-contract-panel">
                            <div class="title-info-contract-panel">
                                <label class="lbl-info-title-panel">
                                    OPÇÃO
                                </label>
                            </div>
                        </div>

                    </div>



                    <div id="result">

                    </div>

                </div>

            </article>

        </div>


        <!-- /BOX CONTEUDO DA PAG -->
        <!-- /Conteúdo -->

        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <script>
                                    AOS.init();
        </script>

        <script  type="text/javascript">
            $("#cadastrar").click(function () {
                location.href = 'cadastro_contrato.php';
            });
            $(document).ready(function () {
                $('#item_painel_contrato').addClass('item-active');
                // document.getElementById("result").innerHTML = "<div class='center-img'><img src='../images/loading.gif' alt='imgLoading' class='img-loading'></div>";
                callApi();
            });

            function callApi() {
                var vencimento = $("#vencimento_contrato").val();
                var busca = $("#busca").val();
                $.ajax({
                    url: "api/api.php",
                    method: "post",

                    data: {request: "proximos_vencimentos",
                        vencimento: vencimento,
                        busca: busca
                    },
                    success: function (data)
                    {
                        document.getElementById("result").innerHTML = data;
                    }
                });
            }
        </script>
    </body>
</html>