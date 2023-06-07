# project_type_example

Project Type Import Example

## make IDE

```
file -> new -> new flutter priject -> next -> Project Location & Project Type designation -> create
```

## Package

- make Terminal

```
$ flutter create --template=package package_ex
```

## Plugin

- make Terminal

```
$ flutter create --org com.example --template=plugin --platforms=android,ios,linux,macos,windows -a kotlin -i swift plugin_ex
 
--platforms:  어떤 platform을 support하는 plugin을 만들것 인지 나열해줍니다. 콤마로 separator를 사용할 수 있으며 android, ios, web, linux, macos, winodws가 있습니다.

--org: 어떤 organization인지 reverse domain name을 이용하여 정합니다.

-a: Android에서 어떤 언어를 사용할 것인지 정합니다. kotlin과 java을 사용할 수 있습니다.

-i: iOS에서 어떤 언어를 사용할 것인지 정합니다. swift와 objc를 사용할 수 있습니다.
```

## Module

안드로이드 프로젝트 내부에 플러터 프로젝트(모듈)을 만들어야 한다.

- make Terminal

```
$ flutter create -t module --org com.example my_flutter
```

- Build AAR (For Android)

```
// 모듈 위치에서
$ flutter build aar
```

#### + Consuming the Module at Android

1. Open <host>/app/build.gradle
2. Ensure you have the repositories configured, otherwise add them:
```
   String storageUrl = System.env.FLUTTER_STORAGE_BASE_URL ?: "https://storage.googleapis.com"
   repositories {
    maven {
        url '/Users/shong/FlutterProject/project_type_example/FlutterModuleAndroidEx/module_ex/build/host/outputs/repo'
    }
    maven {
        url "$storageUrl/download.flutter.io"
    }
   }
```

3. Make the host app depend on the Flutter module:

```
    dependencies {
      debugImplementation 'com.example.module_ex:flutter:1.0:debug'
      profileImplementation 'com.example.module_ex:flutter:1.0:profile'
      releaseImplementation 'com.example.module_ex:flutter:1.0:release'
      
      // 위에 3개 에러 발생시 아래로 임포트
      debugImplementation 'com.example.module_ex:flutter_debug:1.0'
      profileImplementation 'com.example.module_ex:flutter_profile:1.0'
      releaseImplementation 'com.example.module_ex:flutter_release:1.0'
    }
```

4. Add the `profile` build type:

```
    android {
      buildTypes {
        profile {
          initWith debug
        }
      }
    }
```

5. Add manifest If you use FlutterActivity

```
<manifest ...>
    <application
    ...
        <activity
            android:name="io.flutter.embedding.android.FlutterActivity"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize"/>
    </application>
</manifest>
```

#### + Consuming the Module at Android

아직 보류중 (참조 : https://danawalab.github.io/flutter/2022/10/24/Flutter-Module.html)

## FFI

- make Terminal

```
$ flutter create --template=plugin_ffi \ --platforms=android,ios,linux,macos,windows ffigen_app
```

#### reference

https://codelabs.developers.google.com/codelabs/flutter-ffigen#0

1. install DukTape (https://duktape.org/download.html)

2. unzip .tar.xz

```
$ tar xvf duktape-2.7.0.tar.xz 
```

3. install llvm (https://pub.dev/packages/ffigen#installing-llvm)

```
$ brew install llvm
```

4. Configuring ffigen

first, modify the contents of your project's ffigen.yaml file and run ffigen

```
$ flutter pub run ffigen --config ffigen.yaml 
```

5. Configuring CMake

6. make library .dart file

7. make consume file (example/lib/main.dart)

8. ... (For more examples, see "https://codelabs.developers.google.com/codelabs/flutter-ffigen#0")



## Skeleton

좀 더 복잡한 구조의 예제를 가진 일반 어플리캐이션

## etc..

- export files

각각 파일 임포트 하지않고 하나만 임포트 사용하기 위해서, 메인이 되는 dart 파일에 추가시켜주면 됨

```

export 'package:package_ex/calculator.dart';

```