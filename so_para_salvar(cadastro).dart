import 'package:flutter/material.dart';

class PagCadastro extends StatefulWidget {
  final bool verUsuarios;

  const PagCadastro({Key? key, this.verUsuarios = false}) : super(key: key);

  @override
  State<PagCadastro> createState() => _PagCadastroState();
}

class _PagCadastroState extends State<PagCadastro> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController sobrenomeController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();
  TextEditingController sexoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmarSenhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.verUsuarios ? "Usuários Cadastrados" : "Cadastro"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: widget.verUsuarios
            ? _buildListaUsuarios()  // Exibe a lista de usuários
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildTextField("Nome", nomeController),
                  _buildTextField("Sobrenome", sobrenomeController),
                  _buildTextField("Data de Nascimento", dataNascimentoController),
                  _buildTextField("Sexo", sexoController),
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
        // Implemente aqui a lógica para cadastrar o usuário
        // Isso pode envolver o uso de uma API, banco de dados, etc.
      },
      child: Text("Cadastrar"),
    );
  }

  Widget _buildListaUsuarios() {
    // Implemente aqui a lógica para exibir a lista de usuários
    // Isso pode envolver o uso de uma API, banco de dados, etc.
    return Center(
      child: Text("Lista de usuários cadastrados"),
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
