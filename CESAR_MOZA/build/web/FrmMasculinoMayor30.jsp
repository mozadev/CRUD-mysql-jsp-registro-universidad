

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="BEAN.EstudianteBean"%>


<%!ArrayList<EstudianteBean> listaestudiante2;%>
<%listaestudiante2 = (ArrayList<EstudianteBean>) request.getAttribute("listaestudiante");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <h1> PERSONAS DE SEXO MASCULINO  MAYORES 30</h1>
        
        
        <table  class="table table-hover"  id="tablabuscar">
                    <thead class="thead-dark">
                    <br>
                    <tr>
                        <td>ID</td>
                        <td>APELLIDO</td>    
                        <td>NOMBRE</td>
                        <td>GENERO</td>    
                        <td>OCUPACION</td>
                        <td>CURRICULO</td>    
                        <td>EDAD</td>
                       
                    </tr>
                    </thead>
                    <% for (EstudianteBean obj : listaestudiante2)
                    
                    if(obj.getEDAD()>30 && obj.getGENERO().equals("Masculino"))
                    
                    
                    {%>
                   
                    
                    <tr>
                        <td><%=obj.getID()%></td>
                        <td><%=obj.getAPELLIDO()%></td>
                        <td><%=obj.getNOMBRE()%></td>
                        <td><%=obj.getGENERO()%></td>
                        <td><%=obj.getOCUPACION()%></td>
                        <td><%=obj.getCURRICULO()%></td>
                        <td><%=obj.getEDAD()%></td>
                       
                    </tr>
                    <%}%>
                </table>
        
        
        
    </body>
</html>
