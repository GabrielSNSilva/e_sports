package br.usjt.arqsw.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AutorizadorInterceptor extends HandlerInterceptorAdapter {
	private String uri;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller) throws Exception {
		uri = request.getRequestURI();

		if(uri.endsWith("login") || uri.endsWith("validar_login") || uri.endsWith("loginAdmin") || uri.endsWith("validar_login_admin") 
				||  uri.endsWith("listarProduto") || uri.endsWith("produto") || uri.endsWith("admin_index") 
				|| uri.endsWith("carrinho") || uri.endsWith("pagamento") || uri.endsWith("confirmacao") || uri.endsWith("cadastro") 
				|| uri.endsWith("cadastrarCliente") ||  uri.endsWith("logoff") 
				|| uri.contains("css") || uri.contains("js") || uri.contains("img")) 	{
			return true;
		}
		

		if(request.getSession().getAttribute("adminLogado") !=null) {
			return true;
		}
		response.sendRedirect("loginAdmin");
		return false;
	}
}
