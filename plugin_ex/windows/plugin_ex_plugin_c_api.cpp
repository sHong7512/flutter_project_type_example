#include "include/plugin_ex/plugin_ex_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "plugin_ex_plugin.h"

void PluginExPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  plugin_ex::PluginExPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
