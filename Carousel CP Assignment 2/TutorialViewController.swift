//
//  TutorialViewController.swift
//  Carousel CP Assignment 2
//
//  Created by Jess Lam on 2/12/16.
//  Copyright © 2016 Jess Lam. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var tutorialPageControl: UIPageControl!
    @IBOutlet weak var tutorialScrollView: UIScrollView!
    @IBOutlet var tutorialImageView: UIView!
    @IBOutlet weak var buttonParentView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tutorialScrollView.delegate = self
        tutorialScrollView.contentSize = CGSize(width: 1280, height: 568)
        buttonParentView.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(tutorialScrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        let page : Int = Int(round(tutorialScrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        tutorialPageControl.currentPage = page
        
        if page == 3 {
            UIView.animateWithDuration(0.3) { () -> Void in
                self.buttonParentView.alpha = 1
                self.tutorialPageControl.hidden = true
        }
        } else {
            UIView.animateWithDuration(0.3) { () -> Void in
                self.buttonParentView.alpha = 0
                self.tutorialPageControl.hidden = false
            }
        }
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
