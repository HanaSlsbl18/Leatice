//
//  CourseViewController.swift
//  NC2_Hana Salsabila
//
//  Created by Hana Salsabila on 25/07/22.
//

import UIKit
import CoreData

class CourseDetailViewController: UIViewController {
    
    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var myReflectionBtn: UIButton!
    @IBOutlet weak var lessonTableView: UITableView!
    
    @IBOutlet weak var courseView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    //Reference to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //Data for the course detail
    var myCourse : [Course]!
    
    //Data for the table view
    var myLesson : [Lesson]!
    
    var getCourse : Course!
    
    var getCourseIndex : Int?
    var myLessonIndex : Int?
    
    private var courseIndex : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupAll()
        
//        courseImage.image = UIImage(named: myCourse[courseIndex!].image!)
//        courseLabel.text = myCourse[courseIndex!].name
//        categoryLabel.text = myCourse[courseIndex!].category
//        countLabel.text = myLesson.count + " Courses"
//        progressBar.progress = myLesson(myLesson.count) //jumlah yang complete dibagi jumlah total
        
//        descriptionTextView.text = myCourse[courseIndex!].detail
        
        let nibCell = UINib(nibName: "LessonTableViewCell", bundle: nil)
        lessonTableView.register(nibCell, forCellReuseIdentifier: "LessonCell")
        
//        myReflectionBtn.backgroundColor = .darkBlue
        myReflectionBtn.layer.cornerRadius = 10
//        myReflectionBtn.titleLabel?.textColor = .white
        
        
        //Get items from CoreData
        fetchCourse()
        fetchLesson()
        
        print("getCourseIndex")
        print(getCourseIndex)
        
    }
    
    func setupAll() {
        courseView.layer.cornerRadius = 10
        
        backgroundView.layer.cornerRadius = 20
        backgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//        backgroundView.layer.backgroundColor = CGColor.blue2
        descriptionTextView.layer.cornerRadius = 10
        
    }
    
    func initAll() {
        
//        let thisLesson = myLesson[lessonIndex2!]
        let thisCourse = myCourse[getCourseIndex!]
        
        courseLabel.text = thisCourse.name
        categoryLabel.text = thisCourse.category
        countLabel.text = "\(myCourse.count) Course"
        
    }
    
//    @IBAction func toCourseDetailPage(sender: UIStoryboardSegue) {
//        if sender.source is HomeViewController {
//            if let senderVC = sender.source as? HomeViewController {
////        if segue.identifier = "unwindFromFrilter" {
//
//                getCourseIndex = senderVC.myCourseIndex
//                print("getCourseIndex")
//                print(getCourseIndex!)
//
//                let thisCourse = myCourse[getCourseIndex!]
//
//                courseLabel.text = thisCourse.name
//                categoryLabel.text = thisCourse.category
//                countLabel.text = "\(myCourse.count) Course"
//
//
//
//
//                self.lessonTableView.reloadData()
//            }
//        }
//    }
    
    func updateCourse() {
        let course = getCourse
        
        countLabel.text = getCourse.name
        categoryLabel.text = getCourse.category
//        countLabel.text =
        descriptionTextView.text = getCourse.detail
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
    
    func fetchLesson() {

        //Fetch the data from Core Data to display in the table view
        do {
            let request = Lesson.fetchRequest() as NSFetchRequest<Lesson>

            self.myLesson = try context.fetch(request)

            DispatchQueue.main.async {
                self.lessonTableView.reloadData()
            }
        }
        catch {

        }
    }
    
    func refreshTable() {
        DispatchQueue.main.async {
            self.lessonTableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toLessonDetailPage" {
//            let navVC = segue.destination as! UINavigationController
//            let destination = navVC.viewControllers.first as! LessonDetailViewController
            
            if let destination = segue.destination as? LessonDetailTableViewController {
                
                destination.getLessonIndex = self.myLessonIndex
            }
            else if let destination = segue.destination as? LessonDetailViewController {
                
                destination.lessonIndex2 = self.myLessonIndex
            }
        }
    }

    @IBAction func myReflectionBtnClicked(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toMyReflectionsPage", sender: self)
        
    }
    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
//
extension CourseDetailViewController: UITabBarDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myLesson.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = lessonTableView.dequeueReusableCell(withIdentifier: "LessonCell", for: indexPath)
        as! LessonTableViewCell

        let thisLesson = myLesson[indexPath.row]

        let thisCourse = myCourse[indexPath.row]

        cell.lessonLabel.text = thisLesson.name
        cell.courseLabel.text = thisCourse.name
        cell.categoryLabel.text = thisCourse.category

        return cell
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.myLessonIndex = indexPath.row
        
        self.performSegue(withIdentifier: "toLessonDetailPage ", sender: myLessonIndex)

    }
}
