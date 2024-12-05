<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Carro - Mitsubishi</title>
    <link rel="stylesheet" href="CSS/index.css">
</head>
<body>
    <header>
        
        <h2>Cadastro de Carro</h2>
    </header>

    <main>
        <section class="formulario">
            <form action="salvarCarro.jsp" method="post">
                <label for="modelo">Modelo:</label>
                <input type="text" id="modelo" name="modelo" required>

                <label for="ano">Ano:</label>
                <input type="number" id="ano" name="ano" required>

                <label for="placa">Placa:</label>
                <input type="text" id="placa" name="placa" required>

                <label for="cor">Cor:</label>
                <input type="text" id="cor" name="cor" required>

                <label for="status">Status:</label>
                <select id="status" name="status">
                    <option value="disponível">Disponível</option>
                    <option value="vendido">Vendido</option>
                </select>

                <button type="submit">Salvar</button>
            </form>
        </section>
    </main>

    
</body>
</html>
