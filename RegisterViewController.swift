//
//  RegisterViewController.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 28/11/22.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var passwordTf: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Register(_ sender: Any) {
        let alertaMessageWritten = UIAlertController(title: "Registro", message: "Se registro el usuario correctamente", preferredStyle: .alert)
        let action = UIAlertAction(title:"ok", style: .default){(_) in
            print("se clickeo ok")
        }
        alertaMessageWritten.addAction(action)
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
