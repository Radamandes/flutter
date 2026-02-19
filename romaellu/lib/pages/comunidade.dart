// pages/comunidade.dart
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/TelaComentarios.dart'; 
class Comunidade extends StatelessWidget {
  final String nomeComunidade;

  Comunidade({required this.nomeComunidade});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nomeComunidade),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildPostagens(context), // Adicione o contexto para navegação
                ],
              ),
            ),
          ),
          _buildMenu(),
        ],
      ),
    );
  }

  Widget _buildPostagens(BuildContext context) {
    return Column(
      children: List.generate(
        10, // Substitua pelo número real de postagens
        (index) => _buildPostagem(context, numeroPostagem: index + 1, texto: 'Conteúdo da Postagem ${index + 1}'),
      ),
    );
  }

  Widget _buildPostagem(BuildContext context, {required int numeroPostagem, required String texto}) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Postagem $numeroPostagem',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(texto),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                // Navegue para a tela de comentários
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaComentarios(postagemId: 'postagem$numeroPostagem'), // Substitua pelo ID real da postagem
                  ),
                );
              },
              child: Text('Ver Comentários'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenu() {
    return Container(
      color: Colors.grey[300],
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {
              // Adicione a lógica para ir para a tela de chat
            },
          ),
          _buildBotaoAdicionar(),
          IconButton(
            icon: Icon(Icons.people),
            onPressed: () {
              // Adicione a lógica para ir para a tela de amigos
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Adicione a lógica para ir para a tela de configurações
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBotaoAdicionar() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // Adicione a lógica para adicionar algo
        },
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.add,
            size: 30.0,
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Comunidade(nomeComunidade: ' Comunidade '),
    ),
  );
}
