package com.shong.fluttermoduleandroidex

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodChannel


// FlutterEngineCache 에 등록할 FlutterEngine 고유 id
private const val FLUTTER_ENGINE_NAME1 = "custom1"
private const val FLUTTER_ROUTE1 = "/custom1"
private const val FLUTTER_ENGINE_NAME2 = "custom2"
private const val FLUTTER_ROUTE2 = "/custom2"
private const val FLUTTER_ENGINE_NAME3 = "custom3"
private const val FLUTTER_ROUTE3 = "/custom3"

// 메소드 채널 이름(모듈과 같아야 함)
private const val channelName = "moduleEx"

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val channel1 = setEngineAndGetChannel(FLUTTER_ROUTE1, FLUTTER_ENGINE_NAME1)
        val channel2 = setEngineAndGetChannel(FLUTTER_ROUTE2, FLUTTER_ENGINE_NAME2)
        val channel3 = setEngineAndGetChannel(FLUTTER_ROUTE3, FLUTTER_ENGINE_NAME3)

        setContentView(R.layout.activity_main)

        findViewById<Button>(R.id.btn_1).setOnClickListener {
            channel1.invokeMethod("ButtonOrder", "I'm First Button Android")
            startFlutterAct(FLUTTER_ENGINE_NAME1)
        }

        findViewById<Button>(R.id.btn_2).setOnClickListener {
            channel2.invokeMethod("ButtonOrder", "I'm Second Button Android")
            startFlutterAct(FLUTTER_ENGINE_NAME2)
        }

        findViewById<Button>(R.id.btn_3).setOnClickListener {
            channel3.invokeMethod("ButtonOrder", "I'm Third Button Android")
            startFlutterAct(FLUTTER_ENGINE_NAME3)
        }
    }

    private fun setEngineAndGetChannel(routeName: String, engineName: String): MethodChannel {
        val engine = FlutterEngine(this).apply {
            // FlutterEngine 변수들 경로 설정
            navigationChannel.setInitialRoute(routeName)
            // FlutterEngine을 등록하기 위해 Dart 코드 실행
            dartExecutor.executeDartEntrypoint(DartExecutor.DartEntrypoint.createDefault())
        }
        // FlutterEngine 캐시에 등록
        FlutterEngineCache.getInstance().put(engineName, engine)
        // 채널 반환
        return MethodChannel(engine.dartExecutor.binaryMessenger, channelName)
    }

    private fun startFlutterAct(engineName: String){
        val intent = FlutterActivity.withCachedEngine(engineName).build(this)
        startActivity(intent)

        overridePendingTransition(
            androidx.appcompat.R.anim.abc_fade_in,
            androidx.appcompat.R.anim.abc_fade_out
        )
    }
}