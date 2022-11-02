/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Controller.auth.BaseAuthenticationController;
import dal.GroupDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Group;
import model.Session;
import model.Student;

/**
 *
 * @author DELL
 */
public class StatusAttendController extends BaseAuthenticationController{
     protected void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
          int groupid = Integer.parseInt(req.getParameter("gid"));
        int lid = Integer.parseInt(req.getParameter("lid"));
        int subid = Integer.parseInt(req.getParameter("subid"));
        GroupDBContext groupDB = new GroupDBContext();
        Group group = groupDB.get(groupid, lid, subid);
        req.setAttribute("group", group);
        req.getRequestDispatcher("../view/lecturer/statusattend.jsp").forward(req, resp);
    }

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req,resp);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         processRequest(req,resp);
       
    }
    
}
