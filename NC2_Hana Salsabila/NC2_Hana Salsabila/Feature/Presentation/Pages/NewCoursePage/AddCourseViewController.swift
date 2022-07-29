//
//  AddCourseViewController.swift
//  NC2_Hana Salsabila
//
//  Created by Hana Salsabila on 21/07/22.
//

import UIKit
import CoreData

class AddCourseViewController: UIViewController, AddCourseTableViewControllerDelegate {
    
    @IBOutlet weak var courseImage: UIImageView!

    @IBOutlet weak var imageBtn: UIButton!
    
    @IBOutlet weak var courseView: UIView!
    
    //Reference to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //Data for the course detail
    var myCourse : [Course]!
    var courseTitle = ""
    var courseDesc = ""
    var courseCategory = ""
    
    //Data for the table view
    var myCategories : [Categories]!
    
    var tableViewController : AddCourseTableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initAll()
        
        // .children is a list of container view controller of the parent view controller
                // since you only have one container view,
                // safe to grab the first one ([0]), and cast it to table VC class
        tableViewController = self.children[0] as? AddCourseTableViewController
        tableViewController?.delegate = self
        
//        fetchCategories()
        fetchCourse()
    }
    
    func initAll() {
        
        courseView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        courseView.layer.cornerRadius = 20
        
    }
    
//    func relationshipDemo() {
//        
//        //Create a family
//        let toCourse = Family(context: context)
//        family.name = "Abe Family"
//        
//        //Create a person
//        let person = Person(context: context)
//        person.name = "Maggie"
////        person.family
//        
//        //Add person to family
//        family.addToPeople(person)
//        
//        //Save context
//        try! context.save()
//        
//    }
    
//    public func reloadCollection() {
//        categoriesCollectionView!.reloadData()
//    }
    
    func fetchCategories() {

        //Fetch the data from Core Data to display in the table view
        do {
            let request = Categories.fetchRequest() as NSFetchRequest<Categories>

            self.myCategories = try context.fetch(request)
            print(myCategories!)

//            DispatchQueue.main.async {
//                self.categoriesCollectionView!.reloadData()
//            }
        }
        catch {

        }

    }
    
    func fetchCourse() {

        //Fetch the data from Core Data to display in the table view
        do {
            let request = Course.fetchRequest() as NSFetchRequest<Course>

            self.myCourse = try context.fetch(request)

            DispatchQueue.main.async {
                
            }
        }
        catch {

        }
    }
    
    @IBAction func nextClicked(_ sender: UIButton) {
        
        if courseTitle != "" {
            //Create a person object
            let newCourse = Course(context: self.context)
            newCourse.name = courseTitle
            newCourse.detail = courseDesc
            newCourse.category = courseCategory

            //Save the data
            do {
                try self.context.save()
            }
            catch {

            }

            //Re-fetch the data
            self.fetchCourse()
            self.fetchCategories()
            
            performSegue(withIdentifier: "toAddLessonPage", sender: self)
            
        } else {
            
            //Create alert
            let alert = UIAlertController(title: "You have empty text field", message: "Please fill it first to continue to the next page", preferredStyle: .alert)

            //Configure button handler
            let closeButton = UIAlertAction(title: "Close", style: .default)

            //Add button
            alert.addAction(closeButton)

            //Show alert
            self.present(alert, animated: true, completion: nil)

        }
    }
    
    @IBAction func cancelBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
        
    func updateCourseTitle(value: String) {
        print("title course: \(value)")
        courseTitle = value
    }
    
    func updateCourseDesc(value: String) {
        print("desc course: \(value)")
        courseDesc = value
    }
    
    func updateCourseCategory(value: String) {
        print("category course: \(value)")
        courseCategory = value
    }
        
    func logoutTapped() {
        print("logout tapped")
    }
    
}
