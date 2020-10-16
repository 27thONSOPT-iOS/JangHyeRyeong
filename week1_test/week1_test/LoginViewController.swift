//
//  ViewController.swift
//  week1_test
//
//  Created by 장혜령 on 2020/10/12.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var partTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    
    var loginPart: String?
    var loginName: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpBackMain(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "MainViewController") as? MainViewController else {
            return
        }

        dvc.mainPart = partTextField.text
        dvc.mainName = nameTextField.text
        
    
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func touchUpSignUp(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "SignUpViewController") else {
            return
        }
        
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
    
    func setLabel(){
        
    }
    
}

