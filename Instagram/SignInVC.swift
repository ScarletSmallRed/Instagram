//
//  SignInVC.swift
//  Instagram
//
//  Created by 沈韶泓 on 2017/6/15.
//  Copyright © 2017年 shenshaohong-institute. All rights reserved.
//

import UIKit
import AVOSCloudIM

class SignInVC: UIViewController {
    //Txt fields
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    //Buttons
    @IBOutlet weak var forgetBtn: UIButton!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!

    @IBAction func signInBtnClicked(_ sender: UIButton) {
        self.view.endEditing(true)
        
        if userNameTxt.text!.isEmpty
        || passwordTxt.text!.isEmpty{
            let alert = UIAlertController(title: "Attention", message: "Please fill in all fields", preferredStyle: .alert)
            let OK = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(OK)
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
        AVUser.logInWithUsername(inBackground: userNameTxt.text!, password: passwordTxt.text!) { (user, error) in
            if error == nil {
                UserDefaults.standard.set(user!.username, forKey: "userName")
                UserDefaults.standard.synchronize()
                
                let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.login()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let hideTap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard(_:)))
        hideTap.numberOfTapsRequired = 1
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(hideTap)
    }
    
    func hideKeyboard(_ recognizer: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
