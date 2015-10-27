//
//  ViewController.swift
//  swiftDemo-chooseFlag
//
//  Created by 黄少华 on 15/10/27.
//  Copyright © 2015年 黄少华. All rights reserved.
//
import GameKit
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn1: UIButton!
    
    @IBOutlet weak var btn2: UIButton!
    
    @IBOutlet weak var btn3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var sorce = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        btn1.layer.borderWidth = 2
        btn1.layer.borderColor = UIColor.orangeColor().CGColor
        btn2.layer.borderWidth = 2
        btn2.layer.borderColor = UIColor.orangeColor().CGColor
        btn3.layer.borderWidth = 2
        btn3.layer.borderColor = UIColor.orangeColor().CGColor
        
        askQuestion(nil)
        
    }
    
    func askQuestion(action:UIAlertAction!){
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]
        btn1.setImage(UIImage(named: countries[0]), forState:.Normal)
        btn2.setImage(UIImage(named: countries[1]), forState: .Normal)
        btn3.setImage(UIImage(named: countries[2]), forState: .Normal)
        
        correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
        title = "\(countries[correctAnswer].uppercaseString) flag is"
    }
    
    
    @IBAction func btnClick(sender: UIButton) {
        
        var title :String
        
        if sender.tag == correctAnswer{
            title = "Correct"
            ++sorce
        }else{
            title = "Wrong"
            --sorce
        }
        
        let alertController = UIAlertController(title: title, message: "Your Sorce is \(sorce)", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion))
        
        presentViewController(alertController, animated: true) { () -> Void in
            print("complete")
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

