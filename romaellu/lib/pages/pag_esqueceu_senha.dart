import 'package:flutter/material.dart';

class EsqueceuSenha extends StatefulWidget {
  const EsqueceuSenha({Key? key}) : super(key: key);

  @override
  _EsqueceuSenhaState createState() => _EsqueceuSenhaState();
}

class _EsqueceuSenhaState extends State<EsqueceuSenha> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Esqueceu Senha"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField("Email", emailController),
            const SizedBox(height: 20),
            _buildResetPasswordButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildResetPasswordButton() {
    return ElevatedButton(
      onPressed: () {
        // Implement your logic to send a password reset link here
        // You can use the email entered in emailController
        // For simplicity, let's print the email for now
        String email = emailController.text;

        // Show a pop-up with the message
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Cheque o Email"),
              content: Text("Um link de recuperação de senha foi enviado para \"$email\". "),
              actions: [
                TextButton(
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      },
      child: Text("Recuperar Senha"),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: EsqueceuSenha(),
    ),
  );
}
