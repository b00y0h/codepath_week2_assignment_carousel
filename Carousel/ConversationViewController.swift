//
//  ConversationViewController.swift
//  Carousel
//
//  Created by Bobby Smith on 2/8/16.
//  Copyright © 2016 Bobby Smith. All rights reserved.
//

import UIKit

class ConversationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func didPressBack(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }

}
