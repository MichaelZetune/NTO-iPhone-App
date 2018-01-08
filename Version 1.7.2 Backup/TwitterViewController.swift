//
//  TwitterViewController.swift
//  NTO App 1
//
//  Created by Michael Zetune on 1/26/15.
//  Copyright (c) 2015 Michael Zetune. All rights reserved.
//

import UIKit

class TwitterViewController: UIViewController {

    @IBOutlet weak var twitterWebView: UIWebView!
    
    var site = "https://twitter.com/NTOregion"
    var topWord = "Twitter"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = topWord
        // Do any additional setup after loading the view.
        
        self.sendRequest()
        
    }
    
    
    
    func sendRequest() {
        
        let url = NSURL(string: site)
        let request = NSURLRequest(URL: url!)
        twitterWebView.loadRequest(request)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
    
        if twitterWebView.canGoBack{
            twitterWebView.goBack()
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
