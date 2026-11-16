
import 'dart:io';
import 'dart:typed_data';

const int requestCount = 10;

class SpeedTestResult {
  final double averageRequestTime;
  final int totalDownloadedBytes;
  final double downloadSpeed;

  SpeedTestResult({
    required this.averageRequestTime,
    required this.totalDownloadedBytes,
    required this.downloadSpeed,
  });
}

Future<int> downloadFile(HttpClient client, Uri url) async {
  final request = await client.getUrl(url);
  final response = await request.close();

  if (response.statusCode < 200 || response.statusCode >= 300) {
    throw HttpException(
      'HTTP status: ${response.statusCode}',
      uri: url,
    );
  }

  final downloadedData = await response.fold<BytesBuilder>(
    BytesBuilder(),
    (builder, chunk) => builder..add(chunk),
  );

  return downloadedData.length;
}

Future<SpeedTestResult> measureDownloadSpeed(Uri url) async {
  final client = HttpClient();

  int totalDownloadedBytes = 0;
  double totalElapsedSeconds = 0;

  try {
    for (int requestNumber = 0;
        requestNumber < requestCount;
        requestNumber++) {
      final stopwatch = Stopwatch()..start();

      final downloadedBytes = await downloadFile(client, url);

      stopwatch.stop();

      final elapsedSeconds =
          stopwatch.elapsedMicroseconds / 1000000;

      totalDownloadedBytes += downloadedBytes;
      totalElapsedSeconds += elapsedSeconds;

      printRequestResult(
        requestNumber + 1,
        elapsedSeconds,
        downloadedBytes,
      );
    }
  } finally {
    client.close();
  }

  return SpeedTestResult(
    averageRequestTime: totalElapsedSeconds / requestCount,
    totalDownloadedBytes: totalDownloadedBytes,
    downloadSpeed:
        (totalDownloadedBytes / 1000000) / totalElapsedSeconds,
  );
}

void printRequestResult(
  int requestNumber,
  double elapsedSeconds,
  int downloadedBytes,
) {
  print(
    'Request $requestNumber/$requestCount: '
    '${elapsedSeconds.toStringAsFixed(3)} sec, '
    '$downloadedBytes bytes',
  );
}

void printFinalResult(SpeedTestResult result) {
  print('\n--- Results ---');

  print(
    'Average request time: '
    '${result.averageRequestTime.toStringAsFixed(3)} sec',
  );

  print(
    'Total downloaded: '
    '${(result.totalDownloadedBytes / 1000000).toStringAsFixed(3)} MB',
  );

  print(
    'Download speed: '
    '${result.downloadSpeed.toStringAsFixed(3)} MB/s',
  );
}
