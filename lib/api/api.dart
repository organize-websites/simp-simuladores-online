import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simp/api/usuario.dart';
import 'package:simp/api/home_block.dart';

class LoginApi{

  var bloc = BlocHome();

  void initState(){
    bloc.initOneSignal();
  }

  

  static Future<Usuario> login(String login, String senha, String onesignalUserId) async {


    var status = await OneSignal.shared.getPermissionSubscriptionState();

if (status.permissionStatus.hasPrompted)
  // we know that the user was prompted for push permission
  
if (status.permissionStatus.status == OSNotificationPermission.notDetermined)
  // boolean telling you if the user enabled notifications

if (status.subscriptionStatus.subscribed)
String token = status.subscriptionStatus.pushToken;

String emailPlayerId = status.emailSubscriptionStatus.emailUserId;
String emailAddress = status.emailSubscriptionStatus.emailAddress;



    var url = 'https://b2corapi.agencialink.com.br/login/';

    var header = {"Content-Type" : "application/json"};


    Map params = {
      "login" : login,
      "senha" : senha,
      "onesignal_id" : onesignalUserId,
    };

    var usuario;

    var prefs = await SharedPreferences.getInstance();

    if(onesignalUserId.isNotEmpty){
      prefs.setString("oneid", onesignalUserId);
    }

    var _body = json.encode(params);  
    print("json enviado : $_body");

    var response = await http.post(url, headers: header, body: _body);
    print('Response status: ${response.statusCode}');

    Map mapResponse = json.decode(response.body);

    if(response.statusCode == 200){
      usuario = Usuario.fromJson(mapResponse);
      prefs.setString("tokenjwt", mapResponse["token"]);
      prefs.setString("usr_tkn", mapResponse["user_token"]);
      prefs.setString("usr_pass", mapResponse["user_pass"]);
      prefs.setString("nome", mapResponse["name"]);
      prefs.setString("logo", mapResponse["logotipo_usuario"]);
      prefs.setString("email", mapResponse["email"]);
      prefs.setString("id", mapResponse["id"]);
      prefs.setString("login", mapResponse["login"]);
      }
      else{
        usuario = null;
      }
      return usuario;
    }

}