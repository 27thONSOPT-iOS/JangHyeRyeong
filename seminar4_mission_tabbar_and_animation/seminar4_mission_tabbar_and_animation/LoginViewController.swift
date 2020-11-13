//
//  LoginViewController.swift
//  seminar3_mission_collectionView
//
//  Created by 장혜령 on 2020/11/12.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func touchUpClick(_ sender: Any) {
        guard let signVC = self.storyboard?.instantiateViewController(identifier: "SignUpViewController") else {
            return
        }
        self.present(signVC, animated: true, completion: nil)
    }
    

    

}
