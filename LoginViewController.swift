//
//  LoginViewController.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 28/11/22.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailEt: UITextField!
    
    @IBOutlet weak var passwordTf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func doLogin(_ sender: Any) {
        // login
        let alertaMessageWritten = UIAlertController(title: "Login", message: "Se inicio sesion correctamente", preferredStyle: .alert)
        let action = {
            self.performSegue(withIdentifier: "GoToHome", sender: nil)
        }
        let actionOk = UIAlertAction(title:"ok", style: .default){(_) in
            print("se clickeo ok")
        }
        alertaMessageWritten.addAction(actionOk)
        present(alertaMessageWritten, animated: true, completion: action)

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
