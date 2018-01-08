//
//  NewMemberViewController.swift
//  NTO App 1
//
//  Created by Michael Zetune on 2/24/15.
//  Copyright (c) 2015 Michael Zetune. All rights reserved.
//

import UIKit
import MessageUI

class ProspectiveMemberViewController: UIViewController, UITextFieldDelegate, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var prospectNameField: UITextField!
    
    @IBOutlet weak var prospectEmailField: UITextField!
    
    @IBOutlet weak var prospectPhoneField: UITextField!
    
    @IBOutlet weak var userNameField: UITextField!
    
    @IBOutlet weak var userEmailField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.prospectNameField.delegate = self
        self.prospectEmailField.delegate = self
        self.prospectPhoneField.delegate = self
        self.userNameField.delegate = self
        self.userEmailField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func submitButtonPressed(sender: AnyObject) {
    
    
    handleEmailRequest()
    
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
        
        mailComposerVC.setToRecipients(["ntomoreh74@gmail.com", "ntomitmom74@gmail.com"])
        mailComposerVC.setCcRecipients(["ntogodol74@gmail.com", "ntonsiah74@gmail.com"])
        mailComposerVC.setSubject("Prospective Members")
        mailComposerVC.setMessageBody("Hello ,\n Here is a prospective member for NTO: \n\n\n Name: \(prospectNameField.text)\nEmail: \(prospectEmailField.text)\nPhone: \(prospectPhoneField.text)\nMy name: \(userNameField.text)\nMy email: \(userEmailField.text) ", isHTML: false)
        
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
