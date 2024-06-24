package net.chikach.genshinmaterial

import android.webkit.CookieManager

class HoyolabIntegrationApiImpl : HoyolabIntegrationApi {
    override fun fetchCookie(callback: (Result<String>) -> Unit) {
        CookieManager.getInstance().getCookie("https://m.hoyolab.com")?.let {
            callback(Result.success(it))
        } ?: callback(Result.failure(FlutterError("internal", "Failed to get cookie", null)))
    }
}