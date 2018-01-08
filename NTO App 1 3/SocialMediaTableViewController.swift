//
//  SocialMediaTableTableViewController.swift
//  NTO App 1
//
//  Created by Michael Zetune on 1/24/15.
//  Copyright (c) 2015 Michael Zetune. All rights reserved.
//

import UIKit

class SocialMediaTableViewController: UIViewController, UITableViewDelegate {
    
    
    
    @IBOutlet weak var socialMediaTableView: UITableView!
    
    var socialAccounts: Array<String> = []
    var socialDetails: Array<String> = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        socialAccounts = ["Twitter", "Facebook", "Instagram", "Remind"]
        socialDetails = ["View our Tweets!", "See posts (login once, never again)", "See NTO's Instagram pics!", "See an archive of texts"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return socialAccounts.count
    }
    
    func tableView(tableView: UITableViewDelegate, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel!.text = socialAccounts [indexPath.row]
        cell.detailTextLabel!.text = socialDetails [indexPath.row]
        
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var socialVC : UIViewController
        
        switch indexPath.row {
        case 0: socialVC = self.storyboard?.instantiateViewControllerWithIdentifier("TwitterViewController") as! TwitterViewController
        case 1: socialVC = self.storyboard?.instantiateViewControllerWithIdentifier("FacebookViewController") as!FacebookViewController
        case 2: socialVC = self.storyboard?.instantiateViewControllerWithIdentifier("InstagramViewController") as! InstagramViewController
        default: socialVC = self.storyboard?.instantiateViewControllerWithIdentifier("RemindViewController") as! RemindViewController
        }
        
//        if indexPath.row == 0 {
//            // handle twitter
//            socialVC = self.storyboard?.instantiateViewControllerWithIdentifier("TwitterViewController") as! TwitterViewController
//        } else if indexPath.row == 1 {
//            // handle facebook
//            socialVC = self.storyboard?.instantiateViewControllerWithIdentifier("FacebookViewController") as!FacebookViewController
//        } else if indexPath.row == 2 {
//            // handle instagram
//            socialVC = self.storyboard?.instantiateViewControllerWithIdentifier("InstagramViewController") as! InstagramViewController
//        } else {
//            // handle remind
//            socialVC = self.storyboard?.instantiateViewControllerWithIdentifier("RemindViewController") as! RemindViewController
//        }
        self.navigationController?.pushViewController(socialVC, animated: true)
    }
    


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    

        
        
}
    


    /*
     Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
         Return NO if you do not want the specified item to be editable.
        return true
    }
    

    
     Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
             Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
             Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
     Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
     Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
         Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
     MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
         Get the new view controller using [segue destinationViewController].
         Pass the selected object to the new view controller.
    }
    */

}
