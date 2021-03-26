import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simp/homesimp.dart';
import 'package:simp/privacidade.dart';

import 'alerta.dart';
import 'api/api.dart';
import 'api/home_block.dart';
import 'esqueci_a_senha.dart';


class MudaUsr extends StatefulWidget {
  MudaUsr({Key key, this.title}) : super(key: key); 

 
  final String title;

  @override
  _MudaUsrState createState() => _MudaUsrState();
}

class _MudaUsrState extends State<MudaUsr> {

  var bloc = BlocHome();

  initState() {
    bloc.initOneSignal();
    super.initState();
  }

  final RoundedLoadingButtonController _btnController = new RoundedLoadingButtonController();

  void _doSomething() async {
    Timer(Duration(seconds: 3), () {
      _btnController.reset();
    });
  }

  static Future<String> get _usrid async {

  var prefs = await SharedPreferences.getInstance();
  String oneid = (prefs.getString("oneid") ?? "");

String toString() {
    return '$oneid';
  }

    await Future.delayed(Duration(seconds: 1));
    return '$oneid';
  } 

  
  final _tLogin = TextEditingController();

  final _tSenha = TextEditingController();

  final _tonesignalUserId = _usrid;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIMP Simuladores Online',
      theme: ThemeData.light(),
      home: Scaffold(
        body: 
        Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('imagens/bg.png'), fit: BoxFit.cover,)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Column(
                        verticalDirection: VerticalDirection.up,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 70, right: 10, left: 10),
                            child: Container(
                              height: 500,
                              decoration: BoxDecoration(image: DecorationImage(image: AssetImage('imagens/bg-f.png'), fit: BoxFit.fitWidth,)),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 110),
                                child:
                                _body(context),
                              )
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }



  _body(BuildContext context) {
  return Form(
    key: _formKey,
    child: Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 40, left: 25, right: 25),
      child: ListView(
        children: <Widget>[
          textFormFieldLogin(),
          textFormFieldSenha(),
          containerButton(context),
          Row(
            verticalDirection: VerticalDirection.up,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Privacidade()));}, child: Text('Privacidade', style: TextStyle(color: Colors.grey[600]),)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Esqueci()));}, child: Text('? Lembrar Senha', style: TextStyle(color: Colors.grey[600]),)),
                ],
              ),
            ],
          )
        ],
      ),
    )
  );
}

textFormFieldLogin() {
  return Padding(
    padding: const EdgeInsets.only(top: 55),
    child: TextFormField(
      controller: _tLogin,
             validator: _validateLogin,
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.grey[600]),
      decoration: InputDecoration( 
        labelText: "Login",
        labelStyle: TextStyle(color: Colors.grey[600]),
        hintText: "Informe o login"
      )
    ),
  );
}

textFormFieldSenha() {
  return TextFormField( 
    controller: _tSenha,
            validator: _validateSenha,
    obscureText: true,
    keyboardType: TextInputType.text,
    style: TextStyle(color: Colors.grey[600]),
    decoration: InputDecoration( 
      labelText: "Senha",
      labelStyle: TextStyle(color: Colors.grey[600]),
      hintText: "Informe a senha"
    )
  );
}

containerButton(BuildContext context) {
  return Container(
    height: 35.0,
    width: 90.0,
    margin: EdgeInsets.only(top: 10.0, right: 55, left: 55),
    child: 
    RoundedLoadingButton(
      borderRadius: 5,
      color: Color.fromRGBO(42, 69, 124, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Acessar  ", style: TextStyle(color: Colors.white, fontSize: 17.0)),
          Icon(Icons.arrow_forward, color: Colors.white,)
        ],
      ),
      controller: _btnController,
      onPressed: () { _onClickLogin(context); _doSomething(); },
      width: 200,
    ),
  );
}

  _onClickLogin(BuildContext context) async {
    final login = _tLogin.text;
    final senha = _tSenha.text;
    final onesignalUserId = _tonesignalUserId;
    print("Login: $login , Senha: $senha , os: $onesignalUserId" );  
     
     var usuario = await LoginApi.login(login,senha,toString());

    if( usuario != null ){
     _navegaHomeSimp(context);
     }
     else{
       alert(context, "Login Invalido");
     }
  }

  _navegaHomeSimp(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeSimp3()),);
  }

String _validateLogin(String text){
    if(text.isEmpty){
      return alert(context, "Informe o login");
    }
    return null;
}

String _validateSenha(String text){
    if(text.isEmpty){
      return "Informe a senha";
    }
    return null;
  } 
}
