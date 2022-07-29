//
//  HomeViewController.swift
//  NC2_Hana Salsabila
//
//  Created by Hana Salsabila on 20/07/22.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var courseCollectionView: UICollectionView!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    //Reference to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //Data for the collection view
    var myCategories : [Categories]!
    
    //Data for the collection view
    var myCourse : [Course]!
    var defaultsForCategories : Int!
    
    var searchedCourse = [Course]()
    var categoryCourse = [Course]()
    
    private var myCourseIndex : Int?
    
    var searchActive : Bool = false
    
    private var courseIndex : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkRed]
        
//        initAll()
        initSearchController()
        
        let nibCell = UINib(nibName: "CategoriesCollectionViewCell", bundle: nil)
        categoriesCollectionView.register(nibCell, forCellWithReuseIdentifier: "CategoriesCell")

        let nibCell2 = UINib(nibName: "CourseCollectionViewCell", bundle: nil)
        courseCollectionView.register(nibCell2, forCellWithReuseIdentifier: "CourseCell")
        
        //Get items from CoreData
        fetchCourse()
        fetchCategories()
        
        self.categoriesCollectionView.reloadData()
        self.courseCollectionView.reloadData()
//        self.categoriesCollectionView.reloadData()
//        self.courseCollectionView.reloadData()
        
    }
    
    func initAll() {
        //Save the data
//        if defaultsForCategories == 0 {
//            //Create a person object
//            let defaultsCategory: [String] = ["Programming", "Design", "Others"]
//            for category in defaultsCategory {
//                let newCategories = Categories(context: self.context)
//                newCategories.name = category
//                print("newCategories.name")
//                print(newCategories.name!)
//
//                //Save the data
//                do {
//                    try self.context.save()
//
//                }
//                catch {
//
//                }
//            }
//            print("myCategories")
//            print(myCategories)
//            defaultsForCategories += 1
//            self.categoriesCollectionView!.reloadData()
//        }
        
        let newCategories = [ "Programming", "Design", "Others"
        ]
        
        for noCategory in newCategories {

            let newCategory = Categories(context: self.context)
            newCategory.name = noCategory
            
            }
        do {
            try self.context.save()
        } catch  {
        
        }
        
        self.categoriesCollectionView.reloadData()
        
    }
    
    //MARK: SEARCH CONTROLLER
    func initSearchController()
    {
        searchBar.enablesReturnKeyAutomatically = false
        searchBar.returnKeyType = UIReturnKeyType.done
        definesPresentationContext = true
        searchBar.placeholder = "Search Your Task"

        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func initCatageories() {
        
        do {
            let request = Categories.fetchRequest() as NSFetchRequest<Categories>

            self.myCategories = try context.fetch(request)
            
            
            DispatchQueue.main.async {
                self.categoriesCollectionView!.reloadData()
            }
        }
        catch {

        }
        
    }
    
    func fetchCategories() {
        //Fetch the data from Core Data to display in the table view
        do {
            let request = Categories.fetchRequest() as NSFetchRequest<Categories>

            self.myCategories = try context.fetch(request)
            print("myCategories")
            print(myCategories!)

            DispatchQueue.main.async {
                self.categoriesCollectionView!.reloadData()
            }
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
                self.courseCollectionView.reloadData()
            }
        }
        catch {

        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchCategories()
        fetchCourse()
        self.categoriesCollectionView.reloadData()
        self.courseCollectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCourseDetailPage" {
            let navVC = segue.destination as! UINavigationController

            let destination = navVC.viewControllers.first as! CourseDetailViewController

            destination.getCourse = self.myCourse[myCourseIndex!]
//            print("")
//            print(destination.currentTask?.tags)
    //        destination.currentIndex = self.taskIndexEdit
        }
    }
    
    @IBAction func unwindFromAddLesson(sender: UIStoryboardSegue) {
//        if sender.source is AddLessonViewController {
//            if let senderVC = sender.source as? AddLessonViewController{
//                if segue.identifier = "unwindFromFilter"
//                {
//                    if senderVC.tagsChosen.isEmpty == false {
//                        filterButton.setImage(UIImage(systemName: "line.3.horizontal.decrease.circle.fill"), for: .normal)
//                        filterButton.tintColor = .darkBlue
//                    } else {
//                            filterButton.setImage(UIImage(systemName: "line.3.horizontal.decrease.circle"), for: .normal)
//                            filterButton.tintColor = .darkBlue
//                        }
//
//                        myIncomeArray = senderVC.tagsChosen
//
//                        if  (myIncomeArray.count == 1) {
//                            filterTagTask = taskContainer!.filter { $0.tags!.contains(where: { myIncomeArray.contains($0) }) }
//                            print("dari seg")
//                        } else if (myIncomeArray.count >= 1){
//                            filterTagTask = taskContainer!.filter { $0.tags! == myIncomeArray }
//                            print("dari seg1")
//                        } else if myIncomeArray.isEmpty == true {
//                            filterTagTask = taskContainer!
//                        }
//                        updateSearchResults(for: searchBar)
//
//                        self.categoriesCollectionView.reloadData()
//                        self.courseCollectionView.reloadData()
//                    }
//            }
    }
    
    @IBAction func addClicked(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toAddCoursePage", sender: self)
        
        
//        //Create alert
//        let alert = UIAlertController(title: "Add Person", message: "What is their name?", preferredStyle: .alert)
//        alert.addTextField()
//
//        //Configure button handler
//        let submitButton = UIAlertAction(title: "Add", style: .default)  { (action) in
//
//            //Get the textfield for the alert
//            let textfield = alert.textFields![0]
//
//            //Create a person object
//            let newCategories = Categories(context: self.context)
//            newCategories.name = textfield.text
//
////            let newCourse = Course(context: self.context)
////            newCourse.name = textfield.text
////            newPerson.age = 20
////            newPerson.gender = "Male"
//
//            //Save the data
//            do {
//                try self.context.save()
//            }
//            catch {
//
//            }
//
//            //Re-fetch thE data
//            self.fetchCategories()
//            self.fetchCourse()
//
//
//        }
//
//        //Add button
//        alert.addAction(submitButton)
//
//        //Show alert
//        self.present(alert, animated: true, completion: nil)
        
    }
    
    func updateSearchResults(for searchBar: UISearchBar) {
        let searchBar = searchBar
//        let scopeButton = .titleForSegment(at: segmentedControl.selectedSegmentIndex)
        let searchText = searchBar.text
        
//        if (myIncomeArray.isEmpty) {
//            filteredWithSegmentedControl(searchText: searchText!, scopeButton: scopeButton!)
//        } else {
//            filteredWithSegmentedControlAndTags(searchText: searchText!, scopeButton: scopeButton!)
//        }
    }
    
