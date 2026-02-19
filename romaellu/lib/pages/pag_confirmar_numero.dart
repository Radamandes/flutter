import 'package:flutter/material.dart';
import 'package:flutter_app/pages/pag_inicial_comunidade.dart'; // Certifique-se de ajustar o caminho correto

class VerificarNumero extends StatefulWidget {
  @override
  _VerificarNumeroState createState() => _VerificarNumeroState();
}

class _VerificarNumeroState extends State<VerificarNumero> {
  TextEditingController numeroController = TextEditingController();
  TextEditingController codigoController = TextEditingController();
  String mensagem = '';
  bool codigoEnviado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verificar Número'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: numeroController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Número',
              ),
            ),
            SizedBox(height: 20),
            // Se o código não foi enviado, mostra o botão para enviar o código
            if (!codigoEnviado)
              ElevatedButton(
                onPressed: () {
                  enviarCodigo();
                },
                child: Text('Enviar Código'),
              ),
            // Se o código foi enviado, mostra o campo para inserir o código
            if (codigoEnviado)
              Column(
                children: [
                  TextField(
                    controller: codigoController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Código',
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ElevatedButton(
              onPressed: () {
                verificarNumero();
              },
              child: Text('Verificar'),
            ),
            SizedBox(height: 20),
            Text(
              mensagem,
              style: TextStyle(
                color: mensagem.contains('sucesso') ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void enviarCodigo() {
    // Lógica para enviar o código para o número de telefone
    // Aqui você pode implementar a lógica de envio do código via SMS, chamada telefônica, etc.
    // Neste exemplo, consideramos que o código "123456" será enviado
    // (Normalmente, você usaria um serviço de mensagens SMS para esta parte)
    setState(() {
      codigoEnviado = true;
      mensagem = 'Código enviado para ${numeroController.text}.';
    });
  }

  void verificarNumero() {
    String numero = numeroController.text.trim();
    String codigo = codigoController.text.trim();

    if (numero.isEmpty) {
      setState(() {
        mensagem = 'Por favor, insira um número.';
      });
      return;
    }

    if (!codigoEnviado) {
      setState(() {
        mensagem = 'Por favor, envie o código primeiro.';
      });
      return;
    }

    // Lógica de verificação do código
    // Aqui você pode implementar sua própria lógica de verificação
    // Neste exemplo, consideramos que o código "123456" é válido
    if (codigo == '123456') {
      setState(() {
        mensagem = 'Número verificado com sucesso!';
      });

      // Navega para a página inicial após verificar o número com sucesso
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PaginaInicial(),
      ));
    } else {
      setState(() {
        mensagem = 'Código inválido. Tente novamente.';
      });
    }
  }
}


void main() {
  runApp(
    MaterialApp(
      home: VerificarNumero(),
    ),
  );
}
