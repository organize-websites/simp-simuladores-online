class Contato{
  int id;
  String nome;
  String email;
  String imagem;
  String token;
  String login;

  Contato(this.id, this.nome, this.email,this.imagem,this.token, this.login);

  Map<String,dynamic> toMap() {
    var map = <String,dynamic> {
      'id':id,
      'nome': nome,
      'email': email,
      'imagem': imagem,
      'token': token,
      'login': login
    };
    return map;
  }

  Contato.fromMap(Map<String,dynamic> map){
    id = map['id'];
    nome = map['nome'];
    email = map['email'];
    imagem = map['imagem'];
    token = map['token'];
    login = map['login'];
  }

  @override
  String toString(){
    return "Contato => (id: $id, nome: $nome, email: $email, imagem: $imagem, token: $token, login: $login)";
  }
}