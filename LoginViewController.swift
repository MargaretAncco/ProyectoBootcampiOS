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
        let moveToHome = {
            guard let homeTabBarController = self.storyboard?.instantiateViewController(withIdentifier: "HomeTabBarController") as? HomeTabBarController else {
                return
            }
            homeTabBarController.modalPresentationStyle = .fullScreen
            self.present(homeTabBarController, animated: true)
            //self.performSegue(withIdentifier: "goToHome", sender: nil)
        }
        let actionOk = UIAlertAction(title:"ok", style: .default){(_) in
            print("se clickeo ok")
            moveToHome()
        }
        alertaMessageWritten.addAction(actionOk)
        present(alertaMessageWritten, animated: true, completion: nil)

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
