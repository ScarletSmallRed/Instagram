//
//  SignUpVC.swift
//  Instagram
//
//  Created by 沈韶泓 on 2017/6/15.
//  Copyright © 2017年 shenshaohong-institute. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    //Image view
    @IBOutlet weak var avaImg: UIImageView!
    
    //Text fields
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var repeatPasswordTxt: UITextField!
    @IBOutlet weak var eMailTxt: UITextField!
    
    //Text fields2
    @IBOutlet weak var fullNameTxt: UITextField!
    @IBOutlet weak var bioTxt: UITextField!
    @IBOutlet weak var webTxt: UITextField!
    
    //Scroll view
    var scrollViewHeight: CGFloat = 0
    @IBOutlet weak var scrollView: UIScrollView!
    
    //The size of keyboard
    var keyboard: CGRect = CGRect()
    
    //Buttons
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!

    @IBAction func cancelBtnClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        scrollView.contentSize.height = self.view.frame.height
        
        //Detects the status of the keyboard that appears or disappears
    }
    
    func showKeyboard(_ notification: Notification) {
        
    }
    
    func hideKeyboard(_ notification: Notification) {
        
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
