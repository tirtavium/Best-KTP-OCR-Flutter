import Flutter
import UIKit
import OCRforEKTP
public class BestktpocrflutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "bestktpocrflutter", binaryMessenger: registrar.messenger())
    let instance = BestktpocrflutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "scanKTP":
        if let args = call.arguments as? Dictionary<String, Any> {
            if let imageData = args["ktp"] as? Data, let image = UIImage(data: imageData) {
                let ocrLibrary = OCRforEKTPLibrary()
                let ocrResult = ocrLibrary.scanEKTP(image)
                let ktpData: [String: String] = [
                    "nik":  ocrResult.result.nik,
                    "nama": ocrResult.result.nama,
                    "tempatLahir": ocrResult.result.tempatLahir,
                    "tanggalLahir": ocrResult.result.tanggalLahir,
                    "jenisKelamin": ocrResult.result.jenisKelamin,
                    "alamat": ocrResult.result.alamat,
                    "rtrw": ocrResult.result.rtrw,
                    "kelurahan": ocrResult.result.kelurahan,
                    "kecamatan": ocrResult.result.kecamatan,
                    "agama": ocrResult.result.agama,
                    "statusPerkawinan": ocrResult.result.statusPerkawinan,
                    "pekerjaan": ocrResult.result.pekerjaan,
                    "kewarganegaraan": ocrResult.result.kewarganegaraan,
                    "provinsi": ocrResult.result.provinsi,
                    "kota": ocrResult.result.kota
                ]
                let ktpJsonData = try! JSONSerialization.data(withJSONObject: ktpData, options: [])
                let ktpJsonString = String(data: ktpJsonData, encoding: .utf8)!
                result(ktpJsonString)
            }else{
                result("ktp must data format")
            }
        }else{
            result("no ktp found")
        }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
