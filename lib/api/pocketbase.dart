import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences prefs;

late final PocketBase pb;

Future<void> initPocketbase() async {
  prefs = await SharedPreferences.getInstance();
  final store = AsyncAuthStore(
    save: (String data) async => prefs.setString('pb_auth', data),
    initial: prefs.getString('pb_auth'),
  );
  pb = PocketBase('http://10.0.2.2:8900/', authStore: store);
}
