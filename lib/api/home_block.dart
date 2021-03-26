import 'package:onesignal_flutter/onesignal_flutter.dart';

class BlocHome{

  Future<void> initOneSignal() async {
    OneSignal.shared.init("f23a7bb4-e910-4230-8b8c-530d50587cb7");
    OneSignal.shared.setSubscriptionObserver((OSSubscriptionStateChanges changes) async {
      print("SUBSCRIPTION STATE CHANGED: ${changes.jsonRepresentation()}");
    });
    var status = await OneSignal.shared.getPermissionSubscriptionState();

if (status.permissionStatus.hasPrompted)
  // we know that the user was prompted for push permission
  
if (status.permissionStatus.status == OSNotificationPermission.notDetermined)
  // boolean telling you if the user enabled notifications

if (status.subscriptionStatus.subscribed)
  // boolean telling you if the user is subscribed with OneSignal's backend

// the user's ID with OneSignal
String onesignalUserId = status.subscriptionStatus.userId;

// the user's APNS or FCM/GCM push token
String token = status.subscriptionStatus.pushToken;

String emailPlayerId = status.emailSubscriptionStatus.emailUserId;
String emailAddress = status.emailSubscriptionStatus.emailAddress;
  }


}