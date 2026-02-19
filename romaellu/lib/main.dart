// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/pag_login.dart';
import 'package:flutter_app/pages/list/list_comunidade.dart';
import 'package:flutter_app/pages/list/list_usuario.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Criar um MaterialColor personalizado
    MaterialColor customColor = MaterialColor(0xFF7221BE, {
      50: Color(0xFF7221BE),
      100: Color(0xFF7221BE),
      200: Color(0xFF7221BE),
      300: Color(0xFF7221BE),
      400: Color(0xFF7221BE),
      500: Color(0xFF7221BE),
      600: Color(0xFF7221BE),
      700: Color(0xFF7221BE),
      800: Color(0xFF7221BE),
      900: Color(0xFF7221BE),
    });

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: customColor, // Usar o MaterialColor personalizado
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Teste Tela')),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Olá! Bem vindo ao talkSpace",
              style: TextStyle(fontSize: 20),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PagLogin(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_forward_sharp),
            ),
          ],
        ),
      ),
    );
  }
}

class PaginaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciamento'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              style: flatButtonStyle,
              child: Text('Usuario'),
              onPressed: () => abrirListagemUsuarios(context),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              style: flatButtonStyle,
              child: Text('Comunidade'),
              onPressed: () => abrirListagemComunidades(context),
            ),
          ],
        ),
      ),
    );
  }

  void abrirListagemUsuarios(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListagemUsuario(),
      ),
    );
  }

  void abrirListagemComunidades(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListagemComunidade(),
      ),
    );
  }
}

final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
  foregroundColor: Color.fromARGB(255, 243, 241, 241),
  backgroundColor: Color.fromARGB(255, 198, 8, 236),
);
