# Internet Speed Test

A simple console application written in Dart that measures download speed.

## Features

- Sends 10 sequential HTTP GET requests.
- Waits for each response to download completely.
- Measures the average request time.
- Calculates total downloaded data.
- Calculates average download speed.
- Supports HTTP and HTTPS URLs.

## Requirements

- Dart SDK 3.0 or higher.

## Installation

Clone the repository:

```bash
git clone https://github.com/SargisKhachikyan/internet_speed_test_project.git
cd internet_speed_test_project
```

Install dependencies:

```bash
dart pub get
```

## Usage

Run the application:

```bash
dart run bin/main.dart https://example.com
```

Replace the URL with the address of the file you want to download.

## Measurements

- Average request time: seconds (sec).
- Downloaded data: megabytes (MB).
- Download speed: megabytes per second (MB/s).

Megabytes are calculated using the decimal system (1 MB = 1,000,000 bytes).

Download speed is calculated by dividing the total downloaded data by the total time of all 10 requests.

## Error Handling

The application handles invalid URLs, unsupported protocols, HTTP errors, and request timeouts.