    document.getElementById('logout-button').addEventListener('click', () => {
    localStorage.removeItem('token');
    sessionStorage.clear();
    window.location.href = 'login.html';
});

 function mostrarUsuarioLogado() {
            const userInfo = document.getElementById('user');
            const usuarioLogado = localStorage.getItem('usuarioLogado');
            
            if (usuarioLogado) {
                const usuario = JSON.parse(usuarioLogado);
                userInfo.innerHTML = `
                    <h4 class="user-name"> ${usuario.nome}</h4>`;
            } else {
                // Se não estiver logado, redireciona para o login
                window.location.href = 'login.html';
            }
        }

        // Função de logout
        function logout() {
            localStorage.removeItem('usuarioLogado');
            window.location.href = 'login.html';
        }

        // Chama a função quando a página carregar
        mostrarUsuarioLogado();

        const API = 'http://localhost:8080/usuarios';
        const tabela = document.getElementById('tabelaUsuarios');
        const mensagem = document.getElementById('mensagem');

        function carregarUsuarios() {
            fetch(API /*, {
            headers: { 'Authorization': 'Bearer + token }
        }*/)
            .then (res => {
                if (!res.ok) throw new Error();
                return res.json();
            })
            .then(usuarios => {
                tabela.innerHTML = '';

                if (usuarios.length === 0){
                    tabela.innerHTML = `
                    <tr>
                        <td colspan="5" style="text-align:center">Nenhum usuário cadastrado</td>
                    </tr>`;
                    return;
                }

                usuarios.forEach(u => {
                    tabela.innerHTML += `
                    <tr> 
                        <td>${u.nome}</td>
                        <td>${u.email}</td>
                        <td>${u.perfil}</td>
                        <td>${u.cidade || ''}</td>
                        <td>
                            <button class = "editar" onclick="atualizarUsuario(${u.id})">Editar</button>
                            <button class = "deletar" onclick="deletar(${u.id})">Excluir</button>
                        </td> 
                    </tr>
                    `;
                });
            })
            .catch(() => {
                mensagem.innerHTML = '<span class = "erro">Erro ao carregar usuários.</span>';
            })
        }

        function novoUsuario (){
            window.location.href = 'usuarios.html';
        }

        function atualizarUsuario(id) {
         window.location.href = `index.html?id=${id}`;
    }

        function deletar(id) {
            if (!confirm('Deseja realmente excluir este usuário?')) return;

            fetch(`${API}/${id}`, {
                method: 'DELETE'/*,
                headers:{ 'Authorization: 'Bearer' + token} */
            })
            .then (res => {
                if(!res.ok) throw new Error ();
                carregarUsuarios();
            })
            .catch(() => {
                mensagem.innerHTML = '<span class="erro">Erro ao excluir usuário.</span>';
            });
        }

        carregarUsuarios();