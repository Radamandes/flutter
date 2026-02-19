import 'package:flutter/material.dart';
import 'package:flutter_app/model/Classes.dart';
import 'package:flutter_app/pages/from/from_usuario.dart';

List<Usuario> listaUsuario = [
  Usuario(
    id: 1,   
    nome: 'Jão',
    sobrenome: 'Da silva',
    dataNascimento: '',
    sexo: '',
    email: '',
    senha: '',
    telefone: '',
  ),
  Usuario(
    id: 2,   
    nome: '',
    sobrenome: '',
    dataNascimento: '',
    sexo: '',
    email: '',
    senha: '',
    telefone: '',
  ),
  Usuario(
    id: 3,   
    nome: 'Pedro',
    sobrenome: '',
    dataNascimento: '',
    sexo: '',
    email: '',
    senha: '',
    telefone: '',
  ),
];

class ListagemUsuario extends StatefulWidget {
  const ListagemUsuario({Key? key});

  @override
  State<ListagemUsuario> createState() => _ListagemUsuarioState();
}

class _ListagemUsuarioState extends State<ListagemUsuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Listagem de Usuarios'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Row(
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.plus_one),
                  label: Text('Adicionar Novo Usuário '),
                  onPressed: () => exibirFormularioUsuario(null),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            DataTable(
              columns: [
                DataColumn(label: Text('Nome')),
                DataColumn(label: Text('Sobrenome')),
                DataColumn(label: Text('Data de Nascimento')),
                DataColumn(label: Text('Sexo')),
                DataColumn(label: Text('Telefone')),
                DataColumn(label: Text('Email')),
                DataColumn(label: Text('Senha')),
              ],
              rows: listaUsuario
                  .map(
                    (usuario) => DataRow(
                      cells: [
                        DataCell(Text(usuario.nome)),
                        DataCell(Text(usuario.sobrenome)),
                        DataCell(Text(usuario.dataNascimento)),
                        DataCell(Text(usuario.sexo)),
                        DataCell(Text(usuario.telefone)),
                        DataCell(Text(usuario.email)),
                        DataCell(Text(usuario.senha)),
                      ],
                      onLongPress: () => exibirFormularioUsuario(usuario),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  void exibirFormularioUsuario(Usuario? usuario) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormUsuario(registro: usuario, onUpdate: atualizarLista),
      ),
    );
    if (result is bool && result) {
      atualizarLista();
    }
  }

  void atualizarLista() {
    setState(() {});
  }
}

void main() {
  runApp(
    MaterialApp(
      home: ListagemUsuario(),
    ),
  );
}
