
# Internet Speed Test

A simple console application written in Dart that measures download speed.

## Features

- Sends 10 sequential HTTP GET requests.
- Waits for each response to download completely.
- Measures the average request time.
- Calculates total downloaded data.
- Calculates average download speed.

## Requirements

- Dart SDK 3.0 or higher.

## Installation

Clone the repository:

```bash
git clone https://github.com/SargisKhachikyan/internet_speed_test.git
cd internet_speed_test
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

Download speed is calculated by dividing the total downloaded data by the total time of all requests.
