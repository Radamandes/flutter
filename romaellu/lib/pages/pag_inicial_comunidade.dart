// pages/pagina_inicial.dart
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'comunidade.dart'; // Importe a tela de comunidade

class PaginaInicial extends StatelessWidget {
  final List<String> comunidades = ['Comunidade 1', 'Comunidade 2', 'Comunidade 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Inicial'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Principais Comunidades',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Center(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  autoPlay: false,
                ),
                items: comunidades.map((comunidade) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          // Navega para a tela de comunidade quando a comunidade é clicada
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Comunidade(nomeComunidade: comunidade),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                          ),
                          child: Center(
                            child: Text(
                              comunidade,
                              style: TextStyle(fontSize: 24.0, color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ),
          _buildMenu(),
        ],
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
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              // Adicione a lógica para voltar à tela inicial
            },
          ),
          _buildAdicionarButton(),
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

  Widget _buildAdicionarButton() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blueAccent,
      ),
      child: IconButton(
        icon: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          // Adicione a lógica para o botão de adicionar
        },
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: PaginaInicial(),
    ),
  );
}
