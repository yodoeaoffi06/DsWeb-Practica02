<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <title>Listado de Usuarios</title>
    </head>
    <body>
        <h2>Usuarios</h2>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Teléfono</th>
                <th>Dirección</th>
                <th>Acciones</th>
            </tr>
            <c:forEach var="usuario" items="${usuarios}">
                <tr>
                    <td>${usuario.id}</td>
                    <td>${usuario.nombre}</td>
                    <td>${usuario.telefono}</td>
                    <td>${usuario.direccion}</td>
                    <td>
                        <a href="usuarios?action=editar&id=${usuario.id}">Editar</a>
                        <a href="usuarios?action=eliminar&id=${usuario.id}">Eliminar</a>
                    </td>
                </tr>
            </c:forEach>

        </table>
        <a href="crearUsuario.jsp">Agregar Usuario</a>
    </body>
</html>
