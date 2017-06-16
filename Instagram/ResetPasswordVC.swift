//
//  ResetPasswordVC.swift
//  Instagram
//
//  Created by 沈韶泓 on 2017/6/15.
//  Copyright © 2017年 shenshaohong-institute. All rights reserved.
//

import UIKit
import AVOSCloudIM

class ResetPasswordVC: UIViewController {
    @IBOutlet weak var eMailTxt: UITextField!
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!

    @IBAction func resetBtnClicked(_ sender: UIButton) {
        self.view.endEditing(true)
        
        if eMailTxt.text!.isEmpty {
            let alert = UIAlertController(title: "Attention", message: "E-mail cannot be empty", preferredStyle: .alert)
            let OK = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(OK)
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
        AVUser.requestPasswordResetForEmail(inBackground: eMailTxt.text!) { (success, error) in
            if success {
                let alert = UIAlertController(title: "Attention", message: "The reset password link has been sent to your e-mail address", preferredStyle: .alert)
                let OK = UIAlertAction(title: "OK", style: .default, handler: { (_) in
                    self.dismiss(animated: true, completion: nil)
                })
                alert.addAction(OK)
                self.present(alert, animated: true, completion: nil)
            }else {
                print(error?.localizedDescription)
            }
        }
    }
    
    @IBAction func cancelBtnClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
