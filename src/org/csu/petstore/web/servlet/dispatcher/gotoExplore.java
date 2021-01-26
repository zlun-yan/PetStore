package org.csu.petstore.web.servlet.dispatcher;

import org.csu.petstore.domain.Item;
import org.csu.petstore.persistence.Impl.ItemDAOImpl;
import org.csu.petstore.persistence.ItemDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/explore")
public class gotoExplore extends HttpServlet {
    private static final String EXPLORE = "/WEB-INF/jsp/products/explore/explore.jsp";
    private ItemDAO itemDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String type = req.getParameter("need");

        List<Item> itemList = new ArrayList<>();
        itemDAO = new ItemDAOImpl();
        if (type.equals("parrot")) {
            itemList = itemDAO.getItemByTypeId(1);
        }
        else if (type.equals("dog")) {
            itemList = itemDAO.getItemByTypeId(2);
        }
        else if (type.equals("cat")) {
            itemList = itemDAO.getItemByTypeId(3);
        }

        session.setAttribute("itemList", itemList);
        req.getRequestDispatcher(EXPLORE).forward(req, resp);
    }
}
