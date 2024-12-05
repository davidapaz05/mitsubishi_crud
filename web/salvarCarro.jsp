<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>

<%
    String modelo = request.getParameter("modelo");
    int ano = Integer.parseInt(request.getParameter("ano"));
    String placa = request.getParameter("placa");
    String cor = request.getParameter("cor");
    String status = request.getParameter("status");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mitsubishi", "root", "");
        String sql = "INSERT INTO veiculos (modelo, ano, placa, cor, status) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, modelo);
        ps.setInt(2, ano);
        ps.setString(3, placa);
        ps.setString(4, cor);
        ps.setString(5, status);
        ps.executeUpdate();
        response.sendRedirect("index.jsp");
    } catch (Exception e) {
        out.println("Erro ao salvar dados: " + e.getMessage());
    }
%>
