//
//  ReflectionViewController.swift
//  NC2_Hana Salsabila
//
//  Created by Hana Salsabila on 25/07/22.
//

import UIKit

class ReflectionViewController: UIViewController {
    
    @IBOutlet weak var reflectionTextView: UITextView!
    @IBOutlet weak var reactionCollectionView: UICollectionView!
    @IBOutlet weak var reactionImage: UIImageView!
    
    //Reference to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var myReactionImage: [String] = ["emoji1", "emoji2"]
    
    var myReaction : [UIImage?] = [UIImage(named: "emoji1"),UIImage(named: "emoji1")]
    
    var reactionIndex : Int?
    
    //Data for the collection view
    var myLesson : [Lesson]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let nibCell = UINib(nibName: "ReactionCollectionViewCell", bundle: nil)
        reactionCollectionView.register(nibCell, forCellWithReuseIdentifier: "ReactionCell")
        
    }
    
    
    
    @IBAction func doneClicked(_ sender: UIBarButtonItem) {
        if reflectionTextView.text != "" {
            let toCourse = Lesson(context: self.context)
            toCourse.detail = reflectionTextView.text
//            toCourse.reaction = reactionImage[reactionIndex]
            
            
            //Save the data
            do {
                try self.context.save()
            }
            catch {
            
            }
        } else {
            //Create alert
            let alert = UIAlertController(title: "You have a empty text", message: "Please fill it first to continue to the next page", preferredStyle: .alert)
    
            //Configure button handler
            let closeButton = UIAlertAction(title: "Close", style: .default)
    
            //Add button
            alert.addAction(closeButton)
            
            //Show alert
            self.present(alert, animated: true, completion: nil)

        }
    }
}

extension ReflectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myReaction.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = reactionCollectionView.dequeueReusableCell(withReuseIdentifier: "ReactionCell", for: indexPath)
        as! ReactionCollectionViewCell
        
        cell.image.image = UIImage(named: myReactionImage[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.reactionIndex = indexPath.row
        
        reactionImage.image = UIImage(named: myReactionImage[indexPath.row])
        
        //Create a person object
        let newLesson = Lesson(context: self.context)
        newLesson.reaction = myReactionImage[indexPath.row]
        
//        //Save the data
//        do {
//            try self.context.save()
//        }
//        catch {
//
//        }
//        print("newLesson.reaction")
//        print(newLesson.reaction)
//        print(newLesson)
        
        
    }
    
    
}
