# Best KTP OCR Flutter

Indonesia ID Card (KTP) OCR for Android(mlkit) and iOS(vision), smallest size compare to other OCR.

## Platform Support

| Android |  iOS  | 
| :-----: | :---: | 
|   ✅   |   ✅   |   


## Requirements

- Flutter >=3.3.0
- Dart >=3.1.1 <4.0.0
- iOS >=13.0
- Android `compileSDK` 28
- Java 17

## Example
<?code-excerpt "readme_excerpts.dart (Example)"?>
```dart
 Uint8List file = await pickImage(ImageSource.gallery);
_ktpJson =
await Bestktpocrflutter().scanKTP(file);
```

This project is a starting point for a Flutter
[plug-in package](https://pub.dev/packages/best_ktp_ocr_flutter),
a specialized package that includes platform-specific implementation code for
Android and iOS.

