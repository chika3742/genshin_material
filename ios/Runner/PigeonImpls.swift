//
//  PigeonImpls.swift
//  Runner
//
//  Created by 近松 和矢 on 2024/06/08.
//

import Foundation
import WebKit

class HoyolabIntegrationApiImplementation : HoyolabIntegrationApi {
  func fetchCookie(completion: @escaping (Result<String, any Error>) -> Void) {
    let dataStore = WKWebsiteDataStore.default()
    dataStore.httpCookieStore.getAllCookies() { cookies in
      var cookieString = ""
      
      cookies.forEach { cookie in
        if (cookie.domain == ".hoyolab.com") {
          cookieString += "\(cookie.name)=\(cookie.value); "
        }
      }
      
      if !cookieString.isEmpty {
        completion(Result.success(cookieString))
      } else {
        completion(Result.failure(PigeonError(code: "internal", message: "Failed to get cookie", details: nil)))
      }
    }
  }
}
