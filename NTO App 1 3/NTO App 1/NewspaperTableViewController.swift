//
//  NewspaperTableViewController.swift
//  NTO App 1
//
//  Created by Michael Zetune on 5/25/15.
//  Copyright (c) 2015 Michael Zetune. All rights reserved.
//

import UIKit

//protocol NewspaperViewControllerDelegate {
//    
//    // Paper Picked
//    
//    func NewspaperTableView(newspaperTableViewController: NewspaperTableViewController, didPickNews path: NSURL)
//    
//    // Failed
//    func NewspaperTableViewDidFail(newspaperTableViewController: NewspaperTableViewController)
//}


class NewspaperTableViewController: UITableViewController {

//    var delegate: NewspaperViewControllerDelegate?
    
    var selectedNewsPath: NSURL!
    
    @IBOutlet weak var newsTableView: UITableView!
    
    var newsNames: Array<String> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsNames = ["Issue 1: January-February", "Issue 2: March-May", "Issue 3: Summer 2015", "Issue 4: September-October", "Issue 5: November-December"]
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

     override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return newsNames.count
    }

    
     override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = newsTableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) 

        cell.textLabel!.text = newsNames[indexPath.row]
        
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var newsVC: UIViewController?
        
        if indexPath.row == 0 {
            selectedNewsPath = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("NTO Newspaper 1", ofType:"pdf")!)
            print("three")
        } else if indexPath.row == 1 {
            
            selectedNewsPath = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("NTO Newspaper 2", ofType:"pdf")!)
            print("four")
        } else if indexPath.row == 2{
           
             selectedNewsPath = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("NTO Newspaper 3", ofType:"pdf")!)
            
        } else if indexPath.row == 3 {
            
            selectedNewsPath = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("NTO Newspaper 4", ofType:"pdf")!)
            
        }
        else {
            
            selectedNewsPath = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("NTO Newspaper 5", ofType:"pdf")!)
        }
        
        
        newsVC = self.storyboard?.instantiateViewControllerWithIdentifier("Newspaper1ViewController") as! Newspaper1ViewController
        
        
            self.performSegueWithIdentifier("toNewsView", sender: self)
        
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        print("seven")
        
        if segue.identifier == "toNewsView" {
        let newspaper1ViewController = segue.destinationViewController as! Newspaper1ViewController
            print("one")
            
//            delegate?.NewspaperTableView(self, didPickNews: selectedNewsPath!)
            print("eight")
            newspaper1ViewController.pdfLoc = selectedNewsPath
            
        } else {
            print("two")
//            delegate?.NewspaperTableViewDidFail(self)
        
        }
    }
        
}
    


    
//        var newsVC : UIViewController
//        if indexPath.row == 0 {
//            // handle Issue 1
//            newsVC = self.storyboard?.instantiateViewControllerWithIdentifier("Newspaper1ViewController") as! Newspaper1ViewController
//        } else {
//            // handle Issue 2
//            newsVC = self.storyboard?.instantiateViewControllerWithIdentifier("Newspaper2ViewController") as! Newspaper2ViewController
//        }
//        self.navigationController?.pushViewController(newsVC, animated: true)

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation




