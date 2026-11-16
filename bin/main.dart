import 'package:internet_speed_test/speed_test.dart';

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    print('Usage: dart run bin/main.dart <URL>');
    return;
  }

  try {
    final url = Uri.parse(args.first);

    if (url.scheme != 'http' && url.scheme != 'https') {
      throw FormatException('Only HTTP and HTTPS URLs are supported');
    }

    final result = await measureDownloadSpeed(url);

    printFinalResult(result);
  } catch (error) {
    print('Error: $error');
  }
}
