//
//  RulesViewController.swift
//  MemoryGame_iOS
//
//  Created by Sriteja Chilakamarri on 17/07/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class RulesViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

  
    @IBAction func playGameTapped(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Game") as! GameViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

    
    @IBAction func tutorialTapped(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Tutorial") as! TutorialViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
