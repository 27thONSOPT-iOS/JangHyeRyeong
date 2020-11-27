//
//  SignUpVC.swift
//  week6_network
//
//  Created by 장혜령 on 2020/11/25.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var userNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpSignUp(_ sender: Any) {
        //1. 입력한 값들 가져오기
        guard let emailText = emailTextField.text,
              let passwordText = passwordTextField.text,
              let userNameText = userNameTextField.text else {
            return
        }
        
        //2. 가져온 값들로 request 보내기
        AuthService.shared.signUp(email: emailText, password: passwordText, userName: userNameText) { (networkResult) in
            switch networkResult {
            case .success(let data): // 이게 성공해서 넘겨준 데이터인가?
                if let data = data as? SignUpData {
                    self.simpleAlert(title: "회원가입 성공", message: "\(data.userName)님 환영합니다!")
                    UserDefaults.standard.set(data.userName, forKey: "userName")
                }
                
            case .requestErr(let msg):
                if let message = msg as? String {
                    self.simpleAlert(title: "회원가입 실패", message: message)
                }
                print("requsetErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        
        }
        
    }
    
  
    func simpleAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: { okAction in
            self.dismiss(animated: true, completion: nil)
        })
        
        alert.addAction(okAction)
        present(alert, animated: true)
       
    }

    
}
