package com.example.plugin_ex

import android.util.Log
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class PluginExPlugin : FlutterPlugin{
    lateinit var plusMinusChannel: MethodChannel;
    lateinit var mulSubChannel: MethodChannel;

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        makePlusMinus(flutterPluginBinding)
        makeMulSub(flutterPluginBinding)
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        plusMinusChannel.setMethodCallHandler(null)
        mulSubChannel.setMethodCallHandler(null)
    }

    fun makePlusMinus(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding){
        plusMinusChannel = MethodChannel(flutterPluginBinding.binaryMessenger, "plugin_plus_minus")
        plusMinusChannel.setMethodCallHandler(object: MethodCallHandler{
            override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
                when (call.method) {
                    "plus" -> {
                        val args = call.arguments as Map<*, *>
                        if (args["x"] is Number && args["y"] is Number) {
                            result.success((args["x"] as Number).toDouble() + (args["y"] as Number).toDouble())
                        } else {
                            result.error("0000", "Args Error!", null)
                        }
                    }
                    "minus" -> {
                        val args = call.arguments as Map<*, *>
                        if (args["x"] is Number && args["y"] is Number) {
                            result.success((args["x"] as Number).toDouble() - (args["y"] as Number).toDouble())
                        } else {
                            result.error("0000", "Args Error!", null)
                        }
                    }
                    else -> result.notImplemented()
                }
            }
        })
    }

    fun makeMulSub(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding){
        mulSubChannel = MethodChannel(flutterPluginBinding.binaryMessenger, "plugin_mul_sub")
        mulSubChannel.setMethodCallHandler(object: MethodCallHandler{
            override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
                when (call.method) {
                    "mul" -> {
                        val args = call.arguments as Map<*, *>
                        if (args["x"] is Number && args["y"] is Number) {
                            result.success((args["x"] as Number).toDouble() * (args["y"] as Number).toDouble())
                        } else {
                            result.error("0000", "Args Error!", null)
                        }
                    }
                    "sub" -> {
                        val args = call.arguments as Map<*, *>
                        if (args["x"] is Number && args["y"] is Number) {
                            result.success((args["x"] as Number).toDouble() / (args["y"] as Number).toDouble())
                        } else {
                            result.error("0000", "Args Error!", null)
                        }
                    }
                    else -> result.notImplemented()
                }
            }
        })
    }
}
