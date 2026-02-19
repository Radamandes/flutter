//ignore_for_file: unused_element
import 'package:flutter_app/model/Classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/from/from_postagens.dart';
List listaPostagens=([
      Postagens(
        id_postagem: 1,
        data: 'Desenhos',
        texto: 'Desenhos',
        titulo: 'Desenhos',
        curtidas: '2',
        comentarios: 'Desenhos',
      ),
      Postagens(
        id_postagem: 2,
        data: '2',
        texto: 'Desenhos',
        titulo: 'Desenhos',
        curtidas: '2',
        comentarios: 'Desenhos',
      ),
      Postagens(
        id_postagem: 1,
        data: 'Desenhos',
        texto: 'Desenhos',
        titulo: 'Desenhos',
        curtidas: '2',
        comentarios: 'Desenhos',
      ),
     
    ]);

class ListagemPostagens extends StatefulWidget {
  const ListagemPostagens({super.key});

  @override
  State<ListagemPostagens> createState() => _ListagemPostagensState();

  static void inseriPostagens(Postagens registro) {
    listaPostagens.add(registro);

  }
}
class _ListagemPostagensState extends State<ListagemPostagens> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Listagem de Postagenss'),
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
                  label: Text('Nova Postagem'),
                  onPressed: () => exibirFormularioPostagens(null),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            DataTable(
              columns: [
                DataColumn(label: Text('data')),
                DataColumn(label: Text('texto')),
                DataColumn(label: Text('titulo')),
                DataColumn(label: Text('curtidas')),
                DataColumn(label: Text('comentários')),
              ],
              rows: listaPostagens
                  .map(
                    (Postagens) => DataRow(
                      cells: [
                        DataCell(Text(Postagens.data)),
                        DataCell( Text(Postagens.texto)),
                        DataCell(Text(Postagens.titulo)),
                        DataCell(Text(Postagens.curtidas)),
                        DataCell(Text(Postagens.comentarios)),
                      ],
                      onLongPress: () => exibirFormularioPostagens(Postagens),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  void exibirFormularioPostagens(Postagens? registro) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormPostagens(registro: registro),
      ),
    );
    if (result is bool && result) {
      setState(() {});
    }
  }

}
