//
//  MyReflectionsViewController.swift
//  NC2_Hana Salsabila
//
//  Created by Hana Salsabila on 25/07/22.
//

import UIKit
import CoreData

class MyReflectionsViewController: UIViewController {
    
    @IBOutlet weak var myReflectionTableView: UITableView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var doneBtn: UIButton!
    
    //Reference to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //Data for the collection view
    var myCourse : [Course]!
    var myLesson : [Lesson]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let nibCell = UINib(nibName: "MyReflectionsTableViewCell", bundle: nil)
        myReflectionTableView.register(nibCell, forCellReuseIdentifier: "MyReflectionsCell")
        
        fetchCourse()
        fetchLesson()
    }
    func initAll() {
        
        backBtn.titleLabel?.textColor = .darkRed
        doneBtn.titleLabel?.textColor = .darkRed
        
    }
    
    func fetchCourse() {

        //Fetch the data from Core Data to display in the table view
        do {
            let request = Course.fetchRequest() as NSFetchRequest<Course>

            self.myCourse = try context.fetch(request)

            DispatchQueue.main.async {
                self.myReflectionTableView!.reloadData()
            }
        }
        catch {

        }

    }
    
    func fetchLesson() {

        //Fetch the data from Core Data to display in the table view
        
        do {
            let request = Lesson.fetchRequest() as NSFetchRequest<Lesson>

            self.myLesson = try context.fetch(request)

            DispatchQueue.main.async {
                self.myReflectionTableView!.reloadData()
            }
        }
        catch {

        }

    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneBtn(_ sender: UIButton) {
//        if .text != "" {
//            //Create a person object
//            let newCourse = Course(context: self.context)
//            newCourse.name = courseTextField.text
//            newCourse.detail = descriptionTextField.text
//            newCourse.category = categoryTextField.text
//
//            //Save the data
//            do {
//                try self.context.save()
//            }
//            catch {
//
//            }
//
//            //Re-fetch the data
//            self.fetchLesson()
//
            performSegue(withIdentifier: "unwindFromMyReflection", sender: self)
//        } else {
//            //Create alert
//            let alert = UIAlertController(title: "You have a empty text", message: "Please fill it first to continue to next page", preferredStyle: .alert)
//
//            //Configure button handler
//            let closeButton = UIAlertAction(title: "Close", style: .default)
//
//            //Add button
//            alert.addAction(closeButton)
//
//            //Show alert
//            self.present(alert, animated: true, completion: nil)
//
//        }
    }
}

extension MyReflectionsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myLesson.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.myReflectionTableView.dequeueReusableCell(withIdentifier: "MyReflectionsCell", for: indexPath)
        as! MyReflectionsTableViewCell
        
        let thisLesson = myLesson[indexPath.row]
        
        cell.titleLabel.text = thisLesson.name
        cell.descriptionTextView.text = thisLesson.detail
        cell.reactionImage.image = UIImage(named: thisLesson.reaction!)!
        
        return cell
    }
    
    
}
