//
//  LoginViewController.swift
//  Carousel CP Assignment 2
//
//  Created by Jess Lam on 2/10/16.
//  Copyright © 2016 Jess Lam. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    func keyboardWillShow(notification: NSNotification!) {
        fieldParentView.frame.origin.y = initialY + offset
        print("keyboardWillShow")
        // Move the button up above keyboard
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        // Scroll the scrollview up
        loginScrollView.contentOffset.y = loginScrollView.contentInset.bottom
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        fieldParentView.frame.origin.y = initialY
         buttonParentView.frame.origin.y = buttonInitialY
    }
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    
    
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var loginScrollView: UIScrollView!
    @IBOutlet weak var buttonParentView: UIView!
    
    var initialY: CGFloat!
    var offset: CGFloat!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialY = fieldParentView.frame.origin.y
        offset = -50
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -80
        
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
    

    func scrollViewDidScroll(scrollView: UIScrollView) {
        // If the scrollView has been scrolled down by 50px or more...
        if scrollView.contentOffset.y <= -50 {
            // Hide the keyboard
            view.endEditing(true)
        }
    }
    
    @IBAction func didTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    @IBAction func didPressLogin(sender: AnyObject) {
        loginIndicator.startAnimating()
        loginButton.selected = true
        if emailField.text == "q" && passwordField.text == "q" {
            delay(2, closure: { () -> () in
                self.loginIndicator.stopAnimating()
                self.loginButton.selected = false
                self.performSegueWithIdentifier("firstSegue", sender: nil)
            })
        } else {
            delay(2, closure: { () -> () in
                self.loginIndicator.stopAnimating()
                self.loginButton.selected = false
            })
            let alertController = UIAlertController(title: "Email required", message: "Please enter your email.", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            }
            alertController.addAction(cancelAction)
            presentViewController(alertController, animated: true) {
            }
        }
    }
    
    @IBAction func onButton(sender: AnyObject) {
        self.loginIndicator.startAnimating()
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
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
