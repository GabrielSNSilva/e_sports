<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>E-Sports</title>

  <!-- Custom fonts for this theme -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Theme CSS -->
  <link href="css/freelancer.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="index">E-Sports</a>
      <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" data-toggle="modal" data-target="#carrinho"><i class="fas fa-shopping-cart"></i></a>
          </li>
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="tela_login_consumidor"><i class="fas fa-user"></i></a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  	
    <!-- Container Principal -->
    <div id="main" class="container" style="margin-top: 150px; margin-bottom: 50px;">
        <h3 class="page-header">Cadastre-se</h3>
        <!-- Formulario para inclusao de clientes -->
        <form action="novo_consumidor" method="post">
            <!-- area de campos do form -->
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="nome"><strong>Nome</strong></label>
                    <input type="text" class="form-control" name="nome" id="nome" maxlength="100" placeholder="Nome" required>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="nome"><strong>Sobrenome</strong></label>
                    <input type="text" class="form-control" name="sobrenome" id="sobrenome" maxlength="100" placeholder="Sobrenome" required>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="nome"><strong>Telefone</strong></label>
                    <input type="text" class="form-control" name="telefone" id="telefone" maxlength="100" placeholder="+11 99999-9999" required>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="nome"><strong>Endereço</strong></label>
                    <input type="text" class="form-control" name="endereco" id="endereco" maxlength="100" placeholder="Endereço" required>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="nome"><strong>Login</strong></label>
                    <input type="text" class="form-control" name="login" id="login" maxlength="100" placeholder="Login" required>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="nome"><strong>Senha</strong></label>
                    <input type="password" class="form-control" name="senha" id="senha" maxlength="10" placeholder="Senha" required>
                </div>
            </div>            
            <hr />
            <div id="actions" class="row">
                <div class="col-md-12">
                    <button type="submit" class="btn btn-primary" name="command" value="NovoConsumidor">Salvar</button>
                    <a href="index" class="btn btn-default">Cancelar</a>
                </div>
            </div>
        </form>
    </div>
			
	<!-- Footer -->
  <footer class="footer text-center">
    <div class="container">
      <div class="row">

        <!-- Footer Location -->
        <div class="col-lg-4 mb-5 mb-lg-0">
          <h4 class="text-uppercase mb-4">Localização</h4>
          <p class="lead mb-0">Loja 1: Rua Oscar Freire, nº 607
            <br>Loja 2: Av. Paulist, nº 467</p>
        </div>

        <!-- Footer Social Icons -->
        <div class="col-lg-4 mb-5 mb-lg-0">
          <h4 class="text-uppercase mb-4">Redes Sociais</h4>
          <a class="btn btn-outline-light btn-social mx-1" href="#">
            <i class="fab fa-fw fa-facebook-f"></i>
          </a>
          <a class="btn btn-outline-light btn-social mx-1" href="#">
            <i class="fab fa-fw fa-twitter"></i>
          </a>
          <a class="btn btn-outline-light btn-social mx-1" href="#">
            <i class="fab fa-fw fa-linkedin-in"></i>
          </a>
          <a class="btn btn-outline-light btn-social mx-1" href="#">
            <i class="fab fa-fw fa-dribbble"></i>
          </a>
        </div>

        <!-- Footer About Text -->
        <div class="col-lg-4">
          <h4 class="text-uppercase m'b-4">Ofertas</h4>
          <p class="lead mb-0">Receba as atualizações de nosso site.</p>
          <p class="lead mb-0">Acesso <a href="tela_login_admin">administrador</a>.</p>
        </div>

      </div>
    </div>
  </footer>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>

</html>