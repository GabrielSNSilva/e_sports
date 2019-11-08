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
    <title>Listar Usuários</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Barra superior com os menus de navegação -->
    <c:import url="Menu.jsp" />
    <!-- Container Principal -->
    <div id="main" class="container">
        <h3 class="page-header">Usuário(s)</h3>
        <c:if test="${not empty usuarios}">
            <div class="table-responsive col-md-12">
                <table class="table table-striped">
                    <thead>
                        <tr>                        	
                            <th>ID</th>
                            <th>Nome</th>
                            <th>Login</th>
                            <th>Senha</th>
                            <th class="actions">Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="usuario" items="${usuarios}">
                        	<form action="visualizar_usuario" method="get"> 
	                            <tr>
	                                <td>${ usuario.id }</td>
	                                <td>${ usuario.nome }</td>
	                                <td>${ usuario.login }</td>
	                                <td>${ usuario.senha }</td>
	                                <td class="actions">
	                                
	                                	<button name="id" value="${ usuario.id }" class="btn btn-success btn-xs">Visualizar</button>
	                                	
	                                	<button name="id" formaction="editar_usuario_pesquisa" value="${ usuario.id }" class="btn btn-warning btn-xs">Editar</button>
	                                	
	                                	<button name="id" formaction="excluir_usuario" value="${ usuario.id }" class="btn btn-danger btn-xs">Excluir</button>
	                              
	                               	</td>
	                            </tr>
                          </form>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
        <c:if test="${empty usuarios}">
            <div class="alert alert-info" role="alert">N&atilde;o h&aacute; usuários nesta lista.</div>
        </c:if>
        <a href="admin_index" class="btn btn-default">Voltar</a>
    </div>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>

</html>