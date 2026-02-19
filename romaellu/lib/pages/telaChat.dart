import 'package:flutter/material.dart';

class TelaChat extends StatefulWidget {
  @override
  _TelaChatState createState() => _TelaChatState();
}

class _TelaChatState extends State<TelaChat> {
  List<String> amigos = ['Amigo 1', 'Amigo 2', 'Amigo 3'];
  Map<String, List<String>> conversas = {};
  String amigoSelecionado = 'Amigo 1';

  TextEditingController mensagemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: [
          _buildListaAmigos(),
          Expanded(
            child: _buildConversaAtual(),
          ),
          _buildCampoMensagem(),
        ],
      ),
    );
  }

  Widget _buildListaAmigos() {
    return Container(
      height: 80.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: amigos.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                _atualizarConversaAtual(amigos[index]);
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: amigos[index] == amigoSelecionado ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  amigos[index],
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildConversaAtual() {
    List<String> mensagens = conversas[amigoSelecionado] ?? [];
    return ListView.builder(
      itemCount: mensagens.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(mensagens[index]),
        );
      },
    );
  }

  Widget _buildCampoMensagem() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: mensagemController,
              decoration: InputDecoration(
                hintText: 'Digite sua mensagem...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              String novaMensagem = mensagemController.text.trim();
              if (novaMensagem.isNotEmpty) {
                _adicionarMensagem(amigoSelecionado, novaMensagem);
                mensagemController.clear();
              }
            },
          ),
        ],
      ),
    );
  }

  void _adicionarMensagem(String amigo, String mensagem) {
    setState(() {
      if (conversas.containsKey(amigo)) {
        conversas[amigo]!.add(mensagem);
      } else {
        conversas[amigo] = [mensagem];
      }
    });
  }

  void _atualizarConversaAtual(String amigo) {
    setState(() {
      amigoSelecionado = amigo;
    });
  }
}

void main() {
  runApp(
    MaterialApp(
      home: TelaChat(),
    ),
  );
}
