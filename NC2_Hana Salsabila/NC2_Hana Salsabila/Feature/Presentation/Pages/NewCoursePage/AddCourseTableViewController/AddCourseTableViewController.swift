//
//  AddCourseTableViewController.swift
//  NC2_Hana Salsabila
//
//  Created by Hana Salsabila on 28/07/22.
//

import UIKit
import CoreData

protocol AddCourseTableViewControllerDelegate: AnyObject {
  func logoutTapped()
    func updateCourseTitle(value: String)
    func updateCourseDesc(value: String)
    func updateCourseCategory(value: String)
}

class AddCourseTableViewController: UITableViewController {
    
    // this would be the parent view controller
    weak var delegate : AddCourseTableViewControllerDelegate?
    
    @IBOutlet weak var courseTextField: UITextField!
    @IBOutlet weak var descriptionTexField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var addCategoryCollectionView: UICollectionView!
    @IBOutlet weak var addCategoryTextField: UITextField!
    @IBOutlet var addLessonTableView: UITableView!
    
    @IBOutlet weak var addCategoryBtn: UIButton!
    
    var courseTitle = ""
    var courseDesc = ""
    var courseCategory = ""

    //Reference to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //Data for the table view
    var myCategories : [Categories]!
    
//    @IBOutlet weak var categorySection: UITableViewSection!
    
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
        
        let nibCell = UINib(nibName: "AddCategoryCollectionViewCell", bundle: nil)
        addCategoryCollectionView.register(nibCell, forCellWithReuseIdentifier: "AddCategoryCell")
        addCategoryBtn.layer.cornerRadius = 10
        
        fetchCategories()
    }
    
    func fetchCategories() {

        //Fetch the data from Core Data to display in the table view
        do {
            let request = Categories.fetchRequest() as NSFetchRequest<Categories>

            self.myCategories = try context.fetch(request)
            print(myCategories!)

            DispatchQueue.main.async {
                self.addCategoryCollectionView!.reloadData()
            }
        }
        catch {

        }

    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 2 {
            return 3
        } else {
            return 1
        }
            
    }
    
    func initAll() {
        if myCategories == nil {
            
            //Create a person object
            let defaultsCategory: [String] = ["Programming", "Design", "Others"]
            for category in defaultsCategory {
                let newCategories = Categories(context: self.context)
                newCategories.name = category
                //Save the data
                do {
                    try self.context.save()
                }
                catch {

                }
            }
            
            addCategoryTextField.text = ""
            //Re-fetch the data
            self.fetchCategories()
            
        }
    }
    
    
    @IBAction func addCategoryClicked(_ sender: UIButton) {
        
        let newCategory = Categories(context: self.context)
        newCategory.name = addCategoryTextField.text

        //Save the data
        do {
            try self.context.save()
        }
        catch {

        }
        addCategoryTextField.text = ""
        //Re-fetch the data
        self.fetchCategories()
        self.addCategoryCollectionView.reloadData()
        print("myCategories")
        print(myCategories)
        
    }
    
}

extension AddCourseTableViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == courseTextField {
            courseTitle = textField.text!
            self.delegate?.updateCourseTitle(value: courseTitle)
        } else if textField == descriptionTexField {
            courseDesc = textField.text!
            self.delegate?.updateCourseDesc(value: courseDesc)
        } else {
            courseCategory = textField.text!
            self.delegate?.updateCourseCategory(value: courseCategory)
        }
        return true
    }
}


extension AddCourseTableViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myCategories
            .count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = addCategoryCollectionView.dequeueReusableCell(withReuseIdentifier: "AddCategoryCell", for: indexPath)
        as! AddCategoryCollectionViewCell
        
        let thisCategory = myCategories![indexPath.row]
        
        cell.categoryLabel.text = thisCategory.name
        

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = addCategoryCollectionView.dequeueReusableCell(withReuseIdentifier: "AddCategoryCell", for: indexPath)
        as! AddCategoryCollectionViewCell
        
        let thisCategory = myCategories![indexPath.row]
        
        if cell.isSelected == true {
            categoryTextField.text = thisCategory.name
            cell.backgroundColor = .darkRed
            cell.categoryLabel.textColor = .white
        } else {
            categoryTextField.text = ""
            cell.backgroundColor = .gray
            cell.categoryLabel.textColor = .black
        }
        
        
    }


}
