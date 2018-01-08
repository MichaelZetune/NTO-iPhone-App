//
//  GameViewController.swift
//  SpaceGame
//
//  Created by Michael Zetune on 2/22/15.
//  Copyright (c) 2015 Michael Zetune. All rights reserved.
//

import UIKit
import SpriteKit
import MessageUI

extension SKNode {
    
    class func unarchiveFromFile(file: String) -> SKNode? {
        
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
            var sceneData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil)!
            var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
            
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as! GameScene
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}

class GameViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    
    @IBOutlet weak var pauseButton: UIButton!
    
    @IBAction func pauseButtonPressed(sender: AnyObject) {
        
        // game scene button pressed
        
        gameScene.pauseButtonPressed(sender)
    }
    
    var gameScene: GameScene!
    var leaderView: TwitterViewController!
    
//    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let scene = GameScene.unarchiveFromFile("GameScene") as? GameScene {
            // Configure the view.
            
            println("success")
            // Store a reference
            gameScene = scene
            gameScene.pauseButton = pauseButton // sharing UIKit views

            
            let skView = self.view as! SKView
            skView.showsFPS = false
            skView.showsNodeCount = false
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            scene.size = UIScreen.mainScreen().bounds.size
            
            skView.presentScene(scene)
            
            
            var screenshotButton = UIBarButtonItem(title: "Submit", style: .Plain, target: self, action: Selector("screenshotButtonPressed"))
            var leadButton = UIBarButtonItem(title: "Leaderboard", style: .Plain, target: self, action: Selector("leadButtonPressed"))

            

            self.navigationItem.rightBarButtonItems = [leadButton, screenshotButton]
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        
        showPlayerOptions()
        
    }
    
    func leadButtonPressed() {
        
        
        leaderView = self.storyboard?.instantiateViewControllerWithIdentifier("TwitterViewController") as! TwitterViewController
        leaderView.site = "https://docs.google.com/spreadsheets/d/1kn-HAwhodzRwprRyw2Fz_gAIR1hLkoTn2pG46E82wbQ/edit?usp=sharing"
        leaderView.topWord = "Leaderboard"
        self.navigationController?.pushViewController(leaderView, animated: true)
        
    }


    
    func screenshotButtonPressed() {
        
        println("screenshot")
        
        var image = takeScreenshot(self.view!)
        
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        var infoAlert = UIAlertView()
        infoAlert.title = "Enter into leaderboard?"
        infoAlert.message = "When prompted, type in your full name and send the message to submit your score. More than three score submissions per day will not be considered."
        infoAlert.addButtonWithTitle("Ok")
        infoAlert.show()
        
        
        var messageComposeVC = MFMessageComposeViewController()

        messageComposeVC.body = "My Name: "
        messageComposeVC.recipients = ["2148025780"]
        messageComposeVC.messageComposeDelegate = self
        var imageData = UIImageJPEGRepresentation(image, 1.0)
        messageComposeVC.addAttachmentData(imageData, typeIdentifier: "image/jpeg", filename: "My Image.jpeg")
        
        self.navigationController?.presentViewController(messageComposeVC, animated: true, completion: nil)
        
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
    
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func takeScreenshot(theView: UIView) -> UIImage {
        
        
        
        UIGraphicsBeginImageContextWithOptions(theView.bounds.size, true, 0.0)
        
        theView.drawViewHierarchyInRect(theView.bounds, afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        return image
        
    }
    
    
    func showPlayerOptions() {
        
        gameScene.pauseGamePlay()
        
        var refreshAlert = UIAlertController(title: "Select Player", message: "Choose one. Game will stop when you lose and you can submit to leaderboard if you wish. Click back and return to game to play again", preferredStyle: UIAlertControllerStyle.Alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Brian", style: .Default, handler: { (action: UIAlertAction!) in
            self.gameScene.playerShip.texture = SKTexture(imageNamed: "brian")
            self.gameScene.resumeGamePlay()
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Eliana", style: .Default, handler: { (action: UIAlertAction!) in
            self.gameScene.playerShip.texture = SKTexture(imageNamed: "eliana")
            self.gameScene.resumeGamePlay()
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Isaac", style: .Default, handler: { (action: UIAlertAction!) in
            self.gameScene.playerShip.texture = SKTexture(imageNamed: "isaac")
            self.gameScene.resumeGamePlay()
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Isabel", style: .Default, handler: { (action: UIAlertAction!) in
            self.gameScene.playerShip.texture = SKTexture(imageNamed: "isabel")
            self.gameScene.resumeGamePlay()
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Jenna", style: .Default, handler: { (action: UIAlertAction!) in
            self.gameScene.playerShip.texture = SKTexture(imageNamed: "jenna")
            self.gameScene.resumeGamePlay()
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Jonathan", style: .Default, handler: { (action: UIAlertAction!) in
            self.gameScene.playerShip.texture = SKTexture(imageNamed: "jonathan")
            self.gameScene.resumeGamePlay()
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Lindsay", style: .Default, handler: { (action: UIAlertAction!) in
            self.gameScene.playerShip.texture = SKTexture(imageNamed: "lindsay")
            self.gameScene.resumeGamePlay()
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Natalie", style: .Default, handler: { (action: UIAlertAction!) in
            self.gameScene.playerShip.texture = SKTexture(imageNamed: "natalie")
            self.gameScene.resumeGamePlay()
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Rayna", style: .Default, handler: { (action: UIAlertAction!) in
            self.gameScene.playerShip.texture = SKTexture(imageNamed: "rayna")
            self.gameScene.resumeGamePlay()
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Ryan", style: .Default, handler: { (action: UIAlertAction!) in
            self.gameScene.playerShip.texture = SKTexture(imageNamed: "ryan")
            self.gameScene.resumeGamePlay()
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Sammy", style: .Default, handler: { (action: UIAlertAction!) in
            self.gameScene.playerShip.texture = SKTexture(imageNamed: "sammy")
            self.gameScene.resumeGamePlay()
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Zach E.", style: .Default, handler: { (action: UIAlertAction!) in
            self.gameScene.playerShip.texture = SKTexture(imageNamed: "zach-E")
            self.gameScene.resumeGamePlay()
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Zach S.", style: .Default, handler: { (action: UIAlertAction!) in
            self.gameScene.playerShip.texture = SKTexture(imageNamed: "zach-S")
            self.gameScene.resumeGamePlay()
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Zoe", style: .Default, handler: { (action: UIAlertAction!) in
            self.gameScene.playerShip.texture = SKTexture(imageNamed: "zoe")
            self.gameScene.resumeGamePlay()
        }))
        
        gameScene.score = 0
        presentViewController(refreshAlert, animated: true, completion: nil)
        
    }
    
    override func viewDidLayoutSubviews() {
        
        // game scene
        gameScene.size = UIScreen.mainScreen().bounds.size
        
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> Int {
        
        return Int(UIInterfaceOrientationMask.Portrait.rawValue | UIInterfaceOrientationMask.PortraitUpsideDown.rawValue)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}
