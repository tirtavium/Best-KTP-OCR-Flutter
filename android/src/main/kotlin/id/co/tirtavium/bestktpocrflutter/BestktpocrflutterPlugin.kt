package id.co.tirtavium.bestktpocrflutter

import OCRforEKTPLibrary
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.os.AsyncTask
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import org.json.JSONObject
import java.util.concurrent.Executors


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
      Executors.newSingleThreadExecutor().execute(Runnable {
        // todo: do your background tasks
      val bytes =  call.argument<ByteArray>("ktp");
      val image: Bitmap? = bytes?.let { BitmapFactory.decodeByteArray( bytes, 0, it.size) };
      //val image: Bitmap? = call.argument("ktp")
      val scanner = OCRforEKTPLibrary()
      val ktp = image?.let {
        val ktpData = scanner.scanEKTP(image)
        val ktpJson = JSONObject("""
          {
          "nik":"${ktpData.nik}", 
          "nama":"${ktpData.nama}",
          "tempatLahir":"${ktpData.tempatLahir}",
          "tanggalLahir":"${ktpData.tglLahir}",
          "jenisKelamin":"${ktpData.jenisKelamin}", 
          "alamat":"${ktpData.alamat}",
          "rtrw":"${ktpData.rtrw}",
          "kelurahan":"${ktpData.kelurahan}",
          "kecamatan":"${ktpData.kecamatan}",
          "agama":"${ktpData.agama}",
          "statusPerkawinan":"${ktpData.statusPerkawinan}",
          "pekerjaan":"${ktpData.pekerjaan}",
          "kewarganegaraan":"${ktpData.kewarganegaraan}",
          "provinsi":"${ktpData.provinsi}",
          "kota":"${ktpData.kabKot}"
          }
          """.trimIndent())
          result.success(ktpJson.toString())
      }

      })
    }
    else {
      result.notImplemented()
    }

  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
