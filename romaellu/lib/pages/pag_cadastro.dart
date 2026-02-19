import 'package:flutter/material.dart';
import 'package:flutter_app/model/Classes.dart';

class PagCadastro extends StatefulWidget {
  final bool verUsuarios;

  const PagCadastro({Key? key, this.verUsuarios = false}) : super(key: key);

  @override
  State<PagCadastro> createState() => _PagCadastroState();
}

class _PagCadastroState extends State<PagCadastro> {
  List<Usuario> usuarios = [];

  TextEditingController nomeController = TextEditingController();
  TextEditingController sobrenomeController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();
  TextEditingController sexoController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmarSenhaController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.verUsuarios ? "Usuários Cadastrados" : "Cadastro"),
      ),
      body: widget.verUsuarios 
            ? _buildListaUsuarios() 
            : SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildTextField("Nome", nomeController),
                    _buildTextField("Sobrenome", sobrenomeController),
                    _buildTextField("Data de Nascimento", dataNascimentoController),
                    _buildTextField("Sexo", sexoController),
                    _buildTextField("Telefone", telefoneController),
                    _buildTextField("Email", emailController),
                    _buildTextField("Senha", senhaController, isPassword: true),
                    _buildTextField("Confirmar Senha", confirmarSenhaController, isPassword: true),
                    const SizedBox(height: 20),
                    _buildCadastrarButton(),
                  ],
              ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildCadastrarButton() {
    return ElevatedButton(
      onPressed: () {
        // Verifica se as senhas coincidem
        if (senhaController.text == confirmarSenhaController.text) {
          // Cria um novo usuário
          Usuario novoUsuario = Usuario(
            id: 1, 
            nome: nomeController.text,
            sobrenome: sobrenomeController.text,
            dataNascimento: dataNascimentoController.text,
            sexo: sexoController.text,
            telefone:telefoneController.text, 
            email: emailController.text,
            senha: senhaController.text, 
  
          );

          // Adiciona o novo usuário à lista
          usuarios.add(novoUsuario);

          // Limpa os campos após o cadastro
          nomeController.clear();
          sobrenomeController.clear();
          dataNascimentoController.clear();
          sexoController.clear();
          telefoneController.clear();
          emailController.clear();
          senhaController.clear();
          confirmarSenhaController.clear();

          // Atualiza a interface (setState)
          setState(() {});
        } else {
          // Senhas não coincidem, exibir mensagem de erro
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("As senhas não coincidem."),
          ));
        }
      },
      child: Text("Cadastrar"),
    );
  }

  Widget _buildListaUsuarios() {
    print(usuarios.length);
    return ListView.builder(
      itemCount: usuarios.length,
      itemBuilder: (context, index) {
        Usuario usuario = usuarios[index];
        return ListTile(
          title: Text("${usuario.nome} ${usuario.sobrenome}"),
          subtitle: Text("${usuario.email} - ${usuario.dataNascimento}"),
        );
      },
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: PagCadastro(),
    ),
  );
}
