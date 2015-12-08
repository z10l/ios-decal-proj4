//
//  ClassicViewController.swift
//  iCard
//
//  Created by 李子腾 on 12/7/15.
//  Copyright © 2015 iosdecal. All rights reserved.
//

import UIKit

class ClassicViewController: UIViewController {

    @IBOutlet var bigButton: UIButton!

    @IBOutlet var label: UILabel!
    var qaPairs = [[String]]()
    var count = 0
    var onQuestion = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        bigButton.addTarget(self, action: "next:", forControlEvents: .TouchUpInside)
//        updateViews()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func next(sender:UIButton!) {
        count += 1
        onQuestion = !onQuestion
        updateViews()
    }
    
    func updateViews() {
        if count >= qaPairs.count {
            return
        }
        var qaPair = qaPairs[count]
        if onQuestion {
            label.text = "Question: " + qaPair[0]
        } else {
            label.text = "Answer: " + qaPair[1]
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
