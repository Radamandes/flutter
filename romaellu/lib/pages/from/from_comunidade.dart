import 'package:flutter_app/pages/list/list_comunidade.dart';
import 'package:flutter_app/model/Classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

int contador =8;

class FormComunidade extends StatefulWidget {
  final Comunidade? registro;

  const FormComunidade({super.key, this.registro});

  @override
  State<FormComunidade> createState() => _FormComunidadeState();
}

class _FormComunidadeState extends State<FormComunidade> {
  late Comunidade registro;
  final formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    if (widget.registro != null) {
      // caso de alteração de registro
      registro = widget.registro!;
    } else {
      // caso de cadastro de novo registro
      registro = Comunidade(
        id: -1,
        nome: '',
        assunto: '',
        descricao: '',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Object> dadosRegistro = {
      'id': registro.id,
      'nome': registro.nome,
      'assunto': registro.assunto,
      'descricao': registro.descricao,
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Comunidade'),
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
                name: 'nome',
                decoration: InputDecoration(
                  label: Text('Nome'),
                  hintText: 'nome',
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
                name: 'assunto',
                decoration: InputDecoration(
                  label: Text('Assunto'),
                  hintText: 'assunto',
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
                name: 'descricao',
                decoration: InputDecoration(
                  label: Text('Descrição'),
                  hintText: 'descricao',
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
        registro.nome = formKey.currentState!.fields['nome']!.value.toString();
        registro.assunto = formKey.currentState!.fields['assunto']!.value.toString();
        registro.descricao = formKey.currentState!.fields['descricao']!.value.toString();
  
        if(registro.id == -1){
          contador++;
          registro.id = contador;
          ListagemComunidade.inseriComunidade(registro);

        }

        Navigator.pop(context, true);
      }
    });

    print(registro);
  }
}
