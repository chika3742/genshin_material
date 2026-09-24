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
}
