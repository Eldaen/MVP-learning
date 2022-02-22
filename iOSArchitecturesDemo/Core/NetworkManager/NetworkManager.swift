//
//  NetworkManager.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 19.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import Foundation
import Alamofire

final class NetworkManager {
    
    public typealias DataCompletion = (AFResult<Data>) -> Void
    public typealias JSONCompletion = (AFResult<[String: Any]?>) -> Void
    
    public func dataRequest(_ request: WebRequest, then completion: DataCompletion?) {
        AF.request(request.url, method: request.method, parameters: request.parameters).validate().responseData { [weak self] response in
			
			switch response.result {
			case .success(let data):
				completion?(.success(data))
			case .failure(let error):
				self?.logError(error, request: request)
				completion?(.failure(error))
			}
        }
    }
    
    public func jsonRequest(_ request: WebRequest, then completion: JSONCompletion?) {
        AF.request(request.url, method: request.method, parameters: request.parameters).validate().responseJSON { [weak self] response in
			switch response.result {
			case .success(let json):
				completion?(.success(json as? [String: Any]))
			case .failure(let error):
				self?.logError(error, request: request)
				completion?(.failure(error))
			}
        }
    }
    
    private func logError(_ error: Error, request: WebRequest) {
        print("Error while executing request \(request.url), error: \(error.localizedDescription)")
    }
}
