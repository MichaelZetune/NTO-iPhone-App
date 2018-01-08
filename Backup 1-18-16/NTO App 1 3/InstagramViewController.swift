//
//  InstagramViewController.swift
//  NTO App 1
//
//  Created by Michael Zetune on 1/26/15.
//  Copyright (c) 2015 Michael Zetune. All rights reserved.
//

import UIKit

class InstagramViewController: UIViewController {

    @IBOutlet weak var instagramWebView: UIWebView!
    
    var site = "http://instagram.com/nto_74/"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Instagram"
        // Do any additional setup after loading the view.
        
        self.sendRequest()
        
    }
    
    
    
    func sendRequest() {
        
        let url = NSURL(string: site)
        let request = NSURLRequest(URL: url!)
        instagramWebView.loadRequest(request)
    }

    @IBAction func backButtonPressed(sender: AnyObject) {
    
        if instagramWebView.canGoBack{
            instagramWebView.goBack()
        }
        
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
