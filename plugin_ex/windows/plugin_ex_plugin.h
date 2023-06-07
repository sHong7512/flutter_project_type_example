#ifndef FLUTTER_PLUGIN_PLUGIN_EX_PLUGIN_H_
#define FLUTTER_PLUGIN_PLUGIN_EX_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace plugin_ex {

class PluginExPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  PluginExPlugin();

  virtual ~PluginExPlugin();

  // Disallow copy and assign.
  PluginExPlugin(const PluginExPlugin&) = delete;
  PluginExPlugin& operator=(const PluginExPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace plugin_ex

#endif  // FLUTTER_PLUGIN_PLUGIN_EX_PLUGIN_H_
