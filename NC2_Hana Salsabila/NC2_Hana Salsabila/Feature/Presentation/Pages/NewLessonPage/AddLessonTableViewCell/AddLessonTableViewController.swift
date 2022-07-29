//
//  AddLessonTableViewController.swift
//  NC2_Hana Salsabila
//
//  Created by Hana Salsabila on 28/07/22.
//

import UIKit
import CoreData

protocol AddLessonTableViewControllerDelegate: AnyObject {
  func logoutTapped()
    func updateLessonTitle(value: String)
    func updateLessonResource(value: String)
    func updateLessonDocumentation(value: String)
}

class AddLessonTableViewController: UITableViewController {
    
    // this would be the parent view controller
    weak var delegate : AddLessonTableViewControllerDelegate?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var resourceYoutubeTextField: UITextField!
    @IBOutlet weak var resourceOtherTextField: UITextField!
    @IBOutlet weak var documentation1TextField: UITextField!
    @IBOutlet weak var documentation2TextField: UITextField!
    @IBOutlet weak var documentation3TextField: UITextField!
    
    var lessonTitle = ""
    var lessonResource = ""
    var lessonDocumentation = ""
    
    //Reference to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //Data for the table view
    var myLesson : [Lesson]!

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if(indexPath.row == 1){
            // tell the delegate (view controller) to perform logoutTapped() function
            if let delegate = delegate {
                delegate.logoutTapped()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
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
