//
//  LoginViewController.swift
//  Carousel CP Assignment 2
//
//  Created by Jess Lam on 2/10/16.
//  Copyright © 2016 Jess Lam. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var loginScrollView: UIScrollView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var loginNavBar: UIImageView!
  
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -120
        
        loginScrollView.contentSize = loginScrollView.frame.size
        loginScrollView.contentInset.bottom = 100
        
        loginScrollView.delegate = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // Set initial transform values 20% of original size
        let transform = CGAffineTransformMakeScale(0.2, 0.2)
        // Apply the transform properties of the views
        loginNavBar.transform = transform
        fieldParentView.transform = transform
        // Set the alpha properties of the views to transparent
        loginNavBar.alpha = 0
        fieldParentView.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //Animate the code within over 0.3 seconds...
        UIView.animateWithDuration(0.3) { () -> Void in
            // Return the views transform properties to their default states.
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.loginNavBar.transform = CGAffineTransformIdentity
            // Set the alpha properties of the views to fully opaque
            self.fieldParentView.alpha = 1
            self.loginNavBar.alpha = 1
        }
    }
    
    
    @IBAction func didPressLogin(sender: AnyObject) {
        loginIndicator.startAnimating()
        print(emailField)
        if emailField.text!.isEmpty || passwordField.text!.isEmpty{
            
            let alertController  = UIAlertController(title: "Email Required", message: "Please try again.", preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
            }
            alertController.addAction(cancelAction)
            presentViewController(alertController, animated: true){
            }
            self.loginIndicator.stopAnimating()
        } else
            if emailField.text == "q" && passwordField.text == "q"{
            delay(2, closure: { () -> () in
                self.loginIndicator.stopAnimating()
                self.performSegueWithIdentifier("firstSegue", sender: nil)
                
            })
        }else{
            delay(2, closure: { () -> () in
                self.loginIndicator.stopAnimating()
                let failController  = UIAlertController(title: "Incorrect Email and Password", message: "Please try again.", preferredStyle: .Alert)
                
                let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
                }
                failController.addAction(cancelAction)
                self.presentViewController(failController, animated: true){ print("test2")
                }
    
                
            })
            
        }
    }
    
    
    func keyboardWillShow(notification: NSNotification!) {
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        loginScrollView.contentOffset.y = loginScrollView.contentInset.bottom
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        buttonParentView.frame.origin.y = buttonInitialY
        
    }
    
    func loginScrollViewDidScroll(scrollView: UIScrollView) {
        if loginScrollView.contentOffset.y <= -50{
            view.endEditing(true)
            
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // If the scrollView has been scrolled down by 50px or more...
        if scrollView.contentOffset.y <= -50 {
            // Hide the keyboard
            view.endEditing(true)
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
