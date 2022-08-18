//
//  LoginViewController.swift
//  iOSCourse
//
//  Created by Giselle Salvador on 2022-08-18.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    func showPasswordAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        
           if let email = emailTextField.text {
            if let password = passwordTextField.text {
            let autentication = Auth.auth()
            
                autentication.signIn(withEmail: email, password: password, completion: { (user, error) in
                    if error == nil {
                        if user == nil{
                            self.showPasswordAlert(title: "Error", message: "Email or Password Incorrect")
                        }else{
                            self.performSegue(withIdentifier: "loginSegue", sender: nil)
                        }
                    } else{
                        self.showPasswordAlert(title: "Error", message: "Email or Password Incorrect")
                    }
               })
     
                
                }
            }

        
       
        }
        
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
