//
//  ImageTimelineViewController.swift
//  Carousel CP Assignment 2
//
//  Created by Jess Lam on 2/12/16.
//  Copyright © 2016 Jess Lam. All rights reserved.
//

import UIKit

class ImageTimelineViewController: UIViewController {

    @IBOutlet weak var timelineScrollView: UIScrollView!
    @IBOutlet weak var timelineImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timelineScrollView.contentSize = timelineImageView.image!.size

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
