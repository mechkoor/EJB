package controllers;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.VilleIDaoLocale;
import entities.Ville;

public class VilleController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @EJB
    private VilleIDaoLocale ejb;

    public VilleController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("villes", ejb.findAll());
        RequestDispatcher dispatcher = request.getRequestDispatcher("ville.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("create".equals(action)) {
            String nom = request.getParameter("nom");
            ejb.create(new Ville(nom));
        } else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String updatedNom = request.getParameter("Nom");
            Ville villeToUpdate = ejb.findById(id);

            if (villeToUpdate != null) {
                villeToUpdate.setNom(updatedNom);
                ejb.update(villeToUpdate);
            }
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Ville villeToDelete = ejb.findById(id);

            if (villeToDelete != null) {
                ejb.delete(villeToDelete);
            }
        }

        request.setAttribute("villes", ejb.findAll());
        RequestDispatcher dispatcher = request.getRequestDispatcher("ville.jsp");
        dispatcher.forward(request, response);
    }
}