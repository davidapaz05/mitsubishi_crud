<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%
    String modelo = request.getParameter("modelo");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mitsubishi", "root", "");
        String sql = "DELETE FROM veiculos WHERE modelo=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, modelo);
        int resultado = ps.executeUpdate();
        if (resultado > 0) {
            out.println("Ve�culo exclu�do com sucesso!");
        } else {
            out.println("Ve�culo n�o encontrado.");
        }
    } catch (Exception e) {
        out.println("Erro ao excluir ve�culo: " + e.getMessage());
    }
%>
