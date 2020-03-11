package br.jpe.fluttcher

import io.flutter.app.FlutterApplication
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugins.firebasemessaging.FlutterFirebaseMessagingService
import io.flutter.plugins.androidalarmmanager.AlarmService

public class Application: FlutterApplication(), PluginRegistrantCallback {

  override fun onCreate() {
    super.onCreate();
    AlarmService.setPluginRegistrant(this);
    FlutterFirebaseMessagingService.setPluginRegistrant(this);
  }

  override fun registerWith(registry: PluginRegistry) {
    GeneratedPluginRegistrant.registerWith(registry);
  }
}