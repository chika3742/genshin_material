//
//  PigeonImpls.swift
//  Runner
//
//  Created by 近松 和矢 on 2024/06/08.
//

import Foundation
import WebKit

class HoyolabIntegrationApiImplementation : HoyolabIntegrationApi {
    func fetchCookie() async throws -> String {
        let store = await WKWebsiteDataStore.default().httpCookieStore
        let cookies = await store.allCookies()
        
        var cookieString = ""
        cookies.forEach { cookie in
            if (cookie.domain == ".hoyolab.com") {
                cookieString += "\(cookie.name)=\(cookie.value); "
            }
        }
        
        if cookieString.isEmpty {
            throw PigeonError(code: "internal", message: "Failed to get cookie", details: nil)
        }
        
        return cookieString
    }
    
    func setCookies(cookies: [CookieEntry]) async throws {
        let store = await WKWebsiteDataStore.default().httpCookieStore
        
        let httpCookies = cookies.map { entry in
            var setCookieHeader = "\(entry.key)=\(entry.value); Domain=\(entry.domain)"
            if entry.secure {
                setCookieHeader += "; Secure"
            }
            if entry.httpOnly {
                setCookieHeader += "; HttpOnly"
            }
            return HTTPCookie.cookies(
                withResponseHeaderFields: ["Set-Cookie": setCookieHeader],
                for: URL(string: "https://www.hoyolab.com")!,
            )[0]
        }
        
        if #available(iOS 26.0, *) {
            await store.setCookies(httpCookies)
        } else {
            for cookie in httpCookies {
                await store.setCookie(cookie)
            }
        }
    }
}
