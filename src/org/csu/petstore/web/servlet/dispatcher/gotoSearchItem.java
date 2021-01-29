package org.csu.petstore.web.servlet.dispatcher;

import org.csu.petstore.domain.Item;
import org.csu.petstore.persistence.Impl.ItemDAOImpl;
import org.csu.petstore.persistence.ItemDAO;
import org.csu.petstore.service.ItemService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/searchItem")
public class gotoSearchItem extends HttpServlet {
    private static final String EXPLORE = "/WEB-INF/jsp/products/explore/explore.jsp";
    private ItemService itemService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyword = req.getParameter("keyword");
        itemService = new ItemService();

        List<Item> itemList = itemService.searchItemList(keyword);
        req.getSession().setAttribute("itemList", itemList);

        System.out.println(keyword);

        req.getRequestDispatcher(EXPLORE + "?need=Search: " + keyword).forward(req, resp);
    }
}
