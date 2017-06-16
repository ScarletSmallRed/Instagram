//
//  SignUpVC.swift
//  Instagram
//
//  Created by 沈韶泓 on 2017/6/15.
//  Copyright © 2017年 shenshaohong-institute. All rights reserved.
//

import UIKit
import AVOSCloudIM

class SignUpVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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
    
    @IBAction func signUpBtnClicked(_ sender: UIButton) {
        self.view.endEditing(true)
        
        if passwordTxt.text != repeatPasswordTxt.text {
            let alert = UIAlertController(title: "Attention", message: "The password entered twice is inconsistent", preferredStyle: .alert)
            let OK = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(OK)
            self.present(alert, animated: true, completion: nil)
        }
        
        //Send registration data to the server
        let user = AVUser()
        user.username = userNameTxt.text!.lowercased()
        user.email = eMailTxt.text!.lowercased()
        user.password = passwordTxt.text!
        
        user["fullName"] = fullNameTxt.text!.lowercased()
        user["bio"] = bioTxt.text!
        user["web"] = webTxt.text!
        user["gender"] = ""
        
        //Convert avatar data and send it to the server
        let avaData = UIImageJPEGRepresentation(avaImg.image!, 0.5)
        let avaFile = AVFile(name: "ava.jpg", data: avaData!)
        user["ava"] = avaFile
        
        user.signUpInBackground { (success, error) in
            if success {
                print("User registration is successful!")
                
                UserDefaults.standard.set(user.username, forKey: "userName")
                UserDefaults.standard.synchronize()
                
                let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.login()
            } else {
                print(error?.localizedDescription)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        scrollView.contentSize.height = self.view.frame.height
        scrollViewHeight = self.view.frame.height
        
        //Detects the status of the keyboard that appears or disappears
        NotificationCenter.default.addObserver(self, selector: #selector(showKeyboard(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyboard(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        let hideTap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardTap(_:)))
        hideTap.numberOfTapsRequired = 1
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(hideTap)
        
        let imgTap = UITapGestureRecognizer(target: self, action: #selector(loadImg(_:)))
        imgTap.numberOfTapsRequired = 1
        avaImg.isUserInteractionEnabled = true
        avaImg.addGestureRecognizer(imgTap)
        avaImg.layer.cornerRadius = avaImg.frame.width / 2
        avaImg.clipsToBounds = true
    }
    
    func showKeyboard(_ notification: Notification) {
        let rect = notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        keyboard = rect.cgRectValue
        
        UIView.animate(withDuration: 0.4) { 
            self.scrollView.frame.size.height = self.scrollViewHeight - self.keyboard.size.height
        }
    }
    
    func hideKeyboard(_ notification: Notification) {
        UIView.animate(withDuration: 0.4) { 
            self.scrollView.frame.size.height = self.view.frame.height
        }
    }
    
    func hideKeyboardTap(_ reconizer: UITapGestureRecognizer) {
        self.view.endEditing(true)
        
        if userNameTxt.text!.isEmpty
        || passwordTxt.text!.isEmpty
        || repeatPasswordTxt.text!.isEmpty
        || eMailTxt.text!.isEmpty
        || fullNameTxt.text!.isEmpty
        || bioTxt.text!.isEmpty
        || webTxt.text!.isEmpty {
            let alert = UIAlertController(title: "Attention", message: "Please fill in all fields.", preferredStyle: .alert)
            let OK = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(OK)
            self.present(alert, animated: true, completion: nil)
            
            return
        }
    }
    
    func loadImg(_ recognizer: UITapGestureRecognizer) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        avaImg.image = info[UIImagePickerControllerEditedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
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
