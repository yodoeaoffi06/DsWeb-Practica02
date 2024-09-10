<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <title>Editar Usuario</title>
    </head>
    <body>
        <h2>Editar Usuario</h2>

        <form action="usuarios" method="post">
            <input type="hidden" name="action" value="editar">
            <input type="hidden" name="id" value="${usuario.id}">
            
            <label>Nombre:</label>
            <input type="text" name="nombre" value="${usuario.nombre}" required>
            
            <label>Teléfono:</label>
            <input type="text" name="telefono" value="${usuario.telefono}" required>
            
            <label>Dirección:</label>
            <input type="text" name="direccion" value="${usuario.direccion}" required>
            
            <button type="submit">Actualizar</button>
        </form>



        <a href="usuarios">Volver al listado de usuarios</a>
    </body>
</html>
