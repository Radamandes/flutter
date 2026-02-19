class Comunidade {
  int id;
  String nome;
  String assunto;
  String descricao;

  Comunidade(
      {required this.id,
      required this.nome,
      required this.assunto,
      required this.descricao});
  @override
  String toString() {
    return 'Comunidade {código: $id, nome: $nome, assunto: $assunto, descricao: $descricao}';
  }
}

class Assunto {
  int id_assunto;
  String nome;
  String descricao;
  bool estado;

  Assunto(this.nome, this.descricao, this.estado, this.id_assunto);
}

class Usuario {
  int id;
  String nome;
  String sobrenome;
  String dataNascimento;
  String sexo;
  String telefone;
  String email;
  String senha;


  Usuario(
      {required this.id,
      required this.nome,
      required this.sobrenome,
      required this.dataNascimento,
      required this.sexo,
      required this.email,
      required this.senha,
      required this.telefone});

  @override
  String toString() {
    return 'Usuario {id: $id, nome: $nome, sobrenome: $sobrenome,dataNascimento: $dataNascimento,sexo: $sexo email:$email, senha: $senha, telefone: $telefone}';
  }
}

class Chat {
  int id_chat;
  String mensagem;
  String chave_de_acesso;
  Usuario usuario;

  Chat(this.mensagem, this.chave_de_acesso, this.usuario, this.id_chat);
}

class Postagens {
  int id_postagem;
  String data;
  String texto;
  String titulo;
  String curtidas;
  String comentarios;

  Postagens({required this.data, required this.texto, required this.titulo, required this.curtidas, required this.id_postagem,
      required this.comentarios});
}

class Imagens extends Postagens {
  double tamanho;
  Imagens(int id_postagem, String data, String texto, String titulo,
      String curtidas, String comentarios, this.tamanho)
      : super(data: data, texto: texto, titulo: titulo, curtidas: curtidas, id_postagem: id_postagem, comentarios: comentarios);
}

class Videos extends Postagens {
  double tempo;
  double tamanho;
  Videos(int id_postagem, String data, String texto, String titulo,
      String curtidas, String comentarios, this.tempo, this.tamanho)
      : super(data: data, texto: texto, titulo: titulo, curtidas: curtidas, id_postagem: id_postagem, comentarios: comentarios);
}

class Enquetes extends Postagens {
  String dataInicio;
  String dataFim;
  String texto_enquete;
  Alternativa alternativa;

  Enquetes(
      int id_postagem,
      String data,
      String texto,
      String titulo,
      String curtidas,
      String comentarios,
      this.dataInicio,
      this.dataFim,
      this.texto_enquete,
      this.alternativa)
      : super(data: data, texto: texto, titulo: titulo, curtidas: curtidas, id_postagem: id_postagem, comentarios: comentarios);
}

class Alternativa {
  int id_alternativa;
  String texto;
  int quantidade;

  Alternativa(this.texto, this.quantidade, this.id_alternativa);
}
