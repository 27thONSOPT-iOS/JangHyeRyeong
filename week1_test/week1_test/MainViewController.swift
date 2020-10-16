//
//  MainViewController.swift
//  week1_test
//
//  Created by 장혜령 on 2020/10/12.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var partLabel: UILabel!
    @IBOutlet var userName: UILabel!
    
    var mainPart: String?
    var mainName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabel()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setLabel()
    }
    @IBAction func touchUpMove(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "LoginViewController") else {
            return
        }
        self.present(dvc, animated: true, completion: nil)
    }
    
    func setLabel(){
        if let part = self.mainPart, let name = self.mainName{
            self.partLabel.text = part
            self.partLabel.sizeToFit()
            
            self.userName.text = "\(name)님 안녕하세요"
            self.userName.sizeToFit()
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
