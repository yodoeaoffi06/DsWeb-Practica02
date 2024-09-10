package org.uv.dsweb.practica02;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/usuarios")
public class UsuarioServlet extends HttpServlet {

    private UsuarioDAO usuarioDAO = new UsuarioDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if ("eliminar".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                usuarioDAO.eliminarUsuario(id);
                response.sendRedirect("usuarios?mensaje=Usuario eliminado con éxito");
            } else if ("editar".equals(action)) {
                String idStr = request.getParameter("id");
                if (idStr != null && !idStr.isEmpty()) {
                    int id = Integer.parseInt(idStr);
                    Usuario usuario = usuarioDAO.obtenerUsuarioPorId(id); // Método para obtener el usuario
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("/editarUsuario.jsp").forward(request, response);
                } else {
                    response.sendRedirect("usuarios?mensaje=ID no válido");
                }
            } else {
                // Listado de usuarios
                List<Usuario> usuarios = usuarioDAO.listarUsuarios();
                request.setAttribute("usuarios", usuarios);
                request.getRequestDispatcher("/listarUsuarios.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException("Error al listar o eliminar usuarios", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if ("crear".equals(action)) {
                String nombre = request.getParameter("nombre");
                String telefono = request.getParameter("telefono");
                String direccion = request.getParameter("direccion");
                usuarioDAO.agregarUsuario(new Usuario(0, nombre, telefono, direccion));
                response.sendRedirect("usuarios?mensaje=Usuario creado con éxito");
            } else if ("editar".equals(action)) { // Cambiado de "actualizar" a "editar"
                String idStr = request.getParameter("id");
                if (idStr != null && !idStr.isEmpty()) {
                    int id = Integer.parseInt(idStr);
                    String nombre = request.getParameter("nombre");
                    String telefono = request.getParameter("telefono");
                    String direccion = request.getParameter("direccion");
                    usuarioDAO.actualizarUsuario(new Usuario(id, nombre, telefono, direccion));
                    response.sendRedirect("usuarios?mensaje=Usuario actualizado con éxito");
                } else {
                    response.sendRedirect("usuarios?mensaje=ID no válido");
                }
            }
        } catch (SQLException e) {
            throw new ServletException("Error en operación de usuarios", e);
        }
    }
}
