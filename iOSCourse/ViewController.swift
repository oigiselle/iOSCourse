//
//  ViewController.swift
//  iOSCourse
//
//  Created by Giselle Salvador on 2022-08-18.
//

import UIKit


class ViewController: UIViewController {
 
    @IBOutlet weak var helloLabel: UILabel!
    let userDefaults = UserDefaults()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let fNamevalue = userDefaults.value(forKey: "fname") as? String {
            helloLabel.text = "Hello, " + fNamevalue + "!"
        }
        

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let fNamevalue = userDefaults.value(forKey: "fname") as? String {
            helloLabel.text = "Hello, " + fNamevalue + "!"
        }
        
    }
}

