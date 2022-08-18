//
//  FirstViewController.swift
//  iOSCourse
//
//  Created by Giselle Salvador on 2022-08-18.
//

import UIKit
import Firebase

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let autentication = Auth.auth()
        autentication.addStateDidChangeListener { (antentication, user) in
            if let loggedUSer = user {
                self.performSegue(withIdentifier: "directSegue", sender: nil)
            }
        }
    

    
    
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
