//
//  UIAlertControllerExtension.swift
//  iOS API Awakens App
//
//  Created by user on 12/5/18.
//  Copyright © 2018 Treehouse Island. All rights reserved.
//

import Foundation
import UIKit

//Presenting a UIAlertController outside a View Controller solution help from GitHub
extension UIAlertController {
    func presentInWindow(animated: Bool, completion: (() -> Void)?) {
        guard let rootVC = UIApplication.shared.keyWindow?.rootViewController else { return }
        rootVC.present(self, animated: animated, completion: completion)
        
    }
    
}
