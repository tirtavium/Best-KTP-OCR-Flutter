# Best KTP OCR Flutter

Indonesia ID Card (KTP) OCR for Android(mlkit) and iOS(vision), smallest size compare to other OCR.

## Platform Support

| Android |  iOS  | 
| :-----: | :---: | 
|   ✅   |   ✅   |   

## Flutter Requirements

- Flutter >=3.3.0
- Dart >=3.1.1 <4.0.0

## Android Requirements
minSdkVersion 28         
compileSdkVersion 34

Add jipack.io
<?code-excerpt "readme_excerpts.gradle (Example)"?>
```gradle
allprojects {
    repositories {
        google()
        maven { url 'https://jitpack.io' }
        mavenCentral()
    }
}
```

## iOS Requirements
minimum iOS >=13.0

## Example
<?code-excerpt "readme_excerpts.dart (Example)"?>
```dart
import 'package:image_picker/image_picker.dart';
import 'package:best_ktp_ocr_flutter/bestktpocrflutter.dart';

 validateKTP() async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
 
    Uint8List? fileData = await file?.readAsBytes();
    if ( fileData != null ) {
    var _ktpJson = await Bestktpocrflutter().scanKTP(fileData!);
      print(_ktpJson);
    }
 }
```

This project is a starting point for a Flutter
[plug-in package](https://pub.dev/packages/best_ktp_ocr_flutter),
a specialized package that includes platform-specific implementation code for
Android and iOS.

