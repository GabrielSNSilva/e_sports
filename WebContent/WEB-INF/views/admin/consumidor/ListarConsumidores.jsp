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
    <title>Listar Consumidores</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Barra superior com os menus de navegação -->
    <c:import url="Menu.jsp" />
    <!-- Container Principal -->
    <div id="main" class="container">
        <h3 class="page-header">Consumidor(s)</h3>
        <c:if test="${not empty consumidor}">
            <div class="table-responsive col-md-12">
                <table class="table table-striped">
                    <thead>
                        <tr>                        	
                            <th>ID</th>
                            <th>Nome</th>
                            <th>Telefone</th>
                            <th>Endereço</th>
                            <th>Login</th>
                            <th>Senha</th>
                            <th class="actions">Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="cliente" items="${consumidores}">
                        	<form action="visualizar_consumidor" method="get"> 
	                            <tr>
	                                <td>${ consumidor.id }</td>
	                                <td>${ consumidor.nome } ${ consumidor.sobrenome }</td>
	                                <td>${ consumidor.telefone }</td>
	                                <td>${ consumidor.endereco }</td>
	                                <td>${ consumidor.login }</td>
	                                <td>${ consumidor.senha }</td>
	                                <td class="actions">
	                                
	                                	<button name="id" value="${ consumidor.id }" class="btn btn-success btn-xs">Visualizar</button>
	                                	
	                               	</td>
	                            </tr>
                          </form>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
        <c:if test="${empty consumidores}">
            <div class="alert alert-info" role="alert">N&atilde;o h&aacute; consumidores nesta lista.</div>
        </c:if>
        <a href="admin_index" class="btn btn-default">Voltar</a>
    </div>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>

</html>