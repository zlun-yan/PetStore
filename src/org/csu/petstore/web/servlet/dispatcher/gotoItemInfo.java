package org.csu.petstore.web.servlet.dispatcher;

import org.csu.petstore.domain.Item;
import org.csu.petstore.domain.Type;
import org.csu.petstore.persistence.Impl.TypeDAOImpl;
import org.csu.petstore.persistence.TypeDAO;
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
    private TypeDAO typeDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("itemId"));
        itemService = new ItemService();
        Item item = itemService.getItemByItemId(id);
        typeDAO = new TypeDAOImpl();
        Type type = typeDAO.getTypeByTypeId(item.getTypeId());

        req.setAttribute("type", type);
        req.setAttribute("item", item);
        req.getRequestDispatcher(ITEM).forward(req, resp);
    }
}
