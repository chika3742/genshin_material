package net.chikach.genshinmaterial

import android.webkit.CookieManager

class HoyolabIntegrationApiImpl : HoyolabIntegrationApi {
    companion object {
        private const val URL = "https://www.hoyolab.com"
    }

    override suspend fun fetchCookie(): String {
        return CookieManager.getInstance().getCookie(URL)
            ?: throw FlutterError("internal", "Failed to get cookie")
    }

    override suspend fun setCookies(cookies: List<CookieEntry>) {
        val cookieManager = CookieManager.getInstance()
        cookies.forEach { entry ->
            var setCookieHeader = "${entry.key}=${entry.value}; Domain=${entry.domain}"
            if (entry.secure) {
                setCookieHeader += "; Secure"
            }
            if (entry.httpOnly) {
                setCookieHeader += "; HttpOnly"
            }
            cookieManager.setCookie(URL, setCookieHeader)
        }
    }
}
