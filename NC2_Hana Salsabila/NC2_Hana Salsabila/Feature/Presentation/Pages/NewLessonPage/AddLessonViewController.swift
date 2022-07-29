//
//  AddLessonViewController.swift
//  NC2_Hana Salsabila
//
//  Created by Hana Salsabila on 26/07/22.
//

import UIKit
import CoreData

class AddLessonViewController: UIViewController, AddLessonTableViewControllerDelegate {

    @IBOutlet weak var lessonTableView: UITableView!
    @IBOutlet weak var lessonInLessonTableView: UITableView!
    
    @IBOutlet weak var addLessonBtn: UIButton!
    
    //Reference to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //Data for the table view
    var myLesson: [Lesson]!
    var lessonTitle = ""
    var lessonResource = ""
    var lessonDocumentation = ""
    
    var countCell = 0
    
    var tableViewController : AddLessonTableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableViewController = self.children[0] as? AddLessonTableViewController
        tableViewController?.delegate = self
        
        addLessonBtn.layer.cornerRadius = 10
        
        
        fetchLesson()
    }
    
    func fetchLesson() {

        //Fetch the data from Core Data to display in the table view
        do {
            let request = Lesson.fetchRequest() as NSFetchRequest<Lesson>

            self.myLesson = try context.fetch(request)

            DispatchQueue.main.async {
                
            }
        }
        catch {

        }
    }
    
//    func relationshipDemo() {
//
//        //Create a family
//        let course = Course(context: context)
//        course.name = "Abe Family"
//
//        //Create a person
//        let lesson = Lesson(context: context)
//        lesson.name = "Maggie"
////        person.family
//
//        //Add person to family
//        course.addToLesson(lesson)
//        //Save context
//        try! context.save()
//
//    }
    
//    public func reloadCollection() {
//        taskCollectionView!.reloadData()
//    }

    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneBtn(_ sender: UIButton) {
//        if lessonTitle == "" {
//
//            //Create alert
//            let alert = UIAlertController(title: "You have empty text field", message: "Please fill it first to continue to the next page", preferredStyle: .alert)
//
//            //Configure button handler
//            let closeButton = UIAlertAction(title: "Close", style: .default)
//
//            //Add button
//            alert.addAction(closeButton)
//
//            //Show alert
//            self.present(alert, animated: true, completion: nil)
            
//        } else
        if lessonTitle != "" && lessonResource != "" && lessonDocumentation != "" {
            
            //Create a person object
            let newLesson = Lesson(context: self.context)
            newLesson.name = lessonTitle
            newLesson.source = lessonResource
            newLesson.doc = lessonDocumentation

            //Save the data
            do {
                try self.context.save()
            }
            catch {

            }

            //Re-fetch the data
            self.fetchLesson()
            
            performSegue(withIdentifier: "unwindFromAddLesson", sender: self)

        }
        
    }
    
    func updateLessonTitle(value: String) {
        print("title course: \(value)")
        lessonTitle = value
    }
    
    func updateLessonResource(value: String) {
        print("desc course: \(value)")
        lessonResource = value
    }
    
    func updateLessonDocumentation(value: String) {
        print("category course: \(value)")
        lessonDocumentation = value
    }
        
    func logoutTapped() {
        print("logout tapped")
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "unwindFromAddLesson" {
//            let navVC = segue.destination as! UINavigationController
//
//            let destination = navVC.viewControllers.first as! HomeViewController
//
////            destination.myIncomeArray = self.tagsChosen
//
//        }
//    }
}

//override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    if segue.identifier == "unwindFromAddLesson" {
//        let navVC = segue.destination as! UINavigationController
//
//        let destination = navVC.viewControllers.first as! HomeViewController
//
//        destination.myIncomeArray = self.tagsChosen
////        filteredTag = tagsChosen
//        print("send array")
//        print(filteredTag)
//
//        if tagsChosen.isEmpty == false {
//            destination.filterButton.setImage(UIImage(systemName: "line.3.horizontal.decrease.circle.fill"), for: .normal)
//        } else {
//            destination.filterButton.setImage(UIImage(systemName: "line.3.horizontal.decrease.circle"), for: .normal)
//        }
//    }
//}
