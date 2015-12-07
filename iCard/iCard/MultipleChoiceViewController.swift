//
//  MultipleChoiceViewController.swift
//  iCard
//
//  Created by Carlos Caballero on 12/6/15.
//  Copyright © 2015 iosdecal. All rights reserved.
//

import GameKit
import UIKit

class MultipleChoiceViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var dButton: UIButton!
    var data: [String]?
    var correctAnswer = 0
    var score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        askQuestion(nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func buttonTapped(sender: UIButton) {
        if sender.tag  == correctAnswer {
            title = "Correct"
            score++
        } else {
            title = "Wrong"
            score--
        }
        let ac = UIAlertController(title: title, message: "Score: \(score)", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "Next", style: .Default, handler: askQuestion))
        presentViewController(ac, animated: true, completion: nil)
    }
    
    func askQuestion(action: UIAlertAction!) {
        data = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(data!) as? [String]
        aButton.setTitle("a) \(data![0])", forState: .Normal)
        bButton.setTitle("b) \(data![1])", forState: .Normal)
        cButton.setTitle("c) \(data![2])", forState: .Normal)
        dButton.setTitle("d) \(data![3])", forState: .Normal)
        correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(4)
        // questionLabel.text = questions[correctAnser]
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
