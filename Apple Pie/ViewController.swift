//
//  ViewController.swift
//  Apple Pie
//
//  Created by Philippe Legault on 2018-05-25.
//  Copyright © 2018 Philippe Legault. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var listOfWords = ["dog", "cat", "hamburger", "elephant", "carrot"]
    
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

