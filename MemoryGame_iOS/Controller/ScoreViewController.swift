//
//  ScoreViewController.swift
//  MemoryGame_iOS
//
//  Created by Sriteja Chilakamarri on 18/07/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {

    
    @IBOutlet var score: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Score.shared.loadDetails()
        
        self.navigationItem.hidesBackButton = true
        
        score.text = "\(Score.shared.score!)"
        
        print(Score.shared.number!)
        
        //score =  Score.shared.
    }

    @IBAction func quitGame(_ sender: Any) {
        
        exit(0)
    }
    
}
