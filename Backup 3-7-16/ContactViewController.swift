//
//  ChaptersViewController.swift
//  NTO App 1
//
//  Created by Michael Zetune on 1/21/15.
//  Copyright (c) 2015 Michael Zetune. All rights reserved.
//

import UIKit
import MessageUI

class ContactViewController: UIViewController, UITableViewDelegate, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate {

    
    @IBOutlet weak var contactsTableView: UITableView!
    
    var personNum: Int = 0
    
    var contactsArray = ["Sherrie Stalarow", "Tracy Davis", "Brian Kaner", "Eliana Schuller", "Grant Fischer", "Isaac Narrett", "Isabel Middleman", "Jenna Katz", "Jonathan Nurko", "Lindsay Blum", "Natalie Weissman", "Rayna Saltzman", "Ryan Yablonsky", "Sammy Zoller", "Zach Epstein", "Zach Starr", "Zoe Weinstein"]
    var descriptionArray = ["Senior Regional Director", "Regional Director", "Mazkir", "S'ganit", "Region App Chair", "Mekasher", "N'siah", "MIT Mom", "Godol", "Shlicha", "Mazkirah", "Mekasheret", "Gizbor", "Shaliach", "S'gan", "Moreh", "Gizborit"]
    var emailArray = ["sstalarow@bbyo.org", "tdavis@bbyo.org", "ntomazkir74@gmail.com", "ntosganit74@gmail.com", "grantfischer@grantfischer.com", "ntomekasher74@gmail.com", "ntonsiah74@gmail.com", "ntomitmom74@gmail.com","ntogodol74@gmail.com", "ntoshlicha74@gmail.com","ntomazkirah74@gmail.com", "ntomekasheret74@gmail.com", "ntogizbor74@gmail.com", "ntoshaliach74@gmail.com", "ntosgan74@gmail.com", "ntomoreh74@gmail.com", "ntogizborit74@gmail.com"]
    var phoneArray = ["", "", "214-931-6683", "402-215-9799", "214-802-5780", "817-688-9782", "214-606-7025", "214-901-5565", "214-549-9553", "918-549-1781", "214-695-0140", "972-922-1636", "469-834-9997", "214-215-0325", "972-896-0982", "972-672-8477", "918-237-3335"]
    
//    class Person {
//        var name: String
//        var description: String
//        var email: String
//        var phone: String
//        
//        init(n: String, d: String, e: String, p: String) {
//            
//            name = n
//            description = d
//            email = e
//            phone = p
//        }
//        
//        
//    }
    
//    var one = Person(n: "Sherrie Stalarow", d: "Senior Regional Director", e: "sstalarow@bbyo.org", p: "")
//    var two = Person(n: "Tracy Davis", d: "Regional Director", e: "tdavis@bbyo.org", p: "")
//    var three = Person(n: "Max Harberg", d: "Regional Godol", e: "ntogodol74@gmail.com", p: "214-668-6236")
//    var four = Person(n: "Nathan Levit", d: "S'gan", e: "ntosgan74@gmail.com", p: "918-978-1275")
//    var five = Person(n: "Yoav Ilan", d: "Moreh", e: "ntomoreh74@gmail.com", p: "214-886-5157")
//    var six = Person(n: "Ryan Sukenik", d: "Shaliach", e: "ntoshaliach74@gmail.com", p: "214-662-0554")
//    var seven = Person(n: "Max Feist", d: "Mekasher", e: "ntomekasher74@gmail.com", p: "856-723-4883")
//    var eight = Person(n: "Michael Zetune", d: "Mazkir", e: "ntomazkir74@gmail.com", p: "214-578-7115")
//    var nine = Person(n: "Pierce Bell", d: "Gizbor", e: "ntogizbor74@gmail.com", p: "214-766-8816")
//    var ten = Person(n: "Jessie Sureck", d: "Regional N'siah", e: "ntonsiah74@gmail.com", p: "214-641-6255")
//    var eleven = Person(n: "Emily Mailman", d: "S'ganit", e: "ntosganit74@gmail.com", p: "214-492-3445")
//    var twelve = Person(n: "Sophie Pervere", d: "MIT Mom", e: "ntomitmom74@gmail.com", p: "972-672-2927")
//    var thirteen = Person(n: "Shira Hovav", d: "Sh'licha", e: "ntoshlicha74@gmail.com", p: "214-604-2231")
//    var fourteen = Person(n: "Cammy Resnick", d: "Mekasheret", e: "ntomekasheret74@gmail.com", p: "214-282-1356")
//    var fifteen = Person(n: "Sarah Balis", d: "Mazkirah", e: "ntomazkirah74@gmail.com", p: "214-563-9042"); var sixteen = Person(n: "Maddie Weiner", d: "ntogizborit74@gmail.com", e: "ntogizborit74@gmail.com", p: "214-794-7752")
    
    
//    var peopleArray = Array<Person>() [one, two]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsArray.count
    }
    
    func tableView(tableView: UITableViewDelegate, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = contactsTableView.dequeueReusableCellWithIdentifier("Cell1") as! UITableViewCell
        
        cell.textLabel!.text = contactsArray[indexPath.row]
        cell.detailTextLabel!.text = descriptionArray[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        personNum = indexPath.row
        
        let optionMenu = UIAlertController(title: nil, message: "Email or Text? Email only for directors.", preferredStyle: .ActionSheet)
        
        let emailAction = UIAlertAction(title: "Email", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.handleEmailRequest()
        })
        
        let textAction = UIAlertAction(title: "Text", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.handleTextRequest()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            println("Cancelled")
        })
        
        optionMenu.addAction(emailAction)
        
        if personNum > 1 {
            optionMenu.addAction(textAction) }
        optionMenu.addAction(cancelAction)
        
        self.presentViewController(optionMenu, animated: true, completion: nil)
        
    }
    
        
    func handleTextRequest() {
        
        var messageVC = MFMessageComposeViewController()

        messageVC.body = ""
        messageVC.recipients = ["\(phoneArray[personNum])"]
        messageVC.messageComposeDelegate = self
        
        self.presentViewController(messageVC, animated: true, completion: nil)
        
    
    }
    

    
    func messageComposeViewController(controller: MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult) {
        
        switch (result.value) {
        case MessageComposeResultCancelled.value:
            println("Message was cancelled")
            self.dismissViewControllerAnimated(true, completion: nil)
        case MessageComposeResultFailed.value:
            println("Message failed")
            self.dismissViewControllerAnimated(true, completion: nil)
        case MessageComposeResultSent.value:
            println("Message was sent")
            self.dismissViewControllerAnimated(true, completion: nil)
        default:
            break;
        }
    }
    
    
    
    // MARK MFMailComposer Delegate
    
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
        
        mailComposerVC.setToRecipients([emailArray[personNum]])
        mailComposerVC.setSubject("Email to NTO \(descriptionArray[personNum])")
        mailComposerVC.setMessageBody("Hello,\n\n\n", isHTML: false)
        
        return mailComposerVC
    }
    func showMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
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
