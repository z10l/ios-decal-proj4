//
//  MainViewController.swift
//  iCard
//
//  Created by Carlos Caballero on 12/6/15.
//  Copyright © 2015 iosdecal. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var classicModeButton: UIButton!
    @IBOutlet weak var multipleChoiceButton: UIButton!
    var selectedCategoryIndex: NSIndexPath?
    var highlightColor = UIColor.lightGrayColor()
    var normalColor = UIColor.whiteColor()
    var data = Data()
    var gotCategories = false
    var currentQAPair = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
        data.getQuestionsByCategory(1)
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if (!gotCategories) {
            data.getCategories()
            gotCategories = true
        }
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Category", forIndexPath: indexPath) as! CategoryCollectionViewCell
        if indexPath == selectedCategoryIndex {
            cell.backgroundColor = highlightColor
        } else {
            cell.backgroundColor = normalColor
        }
        cell.nameLabel.text = data.categories[indexPath.row][0]
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if let oldIndex = selectedCategoryIndex {
            if let oldcell = collectionView.cellForItemAtIndexPath(oldIndex) {
                oldcell.backgroundColor = normalColor
                selectedCategoryIndex = nil
            }
        }
        
        if let cell = collectionView.cellForItemAtIndexPath(indexPath) {
            cell.backgroundColor = highlightColor
            selectedCategoryIndex = indexPath
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if selectedCategoryIndex == nil {
            let ac = UIAlertController(title: "Error", message: "Please select category.", preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(ac, animated: true, completion: nil)
            return false
        }
        let id = data.categories[selectedCategoryIndex!.row][1]
        currentQAPair = data.getQuestionsByCategory(Int(id)!)
        if identifier == "MultipleChoice" && currentQAPair.count < 4  {
            let ac = UIAlertController(title: "Bad Category", message: "Please select a category with more questions.", preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(ac, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if sender?.tag == 1 {
            let nextView = segue.destinationViewController as! MultipleChoiceViewController
            nextView.qaPairs = currentQAPair
        } else {
            let nextView = segue.destinationViewController as! ClassicViewController
            nextView.qaPairs = currentQAPair
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
