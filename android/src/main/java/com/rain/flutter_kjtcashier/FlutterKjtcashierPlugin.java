package com.rain.flutter_kjtcashier;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.widget.Toast;

import androidx.annotation.NonNull;
import com.kjtpay.sdk.aggregate.KjtOnAlipayCallback;
import com.kjtpay.sdk.aggregate.KjtPayManager;
import java.util.Map;
import io.flutter.Log;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import io.flutter.plugin.platform.PlatformViewRegistry;

/** FlutterKjtcashierPlugin */
public class FlutterKjtcashierPlugin implements FlutterPlugin, MethodChannel.MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private Context mContext;
  private Result mResult;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "flutter_kjtcashier");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onAttachedToActivity(@NonNull final ActivityPluginBinding binding) {
    this.mContext = binding.getActivity();
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {

  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {

  }

  @Override
  public void onDetachedFromActivity() {

  }
  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    Map<String, Object> request = (Map<String, Object>) call.arguments;
    mResult = result;

    if (call.method.equals("kjtcashier_ali_pay")) {
      String token = request.get("token").toString();
//      Log.i("token", token);
      /**
       * 打开支付宝
       *
       * @param context  上下文，非空
       * @param token    交易Token，非空（请求下来的内容）
       * @param callback 调用回调
       */
      KjtPayManager.getInstance().openAlipay(mContext, token, new KjtOnAlipayCallback() {
        @Override
        public void onError(String code, String msg) {
          // 仅仅代表调用成功
          mResult.success(msg);
          // Log.i("调用失败", msg);
          // 调用失败
          // KjtOnAlipayCallback.CODE_PARAM_ERROR 参数异常
          // KjtOnAlipayCallback.CODE_EXECUTE_ERROR 执行异常
        }

        @Override
        public void onSuccess() {
          // 仅仅代表调用成功
          mResult.success("1");
        }
      });

    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
