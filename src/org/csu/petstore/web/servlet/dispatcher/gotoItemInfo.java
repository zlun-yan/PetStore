package org.csu.petstore.web.servlet.dispatcher;

import org.csu.petstore.service.ItemService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/itemInfo")
public class gotoItemInfo extends HttpServlet {
    private static final String ITEM = "/WEB-INF/jsp/products/item.jsp";
    private ItemService itemService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("itemId"));
        itemService = new ItemService();

        req.setAttribute("item", itemService.getItemByItemId(id));
        req.getRequestDispatcher(ITEM).forward(req, resp);
    }
}
