//
//  CreateViewController.swift
//  iOSCourse
//
//  Created by Giselle Salvador on 2022-08-18.
//

import UIKit
import Firebase

class CreateViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confPasswordTextField: UITextField!
  
    
    func showPasswordAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func CreateUserBtn(_ sender: Any) {
              
        if let email = emailTextField.text{
            if let password = passwordTextField.text {
                if let confPassword = confPasswordTextField.text {
                    //password validation
                    if password == confPassword{
                        let autentication = Auth.auth()
            
                        autentication.createUser(withEmail: email, password: password, completion: {(user, error) in
                            if error == nil{
                                self.performSegue(withIdentifier: "createSegue", sender: nil)
                    
                            }else{
                                print("fail \(String(describing: error))"  )
                    
                            }
                            })
     
                    } else{
                        self.showPasswordAlert(title: "Incorret Password", message: "The provived password must be equal")
                    } //end of password validation
                }
            }
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    
        // Do any additional setup after loading the view.
    }
    
  
}
