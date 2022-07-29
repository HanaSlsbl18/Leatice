//
//  LessonDetailTableViewController.swift
//  NC2_Hana Salsabila
//
//  Created by Hana Salsabila on 28/07/22.
//

import UIKit
import CoreData

class LessonDetailTableViewController: UITableViewController {

    @IBOutlet weak var resource1Label: UILabel!
    
    var getLessonIndex : Int?
    
    var myLessonindex : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func loadView() {
        super.loadView()

        // This is the key
        myLessonindex = getLessonIndex
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.onClicLabel(sender:)))
        resource1Label.isUserInteractionEnabled = true
        resource1Label.addGestureRecognizer(tap)
    }

    // And that's the function :)
    @objc func onClicLabel(sender:UITapGestureRecognizer) {
        openUrl(urlString: "http://www.google.com")
    }


    func openUrl(urlString:String!) {
        let url = URL(string: urlString)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
//    @IBAction func toLessonDetailPage(sender: UIStoryboardSegue) {
//        if sender.source is CourseDetailViewController {
//            if let senderVC = sender.source as? CourseDetailViewController{
//                
//                if segue.identifier == "toLessonDetailPage" {
//
////                    getLessonIndex = senderVC.myLessonIndex
//                }
//            }
//        }
//    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 3 {
            return 3
        } else {
            return 2
        }
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
