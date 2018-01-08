//
//  WalkdownViewController.swift
//  NTO App 1
//
//  Created by Michael Zetune on 2/24/15.
//  Copyright (c) 2015 Michael Zetune. All rights reserved.
//

import UIKit

class WalkdownViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load2016()
        // Do any additional setup after loading the view.
    }
    
    var site2015 = "https://sites.google.com/a/zetune.com/nto-walkdown/"
    
    var site2016 = "https://sites.google.com/site/ntowalkdown2016/home/"
    
    
    @IBOutlet weak var webView: UIWebView!
    
    
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!

    
    func load2015() {
        
        let url = NSURL(string: site2015)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
    
    func load2016() {
        
        let url = NSURL(string: site2016)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
    
    @IBAction func groupSelected(sender: AnyObject) {
        
        switch yearSegmentedControl.selectedSegmentIndex
        {
        case 0:
            load2016()
        case 1:
            load2015()
        default:
            break
}
}
}