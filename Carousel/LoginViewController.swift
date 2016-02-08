//
//  LoginViewController.swift
//  Carousel
//
//  Created by Bobby Smith on 2/7/16.
//  Copyright © 2016 Bobby Smith. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var fieldParentView: UIView!
    
    @IBOutlet weak var buttonParentView: UIView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginNavBar: UIImageView!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var initialY: CGFloat!
    var offset: CGFloat!
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewWillAppear(animated: Bool) {
        let transform = CGAffineTransformMakeScale(0.2, 0.2)
        loginNavBar.transform = transform
        fieldParentView.transform = transform
        loginNavBar.alpha = 0
        fieldParentView.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.3) { () -> Void in
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.loginNavBar.transform = CGAffineTransformIdentity
            self.fieldParentView.alpha = 1
            self.loginNavBar.alpha = 1
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self

        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 100
        
        initialY = fieldParentView.frame.origin.y
        offset = -50

        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -120
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

    }
    
    @IBAction func signInButton(sender: AnyObject) {
        print(userNameTextField.text)
        print(passwordTextField.text)
        if userNameTextField.text!.isEmpty  || passwordTextField.text!.isEmpty {
            emptyEmailPasswordFeilds()
        } else {
            spinner.hidden = false
            loginButton.enabled = false
            spinner.startAnimating()
            delay(2, closure: { () -> () in
                self.validateCredentials()
                self.loginButton.enabled = true
                self.spinner.stopAnimating()
            })
            
        }

    }
    
    
    func validateCredentials() {
        if userNameTextField.text == "Adey" && passwordTextField.text == "rocks!" {
            
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject("existing user", forKey: "user")
            
            performSegueWithIdentifier("loginSeque", sender: self)
        } else if userNameTextField.text == "newUser" {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject("new user", forKey: "user")
            performSegueWithIdentifier("loginSeque", sender: self)
        } else {
            showAlert()
        }
    }
    
    @IBAction func showAlert() {
        let alertController = UIAlertController(title: "Access Denied", message: "Wrong username or password", preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "OK", style: .Default) { action -> Void in
            
        }
        alertController.addAction(okAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func emptyEmailPasswordFeilds() {
        var myTitle: String!
        var myMessage: String!
        if userNameTextField.text!.isEmpty && passwordTextField.text!.isEmpty {
            myTitle = "Email & Password Required"
            myMessage = "Please enter your email address and password"
        } else if userNameTextField.text!.isEmpty {
            myTitle = "Email Required"
            myMessage = "Please enter your email and password"
        } else {
            myTitle = "Password Required"
            myMessage = "Please enter your password"
            
        }
        let alertController = UIAlertController(title: myTitle, message: myMessage, preferredStyle: .Alert)

        let okAction = UIAlertAction(title: "OK", style: .Default) { action -> Void in
            
        }
        alertController.addAction(okAction)
        
        presentViewController(alertController, animated: true, completion: nil)

    }

    
    

    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= -50 {
            // Hide the keyboard
            view.endEditing(true)
        }

    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
        willDecelerate decelerate: Bool) {
            // This method is called right as the user lifts their finger
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // This method is called when the scrollview finally stops scrolling.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        fieldParentView.frame.origin.y = initialY + offset
        
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        // Scroll the scrollview up
        scrollView.contentOffset.y = scrollView.contentInset.bottom

    }
    
    func keyboardWillHide(notification: NSNotification!) {
        fieldParentView.frame.origin.y = initialY
        buttonParentView.frame.origin.y = buttonInitialY

    }

    @IBAction func didTap(sender: AnyObject) {
        view.endEditing(true)
    }
}
