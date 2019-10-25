import 'dart:convert';
import 'dart:io';
import 'command.dart';

//import 'package:http/http.dart' as http;

Future main(List<String> arguments) async {
  var logDebug = false;
  if (arguments.isNotEmpty) {
    logDebug = arguments[0] == '-d' || arguments[0] == '--debug';
  }

  // Copy the white svg to a green svg
  final logo = File('assets/icon.svg');

  final logoString = await logo.readAsString();

  // Create PNGs from SVGs
  /*
  print('Get pngs..');
  final logogPng = await post('https://fingeg.de/converter/png?width=1024&height=1024', {'img': logoString});
  print('... successfully');
  await File('assets/icon.png').writeAsBytes(logogPng);
  */

  // Create app icons
  await runCommand(
    'flutter pub get',
    log: logDebug,
  );
  await runCommand(
    'flutter pub run flutter_launcher_icons:main -f icon.yaml',
    log: logDebug,
  );

  await File('assets/icon.png').copy('android/app/src/main/res/drawable/icon.png');
  
}

Future<List<int>> post(String url, Map<String, dynamic> body) async {

  final httpClient = HttpClient();

  // Send request
  final request = await httpClient.postUrl(Uri.parse(url));
  request.headers.set('content-type', 'application/json');
  request.add(utf8.encode(json.encode(body)));
  final response = await request.close();

  // Get answere
  final _downloadData = List<int>();
  final stream = response.listen(_downloadData.addAll);
  await stream.asFuture();
  await stream.cancel();

  httpClient.close();
  return _downloadData;
}
