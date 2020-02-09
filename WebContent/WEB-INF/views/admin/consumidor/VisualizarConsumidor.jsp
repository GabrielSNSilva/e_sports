	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="pt-br">

        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Visualizar Consumidor</title>

            <link href="css/bootstrap.min.css" rel="stylesheet">
            <link href="css/style.css" rel="stylesheet">
        </head>

        <body>
                <!-- Modal -->
                <div class="modal fade" id="delete-modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Fechar"><span aria-hidden="true">&times;</span>
                                </button>
                                <h4 class="modal-title" id="modalLabel">Excluir Consumidor</h4>
                            </div>
                            <div class="modal-body">
                                Deseja realmente excluir este consumidor?
                            </div>
                            <div class="modal-footer">
                                <form action="excluir_usuario" method="post">
                                    <input type="hidden" name="id" value="${ consumidor.id }" />
                                    <button type="submit" class="btn btn-primary" name="command" value="ExcluirUsuario">Sim</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">N&atilde;o</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.modal -->
                <!-- Barra superior com os menus de navegação -->
				<c:import url="Menu.jsp"/>
                <!-- Container Principal -->
                <div id="main" class="container">
            		<h3 class="page-header">Visualizar Consumidor</h3>
            		<div class="row">
                		<div class="col-md-6">
                    		<p><strong>ID</strong>
                    		</p>
                    		<p>
                        		${ consumidor.id }
                    		</p>
                		</div>
            		</div>
            		<div class="row">
                		<div class="col-md-6">
                    		<p><strong>Nome</strong>
                    		</p>
                    		<p>
                        		${ consumidor.nome } ${ consumidor.sobrenome }
                    		</p>
                		</div>
            		</div>
            		<div class="row">
                		<div class="col-md-6">
                    		<p><strong>Telefone</strong>
                    		</p>
                    		<p>
                        		${ consumidor.telefone }
                    		</p>
                		</div>
            		</div>
            		<div class="row">
                		<div class="col-md-6">
                    		<p><strong>Endereco</strong>
                    		</p>
                    		<p>
                        		${ consumidor.endereco }
                    		</p>
                		</div>
            		</div>  
            		<div class="row">
                		<div class="col-md-6">
                    		<p><strong>Login</strong>
                    		</p>
                    		<p>
                        		${ consumidor.login }
                    		</p>
                		</div>
            		</div>          					
					<hr />
            		<br>
                	<div id="actions" class="row">
                		<form method="get"> 
	                		<div class="col-md-12">
	                        	<a href="listar_consumidores" class="btn btn-default">Voltar</a>
	                    	</div>
                    	</form>
                	</div>
                </div>
                <script src="js/jquery.min.js"></script>
                <script src="js/bootstrap.min.js"></script>
        </body>

        </html>