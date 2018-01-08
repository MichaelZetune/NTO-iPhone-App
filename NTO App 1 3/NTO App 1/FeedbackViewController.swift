//
//  FeedbackViewController.swift
//  NTO App 1
//
//  Created by Michael Zetune on 3/8/15.
//  Copyright (c) 2015 Michael Zetune. All rights reserved.
//

import UIKit
import MessageUI


class FeedbackViewController: UIViewController, UITextFieldDelegate, MFMailComposeViewControllerDelegate {

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var nameField: UITextField!


    @IBOutlet weak var deviceField: UITextField!
    
    @IBOutlet weak var feedbackField: UITextField!
    
    @IBAction func submitButtonPressed(sender: AnyObject) {
    
    handleEmailRequest()
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameField.delegate = self
        self.deviceField.delegate = self
        self.feedbackField.delegate = self
        
        
        // Do any additional setup after loading the view.
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func handleEmailRequest() {
        let mailComposeViewController = configuredMailComposeViewController()
        
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
    mailComposerVC.setToRecipients(["grantfischer@grantfischer.com"])
        mailComposerVC.setSubject("App Feedback")
        mailComposerVC.setMessageBody("My name: \(nameField.text) \n Device: \(deviceField.text) \n Feedback: \n \(feedbackField.text)", isHTML: false)
        
        return mailComposerVC
    }
    
    func showMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
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
