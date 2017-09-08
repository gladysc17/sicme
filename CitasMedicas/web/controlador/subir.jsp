<%-- 
    Document   : subir
    Created on : 3/09/2017, 01:53:26 PM
    Author     : LEGADO
--%>

<%@page import="DTO.ImagenDTO"%>
<%@page import="FACADE.FacadeImagen"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
        /*FileItemFactory es una interfaz para crear FileItem*/
        FileItemFactory file_factory = new DiskFileItemFactory();
 
        /*ServletFileUpload esta clase convierte los input file a FileItem*/
        ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
        /*sacando los FileItem del ServletFileUpload en una lista */
        List items = servlet_up.parseRequest(request);
        boolean rta = false;
        for(int i=0;i<items.size();i++){
            /*FileItem representa un archivo en memoria que puede ser pasado al disco duro*/
            FileItem item = (FileItem) items.get(i);
            /*item.isFormField() false=input file; true=text field*/
            if (! item.isFormField()){
                /*cual sera la ruta al archivo en el servidor*/
                File archivo_server = new File("C:/Users/LEGADO/Documents/TRABAJO DE GRADO/Nueva carpeta (2)/sicme/sicme/CitasMedicas/web/imagenes/banner/"+item.getName());
                /*y lo escribimos en el servido*/
                item.write(archivo_server);
                FacadeImagen fi = new FacadeImagen();
                ImagenDTO ima = new ImagenDTO(item.getName(), "inactivo");
                
                rta = fi.registrarImagen(ima);
                
                //out.print("Nombre --> " + item.getName() );
                //out.print("<br> Tipo --> " + item.getContentType());
                //out.print("<br> tamaño --> " + (item.getSize()/1240)+ "KB");
                //out.print("<br>");
            }
        }
        
        if(rta){
        %>
        <script>
            alert("Imagen subida");
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Imagen no se subio");
            location.href = "../jsp/PrincipalAdministrador.jsp";
        </script>
        <%
        }
        %>
    </body>
</html>
