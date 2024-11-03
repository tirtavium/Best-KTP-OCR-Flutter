package id.co.tirtavium.bestktpocrflutter

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import OCRforEKTPLibrary
import android.graphics.Bitmap
import org.json.JSONObject

/** BestktpocrflutterPlugin */
class BestktpocrflutterPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "bestktpocrflutter")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if (call.method == "scanKTP"){
      val image: Bitmap? = call.argument("ktp")
      val scanner = OCRforEKTPLibrary()
      val ktp = image?.let {
        val ktpData = scanner.scanEKTP(image)
        val ktpJson = JSONObject("""
          {
          "nik":${ktpData.nik}, 
          "nama":${ktpData.nama},
          "tempatLahir":${ktpData.tempatLahir},
          "tanggalLahir:${ktpData.tglLahir},
          "jenisKelamin":${ktpData.jenisKelamin}, 
          "alamat":${ktpData.alamat},
          "rtrw":${ktpData.rtrw},
          "kelurahan:${ktpData.kelurahan},
          "kecamatan":${ktpData.kecamatan},
          "agama":${ktpData.agama},
          "statusPerkawinan:${ktpData.statusPerkawinan},
          "pekerjaan":${ktpData.pekerjaan},
          "kewarganegaraan":${ktpData.kewarganegaraan},
          "provinsi:${ktpData.provinsi},
          "kota:${ktpData.kabKot}
          }
          """.trimIndent())
        result.success(ktpJson)
      }
        result.error("404", "no ktp found","")
    }
    else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
