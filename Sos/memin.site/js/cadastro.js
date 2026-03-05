const params = new URLSearchParams(window.location.search);
    const idUsuario = params.get('id');

    const form = document.getElementById('usuarioForm');
    const mensagem = document.getElementById('mensagem');

    if (idUsuario) {
        carregarUsuario(idUsuario);
    } else {
        senha.required = true;
    }

    function carregarUsuario(id) {
        fetch(`http://localhost:8080/usuarios/${id}`)
            .then(res => {
                if (!res.ok) throw new Error();
                return res.json();
            })
            .then(u => {
                document.getElementById('id').value = u.id;
                document.getElementById('nome').value = u.nome;
                document.getElementById('email').value = u.email;
                perfil.value = u.perfil;
                endereco.value = u.endereco || '';
                bairro.value = u.bairro || '';
                complemento.value = u.complemento || '';
                cep.value = u.cep || '';
                cidade.value = u.cidade || '';
                estado.value = u.estado || '';
                fotoBase64 = u.foto;
                preview.src = u.foto;
                preview.style.display = 'block';
            })
            .catch(() => {
                mensagem.innerHTML =
                    '<span class="erro">Erro ao carregar usuário para edição.</span>';
            });
    }

form.addEventListener('submit', function(e) {
    e.preventDefault();

    const usuario = {
        id: idUsuario ? Number(idUsuario) : undefined,
        nome: document.getElementById('nome').value.trim(),
        email: document.getElementById('email').value.trim(),
        senha: document.getElementById('senha').value,
        perfil: document.getElementById('perfil').value,
        endereco: document.getElementById('endereco').value.trim(),
        bairro: document.getElementById('bairro').value.trim(),
        complemento: document.getElementById('complemento').value.trim(),
        cep: document.getElementById('cep').value.trim(),
        cidade: document.getElementById('cidade').value.trim(),
        estado: document.getElementById('estado').value.trim(),
        foto: fotoBase64
    };

    fetch('http://localhost:8080/usuarios', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(usuario)
    })
    .then(res => {
        if (!res.ok) throw new Error();
        alert("Usuário cadastrado com sucesso!");
        document.getElementById("botao").onclick = function () {
        window.location.href = "http://127.0.0.1:5500/usuarios.html";
};

    })
    .catch(() => {
        mensagem.innerHTML = '<span class="erro">Erro ao cadastrar usuário.</span>';
    });
});

       fotoInput.addEventListener('change', function() {
         const arquivo = this.files[0];
        if (arquivo) {
        const reader = new FileReader();
         reader.onload = function(e) {
        fotoBase64 = e.target.result; // Aqui está o texto da imagem
        preview.src = fotoBase64;
        preview.style.display = 'block';
};
reader.readAsDataURL(arquivo);
}
});