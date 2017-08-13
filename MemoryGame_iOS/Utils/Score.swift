//
//  LoggedIn.swift
//  foodMatching
//
//  Created by Sriteja Chilakamarri on 27/06/17.
//  Copyright © 2017 Sriteja Chilakamarri. All rights reserved.
//

import Foundation
class Score:NSObject{
    
    static let shared = Score()
    
    let kScore = "SCORE"
    let kNumber = "NUMBER"
    
    var score:Int?
    var number:Int?
    func loadDetails(){
        print("Loading...")
        score = getUserDefault(kScore) as? Int
        number = getUserDefault(kNumber) as? Int
    }
    func save(){
        
        if let score = self.score{
            setUserDefault(score, key: kScore)
        }
        if let number = self.number{
            setUserDefault(number, key: kNumber)
        }else{
            setUserDefault(1, key: kNumber)
            
        }
        
    }
    public func setUserDefault(_ value:Any,key:String){
        UserDefaults.standard.set(value, forKey: key)
    }
    public func getUserDefault(_ key:String) -> Any?{
        return UserDefaults.standard.value(forKey: key)
    }
    
}

