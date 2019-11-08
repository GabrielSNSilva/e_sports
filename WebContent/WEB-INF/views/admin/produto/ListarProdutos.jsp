<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listar Produtos</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Barra superior com os menus de navegação -->
    <c:import url="Menu.jsp" />
    <!-- Container Principal -->
    <div id="main" class="container">
        <h3 class="page-header">Produto(s)</h3>
        <c:if test="${not empty produtos}">
            <div class="table-responsive col-md-12">
                <table class="table table-striped">
                    <thead>
                        <tr>
                        	<th>Foto</th>
                            <th>ID</th>
                            <th>Nome</th>
                            <th>Marca</th>
                            <th>Preço</th>
                            <th class="actions">Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="produto" items="${produtos}">
                        	<form action="visualizar_produto" method="get"> 
	                            <tr>
	                            	<td><img alt="?" src="img/${ produto.imagem }"  height="48" width="48" class="img-circle"></td>
	                                <td>${ produto.id }</td>
	                                <td>${ produto.nome }</td>
	                                <td>${ produto.marca }</td>
	                                <td>${ produto.preco }</td>
	                                <td class="actions">
	                                
	                                	<button name="id" value="${produto.id}" class="btn btn-success btn-xs">Visualizar</button>
	                                	
	                                	<button name="id" formaction="editar_produto_pesquisa" value="${produto.id}" class="btn btn-warning btn-xs">Editar</button>
	                                	
	                                	<button name="id" formaction="excluir_produto" value="${produto.id}" class="btn btn-danger btn-xs">Excluir</button>
	                              
	                               	</td>
	                            </tr>
                          </form>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
        <c:if test="${empty produtos}">
            <div class="alert alert-info" role="alert">N&atilde;o h&aacute; produtos nesta lista.</div>
        </c:if>
        <a href="admin_index" class="btn btn-default">Voltar</a>
    </div>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>

</html>