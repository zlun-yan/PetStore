package org.csu.petstore.web.servlet.dispatcher;

import org.csu.petstore.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/index")
public class gotoHome extends HttpServlet {
    private static final String HOME = "index.jsp";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user.getId() != 0) {
            req.getRequestDispatcher("main").forward(req, resp);
        }
        else {
            req.getRequestDispatcher(HOME).forward(req, resp);
        }
    }
}
