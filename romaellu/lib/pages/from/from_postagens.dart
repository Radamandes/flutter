import 'package:flutter_app/model/Classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_app/pages/list/list_postagens.dart';

int contador =8;

class FormPostagens extends StatefulWidget {
  final Postagens? registro;

  const FormPostagens({super.key, this.registro});

  @override
  State<FormPostagens> createState() => _FormPostagensState();
}

class _FormPostagensState extends State<FormPostagens> {
  late Postagens registro;
  final formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    if (widget.registro != null) {
      // caso de alteração de registro
      registro = widget.registro!;
    } else {
      // caso de cadastro de novo registro
      registro = Postagens(
        id_postagem: -1,
        data: '',
        texto: '',
        titulo: '',
        curtidas: 0,
        comentarios: '',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Object> dadosRegistro = {
      'id_postagem': registro.id_postagem,
      'data': registro.data,
      'texto': registro.texto,
      'titulo': registro.titulo,
      'curtidas': registro.curtidas,
      'comentarios': registro.comentarios,
      };

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Postagens'),
      ),
      body: FormBuilder(
        key: formKey,
        initialValue: dadosRegistro,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              FormBuilderTextField(
                name: 'data',
                decoration: InputDecoration(
                  label: Text('data'),
                  hintText: 'data',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 2.0,
                    horizontal: 10.0,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              FormBuilderTextField(
                name: 'texto',
                decoration: InputDecoration(
                  label: Text('texto'),
                  hintText: 'texto',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 2.0,
                    horizontal: 10.0,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              FormBuilderTextField(
                name: 'titulo',
                decoration: InputDecoration(
                  label: Text('Descrição'),
                  hintText: 'titulo',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 2.0,
                    horizontal: 10.0,
                  ),
                ),
              ),
              FormBuilderTextField(
                name: 'curtidas',
                decoration: InputDecoration(
                  label: Text('curtidas'),
                  hintText: 'curtidas',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 2.0,
                    horizontal: 10.0,
                  ),
                ),
              ),
              FormBuilderTextField(
                name: 'comentários',
                decoration: InputDecoration(
                  label: Text('comentários'),
                  hintText: 'comentários',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 2.0,
                    horizontal: 10.0,
                  ),
                ),
              ),
              
              SizedBox(
                height: 10.0,
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.save),
                label: Text('Salvar'),
                onPressed: salvarFormulario,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void salvarFormulario() {
    setState(() {
      if (formKey.currentState != null) {
        registro.data = formKey.currentState!.fields['data']!.value.toString();
        registro.texto = formKey.currentState!.fields['texto']!.value.toString();
        registro.titulo = formKey.currentState!.fields['titulo']!.value.toString();
        registro.titulo = formKey.currentState!.fields['comentário']!.value.toString();
  
        if(registro.id_postagem == -1){
          contador++;
          registro.id_postagem = contador;
          ListagemPostagens.inseriPostagens(registro);

        }

        Navigator.pop(context, true);
      }
    });

    print(registro);
  }
}
