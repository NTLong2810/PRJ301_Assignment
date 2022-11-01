/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import dal.AttendanceDBContext;
import dal.LecturerDBContext;
import dal.SessionDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Session;

/**
 *
 * @author DELL
 */
public class SessionAttendController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         int sesid = Integer.parseInt(req.getParameter("id"));
        AttendanceDBContext de = new AttendanceDBContext();
        ArrayList attlist = de.getAttendance(sesid);
        req.setAttribute("attlist", attlist);
         req.getRequestDispatcher("../view/lecturer/detail.jsp").forward(req, resp);     
    }
    
}
