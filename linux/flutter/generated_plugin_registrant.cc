//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <plugin_ex/plugin_ex_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) plugin_ex_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "PluginExPlugin");
  plugin_ex_plugin_register_with_registrar(plugin_ex_registrar);
}
