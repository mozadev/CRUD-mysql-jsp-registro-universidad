
<%@page import="BEAN.EstudianteBean"%>
<%@page import="DAO.EstudianteDAO"%>
<%@page import="java.util.ArrayList"%>

<--<!-- la primera vez que carga necesita cargar de la base de datos -->
<%
    EstudianteDAO objEstudianteDAO = new EstudianteDAO();
    ArrayList listarestudiante = objEstudianteDAO.ListarEstudiante();
    request.setAttribute("listaestudiante", listarestudiante);
 
%>
<%!ArrayList<EstudianteBean> listaestudiante2;%>
<%listaestudiante2 = (ArrayList<EstudianteBean>) request.getAttribute("listaestudiante");%>
<!DOCTYPE html>
<html>
    <head>
        <title>formulario Afiliacion</title>
 
        <link href="css/Estilo.css" rel="stylesheet" type="text/css"/>
        <script>

            function modificar(cod, ape, nom, gen, ocu, curri, edad) {
                document.form.action = "<%=request.getContextPath()%>/EstudianteServlet";
                document.form.method = "GET";
                document.form.op.value = "6";
                document.form.COD.value = cod;
                document.form.APE.value = ape;
                document.form.NOM.value = nom;
                document.form.GEN.value = gen;
                document.form.OCU.value = ocu;
                document.form.CUR.value = curri;
                document.form.EDA.value = edad;
                document.form.submit();
            }
            function eliminar(cod) {
                document.form.action = "<%=request.getContextPath()%>/EstudianteServlet";
                document.form.method = "GET";
                document.form.op.value = "8";
                document.form.COD.value = cod;
                document.form.submit();
            }

            function grabar() {
                document.form2.action = "<%=request.getContextPath()%>/EstudianteServlet";
                document.form2.method = "GET";
                document.form2.op.value = "4";
                document.form2.submit();
            }
            function salir() {
                document.form2.action = "<%=request.getContextPath()%>/EstudianteServlet";
                document.form2.method = "GET";
                document.form2.op.value = "5";
                document.form2.submit();
            }
            
              function SumaEdadMayorMenor() {
                document.form2.action = "<%=request.getContextPath()%>/EstudianteServlet";
                document.form2.method = "GET";
                document.form2.op.value = "10";
                document.form2.submit();
            }
            
              function HombresMayores30() {
                document.form2.action = "<%=request.getContextPath()%>/EstudianteServlet";
                document.form2.method = "GET";
                document.form2.op.value = "11";
                document.form2.submit();
            }
            
            
        </script>
    </head>

    <body>
    <center>
        <form name="form2">
            <input type="hidden" name="op">
            <center>
                <table>
                    <tr>
                        <h1>   Formulario de afiliacion <h1>
                                   <h2> Registro de Usuario <h2>
                             
                        <td colspan="2">  </td>
                    </tr>
                    <tr>
                        <td>Codigo: </td>
                        <td><input type="text" class="form-control" name="txtcodigo" required></td>
                    </tr>
                    <tr>
                        <td>Apellido: </td>
                        <td><input type="text" class="form-control" name="txtapellido" required></td>
                    </tr>
                    <tr>
                        <td>Nombre: </td>
                        <td><input type="text" class="form-control" name="txtnombre" required></td>
                    </tr>
                    <tr>
                        <td>Genero: </td>
                        <td><input type="text" class="form-control" name="txtgenero" required></td>
                    </tr>
                    <tr>
                        <td>Ocupacion: </td>
                        <td><input type="text" class="form-control" name="txtocupacion" required></td>
                    </tr>
                    <tr>
                        <td>Curriculo: </td>
                        <td><input type="text" class="form-control" name="txtcurriculo" required></td>
                    </tr>
                    <tr>
                        <td>Edad: </td>
                        <td><input type="text" class="form-control" name="txtedad" required></td>
                    </tr>
                </table>
                <table border="1">
                    <tr>
                        <td><button class="btn btn-success" onclick="grabar()">Grabar</button></td>
                         <td><button class="btn btn-success" onclick="SumaEdadMayorMenor()">SumaEdades_&_MayorMenorEdad</button></td>
                          <td><button class="btn btn-success" onclick="HombresMayores30()">Hombres Mayores de 30 </button></td>
                             <td><button class="btn btn-warning" onclick="salir()">Salir</button></td>
                        
                        
                    </tr>
                </table>
                <font style="color: red">
                <%
                    if (request.getAttribute("mensaje") != null) {
                        String msj = (String) request.getAttribute("mensaje");
                        out.print(msj);
                    }
                %>
                </font>
            </center>
        </form>
    </center>


    <center>
        <form name="form">
            <input type="hidden" name="op">
            <input type="hidden" name="COD">
            <input type="hidden" name="APE">
            <input type="hidden" name="NOM">
            <input type="hidden" name="GEN">
            <input type="hidden" name="OCU">
            <input type="hidden" name="CUR">
            <input type="hidden" name="EDA">

            
            
            <div class="col-sm-1" >
               <!-- <div style="display:block;text-align:left;padding-top: 10px">-->
                  <CENTER>  <label>Buscador: </label></CENTER>
                <input class="filtrar-datos" datos-tabla="table table-hover"
                       style="width:650px;height:40px;color:black;font-weight:bold" type="search"
                       placeholder="Id,Ocupacion,...">
                </div>
                
                <table  class="table table-hover"  id="tablabuscar" >
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
                        <td>Modificar</td>                    
                        <td>Eliminar</td>
                    </tr>
                    </thead>
                    <% for (EstudianteBean obj : listaestudiante2) {%>
                   
                    
                    <tr>
                        <td><%=obj.getID()%></td>
                        <td><%=obj.getAPELLIDO()%></td>
                        <td><%=obj.getNOMBRE()%></td>
                        <td><%=obj.getGENERO()%></td>
                        <td><%=obj.getOCUPACION()%></td>
                        <td><%=obj.getCURRICULO()%></td>
                        <td><%=obj.getEDAD()%></td>
                        <td><button class="btn btn-success" onclick="modificar('<%=obj.getID()%>', '<%=obj.getAPELLIDO()%>', '<%=obj.getNOMBRE()%>', '<%=obj.getGENERO()%>', '<%=obj.getOCUPACION()%>', '<%=obj.getCURRICULO()%>', '<%=obj.getEDAD()%>')">Modificar</button></td>

                        <td><button class="btn btn-danger" onclick="eliminar('<%=obj.getID()%>')">Eliminar</button></td>
                    </tr>
                    <%}%>
                </table>
            </div>
        </form>
    </center>
   
<script>



// Función para buscar datos automaticamente

(function(document) {
    'use strict';

    var LightTableFilter = (function(Arr) {

        var _input;

        function _onInputEvent(e) {
            _input = e.target;
            var tables = document.getElementsByClassName(_input.getAttribute('datos-tabla'));
            Arr.forEach.call(tables, function(table) {
                Arr.forEach.call(table.tBodies, function(tbody) {
                    Arr.forEach.call(tbody.rows, _filter);
                });
            });
        }

        function _filter(row) {
            var text = row.textContent.toLowerCase(),
                val = _input.value.toLowerCase();
            row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
        }

        return {
            init: function() {
                var inputs = document.getElementsByClassName('filtrar-datos');
                Arr.forEach.call(inputs, function(input) {
                    input.oninput = _onInputEvent;
                });
            }
        };
    })(Array.prototype);

    document.addEventListener('readystatechange', function() {
        if (document.readyState === 'complete') {
            LightTableFilter.init();
        }
    });

})(document);
</script>
</body>
</html>