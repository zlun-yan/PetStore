package org.csu.petstore.web.servlet.dispatcher;

import org.csu.petstore.domain.Cart;
import org.csu.petstore.persistence.CartDAO;
import org.csu.petstore.persistence.Impl.CartDAOImpl;
import org.csu.petstore.service.CartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/checkout")
public class gotoCheckout extends HttpServlet {
    private static final String CHECKOUT = "/WEB-INF/jsp/products/checkout.jsp";
    private CartService cartService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Cart> cartList = new ArrayList<>();
        String[] ids = req.getParameter("ids").split(";");

        cartService = new CartService();
        for (String id: ids) {
            Cart cart = cartService.getCartById(Integer.parseInt(id));
            cartList.add(cart);
        }

        req.setAttribute("cartList", cartList);
        req.getRequestDispatcher(CHECKOUT).forward(req, resp);
    }
}
