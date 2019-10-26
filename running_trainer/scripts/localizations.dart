import 'dart:io';

Future main(List<String> arguments) async {
  const path = 'lib/Utils/localizations.dart';
  String file = await File(path).readAsString();
  List<String> raw = file.split('},')[0].trim().split('\n').sublist(15);
  final Map<String, String> elements = {};
  for (int i = 0; i < raw.length; i++) {
    final String key = raw[i].split('\': \'')[0].substring(1).replaceAll('\'', '').trim();
    final String value = raw[i].split('\': \'')[1].substring(0, raw[i].split('\': \'')[1].length - 2).replaceAll('\'', '').trim();
    elements[key] = value;
  }

  final String firstPart = file.split('// All getters')[0].trim();
  String middlePart = '\n  // All getters\n';
  elements.forEach((key, value) {
    middlePart += '  // ignore: public_member_api_docs\n  String get $key {\n    return _localizedValues[locale.languageCode][\'$key\'];\n  }\n\n';
  });
    
  final String lastPart = '  // end all getters\n${file.split('// end all getters')[1].trim()}';

  final String newFile = '$firstPart${middlePart.substring(0, middlePart.length - 1)}$lastPart';
  await File(path).writeAsString(newFile);
}