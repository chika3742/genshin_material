import java.util.Properties

plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    id("com.google.firebase.crashlytics")
    // END: FlutterFire Configuration
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

val localProperties = Properties()
val localPropertiesFile = rootProject.file("local.properties")
if (localPropertiesFile.exists()) {
    localPropertiesFile.reader(Charsets.UTF_8).use { reader ->
        localProperties.load(reader)
    }
}

var flutterVersionCode = localProperties.getProperty("flutter.versionCode")
if (flutterVersionCode == null) {
    flutterVersionCode = "1"
}

var flutterVersionName = localProperties.getProperty("flutter.versionName")
if (flutterVersionName == null) {
    flutterVersionName = "1.0"
}

android {
    namespace = "net.chikach.genshinmaterial"
    compileSdk = 36
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    sourceSets.getByName("main") {
        java.srcDirs("src/main/kotlin")
    }

    defaultConfig {
        applicationId = "net.chikach.genshinmaterial"
        minSdk = 21
        targetSdk = 36
        versionCode = flutterVersionCode.toInt()
        versionName = flutterVersionName
    }

    signingConfigs {
        create("release") {
            val keyProperties = Properties()
            val keyPropertiesFile = rootProject.file("key.properties")
            if (keyPropertiesFile.exists()) {
                keyPropertiesFile.reader(Charsets.UTF_8).use { reader ->
                    keyProperties.load(reader)
                }
                val keyStorePath: String? by keyProperties
                if (keyStorePath != null) {
                    storeFile = rootProject.file(keyStorePath!!)
                    storePassword = keyProperties.getProperty("keyStorePassword")
                    keyAlias = keyProperties.getProperty("keyAlias")
                    keyPassword = keyProperties.getProperty("keyPassword")
                }
            }
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs["release"]
        }
    }
}

flutter {
    source = "../.."
}

dependencies {}
