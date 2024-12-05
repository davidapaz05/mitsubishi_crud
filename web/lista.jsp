<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Carros - Mitsubishi</title>
    <link rel="stylesheet" href="CSS/index.css">
    <link rel="stylesheet" href="CSS/imagens.css">
</head>
<body>
    <header>
        <div class="logo">
            <img src="IMG/Mitsubishi-Simbolo.jpg" alt="" id="mitsubishi">
        </div>
        <h2>Lista de Carros</h2>
    </header>

    <main>
        <section class="tabela">
            <h3>Lista de Carros</h3>
            <table>
                <thead>
                    <tr>
                        <th>Modelo</th>
                        <th>Ano</th>
                        <th>Placa</th>
                        <th>Cor</th>
                        <th>Status</th>
                        <th>Alterar</th>
                        <th>Excluir</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mitsubishi", "root", "");
                            String sql = "SELECT * FROM veiculos";
                            PreparedStatement st = con.prepareStatement(sql);
                            ResultSet rs = st.executeQuery();
                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getString("modelo") %></td>
                        <td><%= rs.getInt("ano") %></td>
                        <td><%= rs.getString("placa") %></td>
                        <td><%= rs.getString("cor") %></td>
                        <td><%= rs.getString("status") %></td>
                        <td><a href="alterar.jsp?modelo=<%= rs.getString("modelo") %>">Alterar</a></td>
                        <td><a href="excluir.jsp?modelo=<%= rs.getString("modelo") %>">Excluir</a></td>
                    </tr>
                    <%
                            }
                        } catch (Exception ex) {
                            out.print("Erro ao carregar lista: " + ex.getMessage());
                        }
                    %>
                </tbody>
            </table>
        </section>
    </main>

</body>
</html>
