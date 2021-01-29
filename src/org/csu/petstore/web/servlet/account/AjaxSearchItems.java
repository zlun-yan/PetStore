package org.csu.petstore.web.servlet.account;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.csu.petstore.domain.Item;
import org.csu.petstore.service.ItemService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ajaxSearchItems")
public class AjaxSearchItems extends HttpServlet {
    private ItemService itemService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        itemService = new ItemService();
        String keyword = req.getParameter("keyword");

        List<Item> itemList = itemService.searchItemList(keyword);
        String info = JSON.toJSONString(itemList);

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("info", info);
        resp.getWriter().print(jsonObject.toJSONString());
    }
}
