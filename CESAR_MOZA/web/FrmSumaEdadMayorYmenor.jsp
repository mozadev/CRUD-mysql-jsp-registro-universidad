

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@page import="BEAN.EstudianteBean"%>
<%@page import="java.util.ArrayList"%>


<%!ArrayList<EstudianteBean> listaestudiante2;%>
<%listaestudiante2 = (ArrayList<EstudianteBean>) request.getAttribute("listaestudiante");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body background="yellow">
        <h1>SUMA DE EDADES Y DETERMINAR CUAL ES MAYOR Y MENOR</h1>
        
        
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
                    
                  
                    <!-- suma de edades -->
                    
                    <% int sumaEdad=0; int mayor=0;int menor=999;
                    
                     for (EstudianteBean obj : listaestudiante2)
                   
                    { 
                        if(obj.getEDAD()>mayor)  mayor=obj.getEDAD();
                         if(obj.getEDAD()<menor)  menor=obj.getEDAD();
                         sumaEdad=sumaEdad+obj.getEDAD();  
                   
                    }
                    %>
                    <%out.println("la suma de edades es: "+sumaEdad+" , "); %>
                 
                     <%out.println("la mayor edad es: "+mayor+" , "); %>
                   
                      <%out.println("la menor  edade es: "+menor); %>
                  
                        <!-- mayor -->  
                   <%  
                    for (EstudianteBean obj : listaestudiante2)
                   
                    if(obj.getEDAD()==mayor)
                    
                    
                    { %>
                   
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
                    
                      <!-- menor -->  
                        <%  
                    for (EstudianteBean obj : listaestudiante2)
                   
                    if(obj.getEDAD()==menor)
                    
                    
                    { %>
                   
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
