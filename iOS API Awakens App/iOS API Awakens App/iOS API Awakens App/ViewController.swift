//
//  ViewController.swift
//  iOS API Awakens App
//
//  Created by Woodchuck on 10/11/18.
//  Copyright © 2018 Treehouse Island. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    @IBAction func CharacterButtonSelection(_ sender: Any) {
            print("Performing Character Segue")
        
    }
    

    @IBAction func StarshipButtonSelection(_ sender: Any) {
        print("Performing Starship Segue")
    }
    
    
    @IBAction func VehicleButtonSelection(_ sender: Any) {
        print("Performing Vehicle Segue")
    }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
}







