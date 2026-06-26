document.addEventListener("DOMContentLoaded", () => {
  const btnEntrar = document.getElementById("btn-entrar-login");
  const userInput = document.getElementById("user");
  const passInput = document.getElementById("pass");

  // 🔐 FUNÇÃO PRINCIPAL DE LOGIN
  // Isolamos a lógica aqui para poder chamá-la de dois jeitos diferentes
  const realizarLogin = () => {
    const usuario = userInput.value.trim();
    const senha = passInput.value;

    if (usuario === "admin" && senha === "admin") {
      localStorage.setItem("teclibras_role", "professor");
      localStorage.setItem("teclibras_user", "Professor Admin");
      window.location.href = "index.html";
    } else if (usuario === "aluno" && senha === "aluno") {
      localStorage.setItem("teclibras_role", "aluno");
      localStorage.setItem("teclibras_user", "Aluno");
      window.location.href = "index.html";
    } else {
      alert("Usuário ou senha incorretos! Use 'admin' ou 'aluno'.");
    }
  };

  // 🖱️ 1º JEITO: Ouvinte para o clique no botão "Entrar"
  if (btnEntrar) {
    btnEntrar.addEventListener("click", realizarLogin);
  }

  // ⌨️ 2º JEITO: Ouvinte para a tecla "Enter" dentro dos campos de texto
  const checarTeclaEnter = (evento) => {
    if (evento.key === "Enter") {
      realizarLogin();
    }
  };

  // Ativa a escuta do "Enter" tanto no campo de usuário quanto no de senha
  if (userInput) userInput.addEventListener("keydown", checarTeclaEnter);
  if (passInput) passInput.addEventListener("keydown", checarTeclaEnter);
});