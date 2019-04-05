<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="../css/style.css" />
        <link rel="icon" href="favicon.png">
        <title></title>
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet"/>
        <script src="../js/jquery.min.js"></script>
        <script type="text/javascript">

        </script>
    </head>
    <body>
        <article class="article-contrato" data-aos="zoom-in" id="result">
            <header class="header-article-contrato">
                <label class="title-contrato">ADICIONAR OBJETO</label>
            </header>
            <form action="" method="post" onsubmit="return false;">
                <input type="hidden" id="idcontrato" value="<?php echo $_GET['idcontrato'] ?>">
                <input type="hidden" id="status">
                <div class="line-contrato">
                    <div class="form-contrato tipo_contrato">
                        <label class="title-option-contrato"> Adicionar objeto? </label>
                        <label class="input-radio-contrato">
                            <input type="radio" id="rd-sim" name="radio-group">
                            <label for="rd-sim" class="rd-label-contrato">Sim</label>
                        </label>
                        <label class="input-radio-contrato">
                            <input type="radio" id="rd-nao" name="radio-group">
                            <label for="rd-nao" class="rd-label-contrato">Não</label>

                        </label>
                    </div>
                </div>
                <div id="div-garantia"></div>
                <div id="div-btn"></div>
            </form>
        </article>
        <script  type="text/javascript">
            $('#rd-sim').click(function () {
                if ($('#rd-sim').is(':checked')) {
                    document.getElementById('status').value = '1';
                    document.getElementById('div-garantia').innerHTML = '<div class="line-contrato" data-aos="fade-left"' +
                            'data-aos-offset="200"' +
                            'data-aos-duration="200"' +
                            'id="div-garantia">' +
                            '<div class="form-contrato objeto">' +
                            '<label class="title-option-contrato">Descrição de Objeto:</label>' +
                            '<textarea maxlength="1400" type="text" class="input-contrato input-auto-num" id="objeto" placeholder="Descrição de objeto" autocomplete="off"></textarea>' +
                            '</div>' +
                            '</div>';
                    document.getElementById('div-btn').innerHTML = '<div class="line-contrato">' +
                            '<div class="form-contrato cadastrar">' +
                            '<input type="button" value="PROSSEGUIR" class="button-cadastro-contrato" style="float:right; margin-right:30px;" id="adicionar_objeto">' +
                            '</div>' +
                            '</div>';
                    $("#adicionar_objeto").click(function () {

                        callApi();
                    });
                }
            });

            $('#rd-nao').click(function () {
                if ($('#rd-nao').is(':checked')) {
                    document.getElementById('status').value = '2';
                    document.getElementById('div-garantia').innerHTML = '';
                    document.getElementById('div-btn').innerHTML = '<div class="line-contrato" data-aos="fade-left" data-aos-offset="100" data-aos-duration="500">' +
                            '<div class="form-contrato cadastrar">' +
                            '<input type="button" value="PROSSEGUIR" class="button-cadastro-contrato" id="adicionar_objeto">' +
                            '</div>' +
                            '</div>';
                    $("#adicionar_objeto").click(function () {
                        alert("teste");
                        callApi();
                    });
                }
            });



            function callApi() {
                var idcontrato = $("#idcontrato").val();
                var status_objeto = $("#status").val();
                var objeto = '';
                if (status_objeto === '1') {
                    objeto = $("#objeto").val();
                }



                document.getElementById("result").innerHTML = "<div class='center-img'><img src='../images/loading.gif' alt='imgLoading' class='img-loading'></div>";
                $.ajax({
                    url: "../api/api.php",
                    method: "post",
                    data: {request: "adicionar_objeto",
                        status_objeto: status_objeto,
                        objeto: objeto,
                        idcontrato: idcontrato
                    },
                    success: function (data)
                    {
                        alert(data);
                        var res = data.split(";");
                        if (typeof res[0] !== "undefined" && res[0] == "00") {
                            location.href = "obs.php?idcontrato=" + res[1];
                        } else {
                            alert("erro de comunicação com servidor!")
                        }

                    }
                });

            }
        </script>
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <script>
            AOS.init();
        </script>

    </body>
</html>