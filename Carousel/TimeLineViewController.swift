//
//  TimeLineViewController.swift
//  Carousel
//
//  Created by Bobby Smith on 2/7/16.
//  Copyright © 2016 Bobby Smith. All rights reserved.
//

import UIKit

class TimeLineViewController: UIViewController {

    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = feedImage.image!.size

    }

}
