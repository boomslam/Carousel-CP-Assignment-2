//
//  IntroViewController.swift
//  Carousel CP Assignment 2
//
//  Created by Jess Lam on 2/9/16.
//  Copyright © 2016 Jess Lam. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var introImageView: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        introScrollView.delegate = self
        introScrollView.contentSize = introImageView.image!.size
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let scrollViewPosition = introScrollView.contentOffset.y
        print(scrollViewPosition)
        
        let image1y = convertValue(scrollViewPosition, r1Min: -20, r1Max: 562, r2Min: -290, r2Max: 0)
        let image1x = convertValue(scrollViewPosition, r1Min: -20, r1Max: 562, r2Min: -65, r2Max: 0)
        let image1scale = convertValue(scrollViewPosition, r1Min: -20, r1Max: 562, r2Min: 1.1, r2Max: 1)
        let image1rotation = convertValue(scrollViewPosition, r1Min: -20, r1Max: 562, r2Min: -10, r2Max: 0)
        image1.transform = CGAffineTransformMakeTranslation(CGFloat(image1x), CGFloat(image1y))
        image1.transform = CGAffineTransformScale(image1.transform, CGFloat(image1scale), CGFloat(image1scale))
        image1.transform = CGAffineTransformRotate(image1.transform, CGFloat(Double(image1rotation) * M_PI / 180))
        
        let image2y = convertValue(scrollViewPosition, r1Min: -20, r1Max: 562, r2Min: -270, r2Max: 0)
        let image2x = convertValue(scrollViewPosition, r1Min: -20, r1Max: 562, r2Min: 40, r2Max: 0)
        let image2scale = convertValue(scrollViewPosition, r1Min: -20, r1Max: 562, r2Min: 1.9, r2Max: 1)
        let image2rotation = convertValue(scrollViewPosition, r1Min: -20, r1Max: 562, r2Min: -8, r2Max: 0)
        image2.transform = CGAffineTransformMakeTranslation(CGFloat(image2x), CGFloat(image2y))
        image2.transform = CGAffineTransformScale(image2.transform, CGFloat(image2scale), CGFloat(image2scale))
        image2.transform = CGAffineTransformRotate(image2.transform, CGFloat(Double(image2rotation) * M_PI / 180))
        
        let image3y = convertValue(scrollViewPosition, r1Min: -20, r1Max: 562, r2Min: -440, r2Max: 0)
        let image3x = convertValue(scrollViewPosition, r1Min: -20, r1Max: 562, r2Min: 0, r2Max: 0)
        let image3scale = convertValue(scrollViewPosition, r1Min: -20, r1Max: 562, r2Min: 1.8, r2Max: 1)
        let image3rotation = convertValue(scrollViewPosition, r1Min: -20, r1Max: 562, r2Min: 9, r2Max: 0)
        image3.transform = CGAffineTransformMakeTranslation(CGFloat(image3x), CGFloat(image3y))
        image3.transform = CGAffineTransformScale(image3.transform, CGFloat(image3scale), CGFloat(image3scale))
        image3.transform = CGAffineTransformRotate(image3.transform, CGFloat(Double(image3rotation) * M_PI / 180))
        
        let image4y = convertValue(scrollViewPosition, r1Min: -20, r1Max: 562, r2Min: -400, r2Max: 0)
        let image4x = convertValue(scrollViewPosition, r1Min: -20, r1Max: 562, r2Min: 100, r2Max: 0)
        let image4scale = convertValue(scrollViewPosition, r1Min: -20, r1Max: 562, r2Min: 1.9, r2Max: 1)
        let image4rotation = convertValue(scrollViewPosition, r1Min: -20, r1Max: 562, r2Min: 10, r2Max: 0)
        image4.transform = CGAffineTransformMakeTranslation(CGFloat(image4x), CGFloat(image4y))
        image4.transform = CGAffineTransformScale(image4.transform, CGFloat(image4scale), CGFloat(image4scale))
        image4.transform = CGAffineTransformRotate(image4.transform, CGFloat(Double(image4rotation) * M_PI / 180))
        
        let image5y = convertValue(scrollViewPosition, r1Min: -20, r1Max: 562, r2Min: -530, r2Max: 0)
        let image5x = convertValue(scrollViewPosition, r1Min: -20, r1Max: 562, r2Min: -120, r2Max: 0)
        let image5scale = convertValue(scrollViewPosition, r1Min: -20, r1Max: 562, r2Min: 2, r2Max: 1)
        let image5rotation = convertValue(scrollViewPosition, r1Min: -20, r1Max: 562, r2Min: 10, r2Max: 0)
        image5.transform = CGAffineTransformMakeTranslation(CGFloat(image5x), CGFloat(image5y))
        image5.transform = CGAffineTransformScale(image5.transform, CGFloat(image5scale), CGFloat(image5scale))
        image5.transform = CGAffineTransformRotate(image5.transform, CGFloat(Double(image5rotation) * M_PI / 180))
        
        let image6y = convertValue(scrollViewPosition, r1Min: -20, r1Max: 562, r2Min: -520, r2Max: 0)
        let image6x = convertValue(scrollViewPosition, r1Min: -20, r1Max: 562, r2Min: -90, r2Max: 0)
        let image6scale = convertValue(scrollViewPosition, r1Min: -20, r1Max: 562, r2Min: 1.6, r2Max: 1)
        let image6rotation = convertValue(scrollViewPosition, r1Min: -20, r1Max: 562, r2Min: -10, r2Max: 0)
        image6.transform = CGAffineTransformMakeTranslation(CGFloat(image6x), CGFloat(image6y))
        image6.transform = CGAffineTransformScale(image6.transform, CGFloat(image6scale), CGFloat(image6scale))
        image6.transform = CGAffineTransformRotate(image6.transform, CGFloat(Double(image6rotation) * M_PI / 180))
    }
    
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    if introScrollView.contentOffset.y > 100 {
        self.introScrollView.setContentOffset(CGPointMake(self.introScrollView.contentOffset.x, 562), animated: true)
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
