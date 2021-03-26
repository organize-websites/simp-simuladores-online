class Usuario {
  String token;
  String usertoken;
  String userpass;
  String name;
  String logotipo;
  String email;
  String id;
  String login;
 
  Usuario({this.token, this.userpass, this.usertoken, this.name, this.logotipo, this.email, this.id, this.login});

  Usuario.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    usertoken = json['user_token'];
    userpass = json['user_pass'];
    name = json['name'];
    logotipo = json['logotipo_usuario'];
    email = json['email'];
    id = json['id'];
    login = json['login'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['user_token'] = this.usertoken;
    data['user_pass'] = this.userpass;
    data['name'] = this.name;
    data['logotipo_usuario'] = this.logotipo;
    data['email'] = this.email;
    data['id'] = this.id;
    data['login'] = this.login;
    return data;
  }

  String toString() {
    return 'Usuario(token: $token)';
  }

  String toString2() {
    return 'Usuario(user_token: $usertoken)';
  }

  String toString3() {
    return 'Usuario(user_pass: $userpass)';
  }

  String toString4() {
    return 'Usuario(name: $name)';
  }

  String toString5() {
    return 'Usuario(logotipo_usuario: $logotipo)';
  }

  String toString6() {
    return 'Usuario(email: $email)';
  }
  
  String toString7() {
    return 'Usuario(id: $id)';
  }
  
  String toString8() {
    return 'Usuario(login: $login)';
  }

}