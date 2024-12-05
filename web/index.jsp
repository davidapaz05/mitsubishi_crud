

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciamento de Carros - Mitsubishi</title>
    <link rel="stylesheet" href="CSS/index.css">
    <link rel="stylesheet" href="CSS/imagens.css">
</head>
<body>
    <header>
        <div class="logo">
            <img src="IMG/Mitsubishi-Simbolo.jpg" alt="" id="mitsubishi">
        </div>
        <h2>Gerenciamento de Carros</h2>
    </header>

    <main>
        <section class="menu">
            <button onclick="document.getElementById('iframe').src='cadastro.jsp'"><img src="IMG/pngtree-vector-add-icon-png-image_956621.svg" alt="" id="icone"></button>
            <button onclick="document.getElementById('iframe').src='lista.jsp'"><img src="IMG/pngtree-check-list-icon-isolated-on-abstract-background-png-image_1776830.jpg" alt="" id="icone"></button>
        </section>

        <iframe src='lista.jsp' id="iframe" name="iframe" width="100%" height="500px"></iframe>
    </main>

    <footer>
        <p>&copy; 2024 Mitsubishi Motors</p>
    </footer>
</body>
</html>

