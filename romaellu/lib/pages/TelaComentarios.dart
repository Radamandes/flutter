import 'package:flutter/material.dart';

class TelaComentarios extends StatefulWidget {
  final String postagemId; // ID da postagem ou alguma identificação única

  TelaComentarios({required this.postagemId});

  @override
  _TelaComentariosState createState() => _TelaComentariosState();
}

class _TelaComentariosState extends State<TelaComentarios> {
  List<String> comentarios = ['Comentário 1', 'Comentário 2']; // Lista de comentários

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comentários'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: comentarios.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(comentarios[index]),
                );
              },
            ),
          ),
          _buildCampoComentario(),
        ],
      ),
    );
  }

  Widget _buildCampoComentario() {
    TextEditingController comentarioController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: comentarioController,
              decoration: InputDecoration(
                hintText: 'Adicione um comentário...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              String novoComentario = comentarioController.text.trim();
              if (novoComentario.isNotEmpty) {
                // Adiciona o novo comentário à lista
                setState(() {
                  comentarios.add(novoComentario);
                });
                // Limpa o campo de texto
                comentarioController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: TelaComentarios(
        postagemId: '123', // Substitua pelo ID real da postagem
      ),
    ),
  );
}
