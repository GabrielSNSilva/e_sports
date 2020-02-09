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
      <a class="navbar-brand js-scroll-trigger" href="#page-top">E-Sports</a>
      <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#portfolio">Itens</a>
          </li>
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#about">Lançamento</a>
          </li>
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#contact">Contato</a>
          </li>
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" data-toggle="modal" data-target="#carrinho"><i class="fas fa-shopping-cart"></i></a>
          </li>           
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"><i class="fas fa-user"></i> Olá ${ consumidor.nome }</a>
          </li>         
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="index">Sair</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Masthead -->
  <header class="masthead bg-primary text-white text-center">
    <div class="container d-flex align-items-center flex-column">

      <!-- Masthead Avatar Image -->
      <img class="masthead-avatar mb-5" src="img/logo.jpg" alt="">

      <!-- Masthead Heading -->
      <h1 class="masthead-heading text-uppercase mb-0">Sua loja online de confiança</h1>

      <!-- Icon Divider -->
      <div class="divider-custom divider-light">
        <div class="divider-custom-line"></div>
        <div class="divider-custom-icon">
          <i class="fas fa-star"></i>
        </div>
        <div class="divider-custom-line"></div>
      </div>

      <!-- Masthead Subheading -->
      <p class="masthead-subheading font-weight-light mb-0">Ofertas campeãs em campo!</p>

    </div>
  </header>

  <!-- Portfolio Section -->
  <section class="page-section portfolio" id="portfolio">
    <div class="container">

      <!-- Portfolio Section Heading -->
      <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Itens</h2>

      <!-- Icon Divider -->
      <div class="divider-custom">
        <div class="divider-custom-line"></div>
        <div class="divider-custom-icon">
          <i class="fas fa-star"></i>
        </div>
        <div class="divider-custom-line"></div>
      </div>

      <!-- Portfolio Grid Items -->
      <div class="row">

	        <!-- Portfolio Item 1 -->
	        <c:forEach var="produto" items="${produtos}">
		        <div class="col-md-6 col-lg-4">
		          <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal${ produto.id }">
		            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
		              <div class="portfolio-item-caption-content text-center text-white">
		                <i class="fas fa-search fa-3x"></i>
		              </div>
		            </div>
		            <img class="img-fluid" src="img/${ produto.imagem }" width="400px" height="400px" alt="">
		            <h2>R$ ${ produto.preco },00</h2>
		          	<p>${ produto.nome }</p>
	              </div>
		        </div>
	        </c:forEach>
		</div>
   	</div>
  </section>

  <!-- About Section -->
  <section class="page-section bg-primary text-white mb-0" id="about">
    <div class="container">

      <!-- About Section Heading -->
      <h2 class="page-section-heading text-center text-uppercase text-white">Lançamentos</h2>

      <!-- Icon Divider -->
      <div class="divider-custom divider-light">
        <div class="divider-custom-line"></div>
        <div class="divider-custom-icon">
          <i class="fas fa-star"></i>
        </div>
        <div class="divider-custom-line"></div>
      </div>

      <!-- About Section Content -->
      <div class="row">
	      <!--
	      <c:forEach begin="1" end="3" var="i" step="1">
		     <c:set var="j" value="${3-i+1}" scope="page"></c:set>
		     <c:out value="${j}"/>
		  </c:forEach>
	      -->
	      <c:forEach var="produto" items="${produtosDecrescente}" begin="0" end="2" varStatus="loop">
	      	<div class="col-lg-4 ml-auto">
	         	<!-- New Item 1 -->
	          	<div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal${ produto.id }">
	            	<div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100"></div>
	            	<img class="img-fluid" src="img/${ produto.imagem }" width="400px" height="400px" alt="">
	            	<h2>R$ ${ produto.preco },00</h2>
	          		<p>${ produto.nome }</p>
	          </div>
	        </div>
	      </c:forEach>
          
       </div>
      </div>
	
      <!-- About Section Button -->
      <div class="text-center mt-4" data-toggle="modal" data-target="#carrinho">
        <a class="btn btn-xl btn-outline-light">
          <i class="fas fa-shopping-cart mr-2"></i>
          Carrinho
        </a>
      </div>

  </section>

  <!-- Contact Section -->
  <section class="page-section" id="contact">
    <div class="container">

      <!-- Contact Section Heading -->
      <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Contato</h2>

      <!-- Icon Divider -->
      <div class="divider-custom">
        <div class="divider-custom-line"></div>
        <div class="divider-custom-icon">
          <i class="fas fa-star"></i>
        </div>
        <div class="divider-custom-line"></div>
      </div>

      <!-- Contact Section Form -->
      <div class="row">
        <div class="col-lg-8 mx-auto">
          <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
          <form name="sentMessage" id="contactForm" novalidate="novalidate">
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>Nome</label>
                <input class="form-control" id="name" type="text" placeholder="Nome" required="required" data-validation-required-message="Por favor, preenche este campo.">
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>E-mail</label>
                <input class="form-control" id="email" type="email" placeholder="E-mail" required="required" data-validation-required-message="Por favor, preenche este campo.">
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>Telefone</label>
                <input class="form-control" id="phone" type="tel" placeholder="Telefone" required="required" data-validation-required-message="Por favor, preenche este campo.">
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>Mensagem</label>
                <textarea class="form-control" id="message" rows="5" placeholder="Mensagem" required="required" data-validation-required-message="Por favor, preenche este campo."></textarea>
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <br>
            <div id="success"></div>
            <div class="form-group">
              <button type="submit" class="btn btn-primary btn-xl" id="sendMessageButton">Enviar</button>
            </div>
          </form>
        </div>
      </div>

    </div>
  </section>

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

  <!-- Copyright Section -->
  <section class="copyright py-4 text-center text-white">
    <div class="container">
      <small>Copyright &copy; 2019</small>
    </div>
  </section>

  <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
  <div class="scroll-to-top d-lg-none position-fixed ">
    <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top">
      <i class="fa fa-chevron-up"></i>
    </a>
  </div>

  <!-- Portfolio Modals -->

  <!-- Portfolio Modal 1 -->  
  <c:forEach var="produto" items="${produtos}">
	  <div class="portfolio-modal modal fade" id="portfolioModal${ produto.id }" tabindex="-1" role="dialog" aria-labelledby="portfolioModal1Label" aria-hidden="true">
	    <div class="modal-dialog modal-xl" role="document">
	      <div class="modal-content">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">
	            <i class="fas fa-times"></i>
	          </span>
	        </button>
	        <div class="modal-body text-center">
	          <div class="container">
	            <div class="row justify-content-center">
	              <div class="col-lg-8">
	                <!-- Portfolio Modal - Title -->
	                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0"> Detalhes do Produto </h2>
	                <!-- Icon Divider -->
	                <div class="divider-custom">
	                  <div class="divider-custom-line"></div>
	                  <div class="divider-custom-icon">
	                    <i class="fas fa-star"></i>
	                  </div>
	                  <div class="divider-custom-line"></div>
	                </div>
	                <form action="inserir_produto_carrinho" method="post" enctype="multipart/form-data">
		                <!-- Portfolio Modal - Image -->
		                <img class="img-fluid rounded mb-5" src="img/${ produto.imagem }" width="300px" height="300px" alt="">
		                <input type="hidden" class="form-control" name="imagem" id="imagem" required maxlength="50" value="${ produto.imagem }">
		                <!-- Portfolio Modal - Text -->
		                <div>
			                <p class="mb-5"><h2>${ produto.nome }</h2></p>
			                <input type="hidden" class="form-control" name="nome" id="nome" required maxlength="50" value="${ produto.nome }">
			                <p class="mb-5"><h3>${ produto.marca }</h3></p>
			                <input type="hidden" class="form-control" name="marca" id="marca" required maxlength="50" value="${ produto.marca }">
			                <p class="mb-5"><h4>R$ ${ produto.preco },00</h4></p>
			                <input type="hidden" class="form-control" name="preco" id="preco" required maxlength="50" value="${ produto.preco }">
		                </div>
		                <div class="col-md-4" style="margin-top:50px; margin-bottom: 50px;">
		          			<input type="number" class="form-control" name="quantidade" id="quantidade" maxlength="10" placeholder="Quantidade" size="10" required style="margin-left: 235px;">
	          			</div>
		          		<div id="actions" class="row">
			                <div class="col-md-12">
			                	<input type="hidden" class="form-control" name="id_produto" id="id_produto" required maxlength="50" value="${ produto.id }">
			                    <button type="submit" class="btn btn-primary" name="command" value="NovoProduto">Colocar no Carrinho</button>
			                </div>
			            </div>
		            </form>
	                <button class="btn btn-danger" href="#" data-dismiss="modal" style="margin-top:20px;">
	                  <i class="fas fa-times fa-fw"></i>
	                  Fechar
	                </button>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
  </c:forEach>
  
  
  <!-- CARRINHO -->
  <c:forEach var="produto" items="${produtosCarrinho}">
	  <div class="portfolio-modal modal fade" id="carrinho" tabindex="-1" role="dialog" aria-labelledby="portfolioModal1Label" aria-hidden="true">
	    <div class="modal-dialog modal-xl" role="document">
	      <div class="modal-content">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">
	            <i class="fas fa-times"></i>
	          </span>
	        </button>
	        <div class="modal-body text-center">
	          <div class="container">
	            <div class="row justify-content-center">
	              <div class="col-lg-8">
	                <!-- Portfolio Modal - Title -->
	                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0"> Carrinho </h2>
	                <!-- Icon Divider -->
	                <div class="divider-custom">
	                  <div class="divider-custom-line"></div>
	                  <div class="divider-custom-icon">
	                    <i class="fas fa-star"></i>
	                  </div>
	                  <div class="divider-custom-line"></div>
	                </div>
	                <!-- Container Principal -->
				    <div id="main" class="container">
				        <c:if test="${not empty produtosCarrinho}">
				            <div class="table-responsive col-md-12">
				                <table class="table table-striped">
				                    <thead>
				                        <tr>
				                        	<th>Foto</th>
				                            <th>Produto</th>
				                            <th>Marca</th>
				                            <th>Preço</th>
				                            <th>Quantidade</th>
				                            <th>Valor</th>
				                            <th class="actions">Ações</th>
				                        </tr>
				                    </thead>
				                    <tbody>
				                        <c:forEach var="carrinho" items="${ produtosCarrinho }">
				                        	<form action="visualizar_produto" method="get"> 
					                            <tr>
					                            	<td><img alt="?" src="img/${ carrinho.imagem }"  height="48" width="48" class="img-circle"></td>
					                                <td>${ carrinho.nome }</td>
					                                <td>${ carrinho.marca }</td>
					                                <td>R$ ${ carrinho.preco },00</td>
					                                <td>${ carrinho.quantidade }</td>
					                                <td>R$ ${ carrinho.total }</td>
					                                <td class="actions">						                                	
						                                <button name="id" formaction="excluir_produto_carrinho" value="${ carrinho.id }" class="btn btn-danger btn-xs"><i class="fas fa-times"></i></button>
					                               	</td>
					                            </tr>
			                          		</form>					
				                        </c:forEach>
				                    </tbody>
				                </table>				                
				            </div>
				        </c:if>
				        <c:if test="${empty produtosCarrinho}">
				            <div class="alert alert-info" role="alert">N&atilde;o h&aacute; produtos no carrinho.</div>
				        </c:if>
				    </div>
				    <div class="row">
				    	<button type="submit" class="btn btn-primary" name="command" href="#" data-toggle="modal" data-target="#finalizar">Finalizar Compra</button>
				    </div>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
  </c:forEach>
  
  
  
  <!-- MENSAGEM DE FINAZAR COMPRA -->
	  <div class="portfolio-modal modal fade" id="finalizar" tabindex="-1" role="dialog" aria-labelledby="portfolioModal1Label" aria-hidden="true">
	    <div class="modal-dialog modal-xl" role="document">
	      <div class="modal-content">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">
	            <i class="fas fa-times"></i>
	          </span>
	        </button>
	        <div class="modal-body text-center">
	          <div class="container">
	            <div class="row justify-content-center">
	              <div class="col-lg-8">
	                <!-- Portfolio Modal - Title -->
	                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0"> Compra Finalizada! </h2>
	                <!-- Icon Divider -->
	                <div class="divider-custom">
	                  <div class="divider-custom-line"></div>
	                  <div class="divider-custom-icon">
	                    <i class="fas fa-star"></i>
	                  </div>
	                  <div class="divider-custom-line"></div>
	                </div>
	                <h3>Agradecemos a preferência.</h3>
	                <h4>Seu pedido foi confirmado.</h4>
	                <button class="btn btn-primary" href="#" data-dismiss="modal">
	                  <i class="fas fa-times fa-fw"></i>
	                  Fechar
	                </button>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Contact Form JavaScript -->
  <script src="js/jqBootstrapValidation.js"></script>
  <script src="js/contact_me.js"></script>

  <!-- Custom scripts for this template -->
  <script src="js/freelancer.min.js"></script>

</body>

</html>
