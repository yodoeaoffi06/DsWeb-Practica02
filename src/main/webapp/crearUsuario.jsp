<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.uv.dsweb.practica02.Usuario" %>
<%@ page import="org.uv.dsweb.practica02.UsuarioDAO" %>
<%@ page import="java.sql.SQLException" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Crear Usuario</title>
    <link rel="stylesheet" href="styles.css"> <!-- Enlace a un archivo CSS si lo tienes -->
</head>
<body>
    <h1>Crear Nuevo Usuario</h1>
    <form action="usuarios" method="post">
        <input type="hidden" name="action" value="crear">
        
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" required><br>

        <label for="telefono">Teléfono:</label>
        <input type="text" id="telefono" name="telefono" required><br>

        <label for="direccion">Dirección:</label>
        <input type="text" id="direccion" name="direccion" required><br>

        <input type="submit" value="Crear Usuario">
    </form>
    
    <%
        String mensaje = request.getParameter("mensaje");
        if (mensaje != null) {
            out.println("<p>" + mensaje + "</p>");
        }
    %>
</body>
</html>
