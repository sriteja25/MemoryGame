//
//  ViewController.swift
//  MemoryGame_iOS
//
//  Created by Sriteja Chilakamarri on 15/07/17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet var topLabel: UILabel!
    @IBOutlet var bottomLabel: UILabel!
    
    @IBOutlet var timer: UILabel!
    
    var bottomColor:String?
    var topString:String?
    var a:Int = 0
    var score:Int = 0
    var totGames:Int = 0
    var countDown = 25
    
    var gameNumber:Int?
    
    var colorDict:[String:Any] = ["RED":UIColor.red,"YELLOW":UIColor.yellow,"BLACK":UIColor.black,"BROWN":UIColor.brown]
    
    var labelArray = ["RED","YELLOW","BLACK","BROWN"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        var timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.update), userInfo: nil, repeats: true)
        Score.shared.loadDetails()
        
        gameNumber = Score.shared.number
        
        if(gameNumber == nil){
            
            gameNumber = 1
        }else{
            
            gameNumber = gameNumber! + 1
            
        }
        
        Score.shared.save()
        
        //Score.shared.loadDetails()
        
        //correctMsg.text = "Choose Right or wrong"
        //correctImage.image = UIImage(named: "CorrectOrWrong")
        randomLabels()
       
    }
    
    
    
    func randomLabels(){
        let random = Int(arc4random_uniform(4))
        let randomColor = Int(arc4random_uniform(4))
        let rndColor = Int(arc4random_uniform(4))
        let rnd = Int(arc4random_uniform(4))
        topLabel.text = labelArray[random]
        bottomLabel.text = labelArray[rnd]
        bottomLabel.textColor = colorDict[labelArray[rndColor]] as! UIColor
        topLabel.textColor = colorDict[labelArray[randomColor]] as! UIColor
        topString = topLabel.text
        let checkColor = bottomLabel.textColor as! UIColor
        if(checkColor == UIColor.red){
            bottomColor = "RED"
        }else if(checkColor == UIColor.yellow){
            bottomColor = "YELLOW"
        }else if(checkColor == UIColor.black){
            bottomColor = "BLACK"
        }else{
            bottomColor = "BROWN"
        }
    }

    @IBAction func Yes(_ sender: Any) {
         checkCOrrectOrWrong()
        if(a == 1){
            //Answer is right
            score = score + 1
            totGames = totGames + 1
            addTime()
            randomLabels()
            
        }else{
            //Answer is wrong
            totGames = totGames + 1
            deleteTime()
            randomLabels()
        }
    }
    
    @IBAction func No(_ sender: Any) {
        
        checkCOrrectOrWrong()
        
        if( a == 2){
            //Answer is right
            score = score + 1
            totGames = totGames + 1
            addTime()
            randomLabels()
            
        }else{
            //Answer is wrong.
            totGames = totGames + 1
            deleteTime()
            randomLabels()
            
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
        if(countDown > 0 && countDown < 100) {
            countDown = countDown - 1
            timer.text = "\(countDown)"
            print(countDown)
        }
        if(countDown == 0 || countDown > 101){
            
            if(countDown > 101){
                
                let alert = UIAlertController(title: "Great Game", message: "You have mastered the game, goog going.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
            sleep(1)
            scoreView()
            countDown = 101
        }
        if((countDown < 0 )){
            
            countDown = 0
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
    
    func scoreView(){
        
        
        if(gameNumber! > 1){
            
            gameNumber = gameNumber! + 1
        }
        
        Score.shared.score = score
        Score.shared.number = gameNumber
        Score.shared.save()
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Score") as! ScoreViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    
    
    
}

