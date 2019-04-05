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
        <section id="container">
            <article id="article-left">

            </article>
            <article id="article-right">
                <div class="container-login">
                    <div class="login">

                        <header class="header-login">
                            <h2 class="title-header-login">
                                <span class="title-form-login">Gestão Eletrônica de Contratos</span>
                            </h2>

                        </header>
                        <article class="article-login">
                            <div class="line-login">
                                <label class="title-login" for="login">USUÁRIO</label>
                                <div class="input-group-login"  id="input-group-login-user">
                                    <input type="text" class="input-login" id="login" placeholder="Digite seu E-mail" autocomplete="off" >     
                                </div>

                            </div>
                            <div class="line-login">
                                <label class="title-login title-senha" for="senha">SENHA</label>
                                <label class="title-login title-senha-right" id="esqueceu_senha">Esqueceu Senha?</label>
                                <div class="input-group-login" id="input-group-login-senha">
                                    <input type="text" class="input-login" id="senha"  autocomplete="off"  placeholder="Digite sua Senha">     
                                </div>                         
                            </div>
                            <div class="line-login">
                                <div class="btn-login">
                                    <input type="submit" class="bt-login" id="entrar" value="ENTRAR">     
                                </div>
                            </div>
                        </article>

                    </div>
                </div>
            </article>
        </section>


        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <script>
            AOS.init();
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#container').on('click', function () {
                    if ($("#login").is(":focus")) {
                        $("#input-group-login-user").addClass("input-group-login-active");
                    } else {
                        $("#input-group-login-user").removeClass("input-group-login-active");
                    }
                    if ($("#senha").is(":focus")) {
                        $("#input-group-login-senha").addClass("input-group-login-active");
                    } else {
                        $("#input-group-login-senha").removeClass("input-group-login-active");
                    }
                });

            });

        </script>
    </body>
</html>