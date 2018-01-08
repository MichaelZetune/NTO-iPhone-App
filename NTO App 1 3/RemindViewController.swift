//
//  RemindViewController.swift
//  NTO App 1
//
//  Created by Michael Zetune on 1/26/15.
//  Copyright (c) 2015 Michael Zetune. All rights reserved.
//

import UIKit

class RemindViewController: UIViewController {

    @IBOutlet weak var remindWebView: UIWebView!
    
    
    var site = "https://sites.google.com/site/ntoremind/"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Remind"
        // Do any additional setup after loading the view.
        
        self.sendRequest()
        
    }
    
    
    
    func sendRequest() {
        
        let url = NSURL(string: site)
        let request = NSURLRequest(URL: url!)
        remindWebView.loadRequest(request)
    }

    
    @IBAction func signUpButtonPressed(sender: AnyObject) {
    
        let refreshAlert = UIAlertController()
        refreshAlert.title = "Sign up!"
        refreshAlert.message = "Text \"@nto74\" to 81010!"

        

        
        
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
