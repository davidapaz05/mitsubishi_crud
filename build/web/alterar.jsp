<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%
    String modelo = request.getParameter("modelo");
    String ano = "", placa = "", cor = "", status = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mitsubishi", "root", "");
        String sql = "SELECT * FROM veiculos WHERE modelo=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, modelo);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            ano = rs.getString("ano");
            placa = rs.getString("placa");
            cor = rs.getString("cor");
            status = rs.getString("status");
        }
    } catch (Exception e) {
        out.println("Erro ao carregar dados: " + e.getMessage());
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Alterar Carro - Mitsubishi</title>
    <link rel="stylesheet" href="CSS/index.css">
    <link rel="stylesheet" href="CSS/imagens.css">
</head>
<body>
    <header>
        <div class="logo">
            <img src="IMG/Mitsubishi-Simbolo.jpg" alt="" id="mitsubishi">
        </div>
        <h2>Alterar Carro</h2>
    </header>

    <main>
        <section class="formulario">
            <form action="salvarAlteracao.jsp" method="post">
                <input type="hidden" name="modelo_antigo" value="<%= modelo %>">
                <label for="modelo">Modelo:</label>
                <input type="text" id="modelo" name="modelo" value="<%= modelo %>" required>

                <label for="ano">Ano:</label>
                <input type="number" id="ano" name="ano" value="<%= ano %>" required>

                <label for="placa">Placa:</label>
                <input type="text" id="placa" name="placa" value="<%= placa %>" required>

                <label for="cor">Cor:</label>
                <input type="text" id="cor" name="cor" value="<%= cor %>" required>

                <label for="status">Status:</label>
                <select id="status" name="status" required>
                    <option value="disponível" <%= "disponível".equals(status) ? "selected" : "" %>>Disponível</option>
                    <option value="vendido" <%= "vendido".equals(status) ? "selected" : "" %>>Vendido</option>
                </select>

                <button type="submit">Salvar</button>
            </form>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Mitsubishi Motors</p>
    </footer>
</body>
</html>
