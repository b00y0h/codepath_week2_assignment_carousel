//
//  SettingsViewController.swift
//  Carousel
//
//  Created by Bobby Smith on 2/8/16.
//  Copyright © 2016 Bobby Smith. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = settingsImage.image!.size

        scrollView.contentOffset.y = scrollView.contentInset.bottom

    }

    @IBAction func didPressClose(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func didPressLogout(sender: AnyObject) {
        showAlert()
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Are you sure you want to log out?", message: "", preferredStyle: .ActionSheet)
        
        let okAction = UIAlertAction(title: "Log Out", style: .Destructive) { action -> Void in
            self.performSegueWithIdentifier("logoutSegue", sender: nil)
        }
        
        alertController.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default) { action -> Void in}
        
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true, completion: nil)
        
    }

    
    
}
