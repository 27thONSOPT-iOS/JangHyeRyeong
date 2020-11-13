//
//  SignUpViewController.swift
//  seminar3_mission_collectionView
//
//  Created by 장혜령 on 2020/11/12.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var partTextField: UITextField!
    
    @IBOutlet var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        partTextField.delegate = self
        nameTextField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
   
    @IBAction func touchUpSubmit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
    
    @objc
    func keyboardWillShow(_ sender: Notification) {
            self.view.frame.origin.y = -50
        }

     @objc
        func keyboardWillHide(_ sender: Notification) {
            self.view.frame.origin.y = 0
        }



}
