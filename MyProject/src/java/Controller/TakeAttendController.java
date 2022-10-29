/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import dal.SessionDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Attendance;
import model.Session;
import model.Student;

/**
 *
 * @author DELL
 */
public class TakeAttendController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         Session ses = new Session();
        ses.setId(Integer.parseInt(req.getParameter("sesid")));
        String[] stdids = req.getParameterValues("stdid");
        for (String stdid : stdids) {
            Attendance a =new Attendance();
            Student s = new Student();
            a.setStudent(s);
            a.setDescription(req.getParameter("description"+stdid));
            a.setPresent(req.getParameter("present"+stdid).equals("present"));
            s.setId(Integer.parseInt(stdid));
            ses.getAttendances().add(a);
        }
        SessionDBContext db = new SessionDBContext();
        db.update(ses);
         resp.sendRedirect("takeatt?id="+ses.getId());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         int sesid = Integer.parseInt(req.getParameter("id"));
        SessionDBContext sesDB = new SessionDBContext();
        Session ses = sesDB.get(sesid);
        req.setAttribute("ses", ses);
        req.getRequestDispatcher("../view/lecturer/takeattend.jsp").forward(req, resp);
    }
    
    
}
