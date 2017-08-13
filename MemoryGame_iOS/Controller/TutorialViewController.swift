//
//  ViewController.swift
//  MemoryGame_iOS
//
//  Created by Sriteja Chilakamarri on 15/07/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {
    
    @IBOutlet var topLabel: UILabel!
    @IBOutlet var bottomLabel: UILabel!
    
    @IBOutlet var timer: UILabel!
    
    @IBOutlet var yesButton: UIButton!
    @IBOutlet var noButton: UIButton!
    
    let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
 
    var bottomColor:String?
    var topString:String?
    var a:Int = 0
    var score:Int = 0
    var totGames:Int = 0
    var countDown = 25
    
    var isAlertViewShowing:Bool = false
    
    var colorDict:[String:Any] = ["RED":UIColor.red,"YELLOW":UIColor.yellow,"BLACK":UIColor.black,"BROWN":UIColor.brown]
    
    var labelArray = ["RED","YELLOW","BLACK","BROWN"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        topLabel.text = "RED"
        bottomLabel.text = "YELLOW"
        bottomLabel.textColor = UIColor.red
        topLabel.textColor = UIColor.black
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.update), userInfo: nil, repeats: true)
        
        
        correctChoice()

    }
    
    func correctChoice(){
        
        //sleep(1)
        topLabel.text = "RED"
        bottomLabel.text = "YELLOW"
        bottomLabel.textColor = UIColor.red
        topLabel.textColor = UIColor.black
        
        topString = "RED"
        bottomColor = "RED"
        sleep(3)
        alertView(title:"Step 1", message:"Check the text in Box 1 and the text colour in the Box 2. As they both match, Yes is the right option.",button: noButton)
        
        
        checkCOrrectOrWrong()
    
    
    }
    
    func wrongChoice(){
        
        
        noButton.isHidden = false
        topLabel.text = "BLACK"
        bottomLabel.text = "YELLOW"
        bottomLabel.textColor = UIColor.black
        topLabel.textColor = UIColor.black
        
        topString = "BLACK"
        bottomColor = "BLACK"
        sleep(3)
        alertView(title:"Step 3", message:"Lets see what happens when we choose wrong option. Here the text in first box and text colour in the second box are same strings. But if we choose no",button: yesButton)
        //noButton.isHidden = false
        yesButton.isHidden = true
        checkCOrrectOrWrong()
        
    }
    
    
    
    
    
    @IBAction func Yes(_ sender: Any) {
        
        if( a == 1){
        
            score = score + 1
            totGames = totGames + 1
            addTime()
            alertView(title:"Step 2", message:"Check the text in Box 1 and the text colour in the Box 2. As they both match, Yes is the right option. 2 seconds is added to our timer.",button: btn)
            wrongChoice()
            
        }else{
            
            totGames = totGames + 1
            deleteTime()
            alertView(title:"Step 4", message:"Check the text in Box 1 and the text colour in the Box 2. As they both match, so our option is wrong. 5 seconds is removed from our timer.",button: btn)
        
        }
        
        
    }
    
    @IBAction func No(_ sender: Any) {
        
        if( a == 2){
            
            score = score + 1
            totGames = totGames + 1
            addTime()
            alertView(title:"Step 2", message:"Check the text in Box 1 and the text colour in the Box 2. As they both match, Yes is the right option. 3 seconds is added to our timer.",button: btn)
            wrongChoice()
            
        }else{
            
            totGames = totGames + 1
            deleteTime()
            alertView(title:"Step 4", message:"Check the text in Box 1 and the text colour in the Box 2. As they both match, so our option is wrong. 5 seconds is removed from our timer.",button: btn)
            
        }
        
        
    }
    
    func checkCOrrectOrWrong(){
        
        if(topString! == bottomColor!){
            
            a = 1
        }else{
            
            a = 2
            
        }
        
        
    }
    
    func update() {
        
        if(isAlertViewShowing == false){
            
            if(countDown > 0) {
                countDown = countDown - 1
                timer.text = "\(countDown)"
                print(countDown)
            }
        
        }else{
        
            
        }
        
    }
    
    func addTime(){
        
        countDown = countDown + 2
        update()
        
    }
    
    func deleteTime(){
        
        countDown = countDown - 5
        update()
        
    }
    
    func alertView(title:String, message:String,button:UIButton){
    
        
        isAlertViewShowing = true
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { (action) in
            button.isHidden = true
            //sleep(1)
            self.isAlertViewShowing = false
        }))
        self.present(alert, animated: true, completion: nil)
        
    
    }
    
    
    
    
}

