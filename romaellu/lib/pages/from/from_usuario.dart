// from_usuario.dart
import 'package:flutter/material.dart';
import 'package:flutter_app/model/Classes.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormUsuario extends StatefulWidget {
  final Usuario? registro;
  final Function()? onUpdate;

  const FormUsuario({Key? key, this.registro, this.onUpdate});

  @override
  State<FormUsuario> createState() => _FormUsuarioState();
}

class _FormUsuarioState extends State<FormUsuario> {
  late Usuario registro;
  final formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    if (widget.registro != null) {
      registro = widget.registro!;
    } else {
      registro = Usuario(
        id: 1,
        nome: '',
        sobrenome: '',
        dataNascimento: '',
        sexo: '',
        email: '',
        senha: '',
        telefone: '',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Object> dadosRegistro = {
      'nome': registro.nome,
      'sobrenome': registro.sobrenome,
      'dataNascimento': registro.dataNascimento,
      'sexo': registro.sexo,
      'email': registro.email,
      'telefone': registro.telefone,
      'senha': registro.senha,
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Usuario'),
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
                  hintText: 'nome ',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 2.0,
                    horizontal: 10.0,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              FormBuilderTextField(
                name: 'idade',
                decoration: InputDecoration(
                  label: Text('Idade'),
                  hintText: 'idade',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 2.0,
                    horizontal: 10.0,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              FormBuilderTextField(
                name: 'telefone',
                decoration: InputDecoration(
                  label: Text('Telefone'),
                  hintText: 'telefone',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 2.0,
                    horizontal: 10.0,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              FormBuilderTextField(
                name: 'email',
                decoration: InputDecoration(
                  label: Text('Email'),
                  hintText: 'email',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 2.0,
                    horizontal: 10.0,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
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
        registro.nome = formKey.currentState!.fields['Nome']!.value.toString();
        registro.sobrenome =
            formKey.currentState!.fields['Sobrenome']!.value.toString();
        registro.dataNascimento = formKey
            .currentState!.fields['Data de Nascimento']!.value
            .toString();
        registro.sexo = formKey.currentState!.fields['Sexo']!.value.toString();
        registro.telefone =
            formKey.currentState!.fields['Telefone']!.value.toString();
        registro.email =
            formKey.currentState!.fields['Email']!.value.toString();
        registro.senha =
            formKey.currentState!.fields['Senha']!.value.toString();
        widget.onUpdate?.call();

        Navigator.pop(context, true);
      }
    });
  }
}
