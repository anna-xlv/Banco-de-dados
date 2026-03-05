 const API = 'http://localhost:8080/usuarios';
        const form = document.getElementById('login');

        form.addEventListener('submit', function (e) {

            e.preventDefault();
            email = document.getElementById('email').value;
            senha = document.getElementById('senha').value;

            fetch("http://localhost:8080/usuarios/login", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({
                    email: email,
                    senha: senha
                })
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error("Email ou senha inválidos");
                }
                return response.json();
            })
            .then(usuario => {
                localStorage.setItem("usuarioLogado", JSON.stringify(usuario));
                window.location.href = "usuarios.html";
            })
            .catch(error => {
                errorMsg.textContent = error.message;
            });
                });
