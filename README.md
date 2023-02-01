<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->
# Date Time Ago

This project is for calculating "Date Time".

## Features

Supported languages; English and Turkis for now.

## Getting started

```dart
// import package to page
import 'package:date_time_ago/date_time_ago';
```

## Usage

Include short and useful examples for package users. Add longer examples
to "`/example`" folder.

```dart
// create once object
final dateTimeAgo = DateTimeAgo();

final dateTime = DateTime.now().subtract(const Duration(days: 1));

// default Turkish
print(dateTimeAgo.toCalculate(dateTime));

// usage English
print(dateTimeAgo.toCalculate(
     dateTime,
     locale: DateTimeAgoLocalesEnums.english,
   ));
```
<!-- 
## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more. -->
