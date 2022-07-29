//
//  LessonDetailViewController.swift
//  NC2_Hana Salsabila
//
//  Created by Hana Salsabila on 27/07/22.
//

import UIKit
import CoreData

class LessonDetailViewController: UIViewController {
    
    @IBOutlet weak var lessonLabel: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var doneBtn: UIButton!
    
    //Reference to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //Data for the table view
    var myCourse : [Course]!
    var myLesson : [Lesson]!
    
    var getLessonIndex : Int?
    var lessonIndex2 : Int?
    var courseIndex2 : Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCourse()
        initAll()

        // Do any additional setup after loading the view.
    }
    
    func initAll() {
        
        let thisLesson = myLesson[lessonIndex2!]
        let thisCourse = myCourse[courseIndex2!]
        
        lessonLabel.text = thisLesson.name
        courseLabel.text = thisCourse.name
        categoryLabel.text = thisCourse.category
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        fetchCourse()
        
    }
    

    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func doneClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "toReflectionPage", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
