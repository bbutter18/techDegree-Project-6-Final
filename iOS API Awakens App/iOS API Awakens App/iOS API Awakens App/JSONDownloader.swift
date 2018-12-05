//
//  JSONDownloader.swift
//  iOS API Awakens App
//
//  Created by Woodchuck on 10/17/18.
//  Copyright © 2018 Treehouse Island. All rights reserved.
//

import Foundation
import UIKit

class JSONDownloader {

    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }

    typealias JSON = [String: AnyObject]
    typealias JSONTaskCompletionHandler = (JSON?, SWAPError?) -> Void
    
    func jsonTask(with request: URLRequest, completionHandler completion: @escaping JSONTaskCompletionHandler) -> URLSessionDataTask {
        
        let task = session.dataTask(with: request) { data, response, error in
            
            //Display Alerts for No Internet Connection
            if let urlError = error as? URLError {
                switch urlError.code {
                case .notConnectedToInternet:
                    let alert = UIAlertController(title: "Error", message: "No Internet Connection Available", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    alert.presentInWindow(animated: true, completion: nil)
                case .networkConnectionLost:
                    let alert = UIAlertController(title: "Error", message: "Internet Connection Lost", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    alert.presentInWindow(animated: true, completion: nil)
                default: break
                }
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed)
                return
            }
            
            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject]
                        completion(json, nil)
                    } catch {
                        completion(nil, .jsonConversionFailure)
                    }
                } else {
                    completion(nil, .invalidData)
                }
            } else {
                completion(nil, .responseUnsuccessful)
            }
            
        }
        
        return task
    
    }



}









