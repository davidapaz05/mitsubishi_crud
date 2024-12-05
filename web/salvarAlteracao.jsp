<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%
    String modeloAntigo = request.getParameter("modelo_antigo");
    String modelo = request.getParameter("modelo");
    int ano = Integer.parseInt(request.getParameter("ano"));
    String placa = request.getParameter("placa");
    String cor = request.getParameter("cor");
    String status = request.getParameter("status");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mitsubishi", "root", "");
        String sql = "UPDATE veiculos SET modelo=?, ano=?, placa=?, cor=?, status=? WHERE modelo=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, modelo);
        ps.setInt(2, ano);
        ps.setString(3, placa);
        ps.setString(4, cor);
        ps.setString(5, status);
        ps.setString(6, modeloAntigo);
        int resultado = ps.executeUpdate();
        if (resultado > 0) {
            out.println("Veículo alterado com sucesso!");
        } else {
            out.println("Erro ao alterar veículo.");
        }
        response.sendRedirect("lista.jsp");
    } catch (Exception e) {
        out.println("Erro ao alterar dados: " + e.getMessage());
    }
%>
