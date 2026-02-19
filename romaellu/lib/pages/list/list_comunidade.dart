//ignore_for_file: unused_element
import 'package:flutter_app/model/Classes.dart';
import 'package:flutter_app/pages/from/from_comunidade.dart';
import 'package:flutter/material.dart';
List listaComunidade=([
      Comunidade(
        id: 1,
        nome: 'Desenhos',
        assunto: 'Desenhos',
        descricao: 'Desenhos',
      ),
      Comunidade(
        id: 2,
        nome: 'Livros',
        assunto: 'Livros',
       descricao: 'Livros',
      ),
      Comunidade(
        id: 3,
        nome: 'Receita',
        assunto: 'Receita',
       descricao: 'Receita',
      ),
      Comunidade(
        id: 4,
        nome: 'Musicas',
        assunto: 'Musicas',
       descricao: 'Musicas',
      ),  
    ]);

class ListagemComunidade extends StatefulWidget {
  const ListagemComunidade({super.key});

  @override
  State<ListagemComunidade> createState() => _ListagemComunidadeState();

  static void inseriComunidade(Comunidade registro) {
    listaComunidade.add(registro);

  }
}
class _ListagemComunidadeState extends State<ListagemComunidade> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Listagem de Comunidades'),
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
                  label: Text('Novo Comunidade'),
                  onPressed: () => exibirFormularioComunidade(null),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            DataTable(
              columns: [
                DataColumn(label: Text('nome')),
                DataColumn(label: Text('assunto')),
                DataColumn(label: Text('descricao')),
              ],
              rows: listaComunidade
                  .map(
                    (Comunidade) => DataRow(
                      cells: [
                        DataCell(Text(Comunidade.nome)),
                        DataCell( Text(Comunidade.assunto)),
                        DataCell(Text(Comunidade.descricao)),
                      ],
                      onLongPress: () => exibirFormularioComunidade(Comunidade),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  void exibirFormularioComunidade(Comunidade? registro) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormComunidade(registro: registro),
      ),
    );
    if (result is bool && result) {
      setState(() {});
    }
  }

}