//    func filteredWithCategories(searchText: String, scopeButton: String)
//    {
//        print(myIncomeArray)
//        if scopeButton.lowercased() == "completed" {
//            print(scopeButton.lowercased())
//            segmentedControlTask = taskContainer!.filter { $0.status == true }
//            filteredTask = segmentedControlTask
//        } else if (scopeButton.lowercased() == "uncomplete"){
//            segmentedControlTask = taskContainer!.filter { $0.status == false }
//            filteredTask = segmentedControlTask
//        }
//        print(scopeButton.lowercased())
//        print("dari segmented button")
//        print(filteredTask)
//        taskTableView.reloadData()
//    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoriesCollectionView {
            return self.myCategories.count
        } else {
//            return self.searchedCourse.count
            return self.myCourse.count
            
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.categoriesCollectionView {
            let categoriesCell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCell", for: indexPath)
            as! CategoriesCollectionViewCell
        
            let thisCategory = myCategories[indexPath.row]
        
            categoriesCell.categoryLabel?.text = thisCategory.name
        
//            categoriesCell.categoryLabel.sizeToFit()
//            categoriesCell.layer.cornerRadius = 10
//            categoriesCell.categoryLabel.backgroundColor = .darkBlue
//           categoriesCell.categoryLabel
//           cell.categoryLabel
            return categoriesCell
            
        } else {
            let courseCell = courseCollectionView.dequeueReusableCell(withReuseIdentifier: "CourseCell", for: indexPath)
            as! CourseCollectionViewCell
            
//            let thisCategory = searchedCourse[indexPath.row]
            let thisCourse = myCourse[indexPath.row]
            
            courseCell.layer.cornerRadius = 10
        
//        courseCell.courseImage.image = UIImage(named: course.image)
            courseCell.titleLabel.text = thisCourse.name
//        courseCell.progressView.progress = course.progressBar
//        courseCell.countCourseLabel.text = course.count + " Courses"
            
            return courseCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        if collectionView == self.categoriesCollectionView {
            let categoriesCell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCell", for: indexPath)
            as! CategoriesCollectionViewCell
            
            categoryCourse = myCourse.filter { $0.category!.contains(myCategories![indexPath.row].name!) } //= self.myCategories![indexPath.row].lowercased() }
            
            self.courseCollectionView.reloadData()
            
        } else if collectionView == self.courseCollectionView {
            
            self.myCourseIndex = indexPath.row
            
            self.performSegue(withIdentifier: "toCourseDetailPage", sender: myCourseIndex)
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if collectionView == self.categoriesCollectionView {
//            let categoriesCell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCell", for: indexPath)
//            as! CategoriesCollectionViewCell
//
//            let courseCell = courseCollectionView.dequeueReusableCell(withReuseIdentifier: "CourseCell", for: indexPath)
//            as! CourseCollectionViewCell
//
//            categoryCourse = myCourse.filter { $0.name == categoriesCell.categoryLabel}
//
//            return categoriesCell
//        } else {
//
//        }
//    }
    
}

extension HomeViewController: UISearchControllerDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            searchedCourse = categoryCourse.filter { $0.name!.contains(searchText) }
            searchActive = true
//            filteredTask = searchedCourse
            self.courseCollectionView.reloadData()
        } else {
            searchedCourse = categoryCourse
            searchActive = false
            self.courseCollectionView.reloadData()
        }
    }
}

//    func seedCategories() {
//        let newCategories = [ "Assignment", "Task", "Exam", "Project"
//        ]
//
//        for noCategory in newCategories {
//
//            let newCategory = Categories(context: self.context)
//            newCategory.name = noCategory
//
//        }
//        do {
//            try self.context.save()
//        } catch  {
//
//        }
//
//        self.categoriesCollectionView.reloadData()
//
//    }
