//
//  IntroViewController.swift
//  Carousel
//
//  Created by Bobby Smith on 2/7/16.
//  Copyright © 2016 Bobby Smith. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var introImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = introImage.image!.size
    }

    @IBAction func signInBtnTap(sender: AnyObject) {
    }
}
