package net.chikach.genshinmaterial

import android.webkit.CookieManager

class HoyolabIntegrationApiImpl : HoyolabIntegrationApi {
    override suspend fun fetchCookie(): String {
        return CookieManager.getInstance().getCookie("https://m.hoyolab.com")
            ?: throw FlutterError("internal", "Failed to get cookie")
    }
}