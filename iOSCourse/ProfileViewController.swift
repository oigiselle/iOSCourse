//
//  ProfileViewController.swift
//  iOSCourse
//
//  Created by Giselle Salvador on 2022-08-18.
//

import UIKit

class ProfileViewController: UIViewController, UITextFieldDelegate {


    
    static var identifier = String(describing: ProfileViewController.self)
    
    
    @IBOutlet var fnameTextField: UITextField!
    @IBOutlet weak var lnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
 
    
    @IBOutlet weak var helloLabel: UILabel!
    

    let userDefaults = UserDefaults()
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fnameTextField.delegate = self
        
        
        
       
        if let fNamevalue = userDefaults.value(forKey: "fname") as? String {
            helloLabel.text = "Hello, " + fNamevalue + "!"
            fnameTextField.text = fNamevalue
        }
        

        
        
        if let lNamevalue = userDefaults.value(forKey: "lname") as? String {
           
            lnameTextField.text = lNamevalue
        }
        
        if let emailvalue = userDefaults.value(forKey: "email") as? String {
           
            emailTextField.text = emailvalue
        }
        
        if let phoneValue = userDefaults.value(forKey: "phone") as? String {
           
            phoneTextField.text = phoneValue
        }

       
         
     }
    
    @IBAction func savebtn(_ sender: Any) {
 
            userDefaults.setValue(fnameTextField.text, forKey: "fname")
            userDefaults.setValue(lnameTextField.text, forKey: "lname")
            userDefaults.setValue(emailTextField.text, forKey: "email")
            userDefaults.setValue(phoneTextField.text, forKey: "phone")

        

        
            if let value = userDefaults.value(forKey: "fname") as? String {
                helloLabel.text = "Hello, " + value + "!"
            }
        
       
                           
            
 
    }
    
    
   
}
