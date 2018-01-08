//
//  NewspaperViewController.swift
//  NTO App 1
//
//  Created by Michael Zetune on 3/8/15.
//  Copyright (c) 2015 Michael Zetune. All rights reserved.
//

import UIKit

class Newspaper1ViewController: UIViewController { // NewspaperViewControllerDelegate


    @IBOutlet weak var webView: UIWebView!
    
    var pdfLoc: NSURL!
    

    
    
    func loadNewspaper() {
        
//        var pdfLoc = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("NTO March Newspaper", ofType:"pdf")!)

        let request = NSURLRequest(URL: pdfLoc!)
        self.webView.loadRequest(request)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNewspaper()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let newspaperTableViewController = segue.destinationViewController as? NewspaperTableViewController {
            print("five")
//            newspaperTableViewController.delegate = self
        }

        
        
    }

}



