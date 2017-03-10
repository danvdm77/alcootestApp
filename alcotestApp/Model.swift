//
//  Model.swift
//  alcotestApp
//
//  Created by etudiant02 on 07/03/2017.
//  Copyright © 2017 etudiant02. All rights reserved.
//

import Foundation

// Paramètres pour toute l'application
let maxAlcooholRate = 0.8 // taux max d'alcool autorisé
let firstAlcooholRate = 0.5 // taux à partir duquel la jauge devient orange

struct Drink {
    var name: String
    let alcooholRate: Double
    let glassSize: Double
}

enum Gender: Int {
    case man = 0
    case woman = 1
}

class User {
    var weight: Int
    var weUnit: String
//    var weUnit_bk: String
    var nbOfGlasses = [Int]()
    var gender: Gender
    
    /* init simple, remplacé par un constructeur qui tient compte du stockage
     init (gender : Gender, weight : Int, numberOfDrinks: Int) {
     self.weight = weight
     self.gender = gender
     }
     */
    
    init() {
        // si une valeur a été stockée dans les UserDefaults, on prend celle là plutôt que celle fournie dans le constructeur
        
        let myWeight = UserDefaults.standard.integer(forKey: "weight")
        if  myWeight != 0 {
            self.weight = myWeight
        } else {
            self.weight = 70
        }
        
        let myWeUnit = UserDefaults.standard.string(forKey: "weUnit")
        if  myWeUnit != "" {
            self.weUnit = myWeUnit!
        } else {
            self.weUnit = "Kg"
        }

//        let myWeUnit_bk = UserDefaults.standard.string(forKey: "weUnit_bk")
//        if  myWeUnit_bk != "" {
//            self.weUnit_bk = myWeUnit_bk!
//        } else {
//            self.weUnit_bk = "Kg"
//        }

        let myGender = UserDefaults.standard.integer(forKey: "gender")
        if  (myGender == 0 || myGender == 1) {
            self.gender = Gender(rawValue: myGender)!
        } else {
            self.gender = .man
        }
    }
    
    // Calcul du taux d'alcoolemie
    func computeAlcooholRate (drinks: [Drink]) -> Double {
        var output = 0.0
        
        let ratio = (self.gender == .man ? 0.7 : 0.6)
        
        for (index, drink) in drinks.enumerated() {
            output += (Double(nbOfGlasses[index]) * drink.glassSize * drink.alcooholRate * 0.8)
                / (Double(self.weight) * ratio )
        }
        return output
    }
    
    
    // stockage des données dans les NSUserDefaults
    func persistData() {
        UserDefaults.standard.set(self.weight, forKey: "weight")
        UserDefaults.standard.set(self.gender.rawValue, forKey: "gender")
        // force la sauvegarde. Pas obligatoire
        UserDefaults.standard.synchronize()
    }

    func weightConvert (myWeight: Int) -> Int {
//        return weUnit_bk == weUnit ? weight : 
        weight = round (weUnit == "Lb" ? Double (weight) / 2.2 : Double (weight) * 2.2)
        return weUnit == "Lb" ? Int (Double (myWeight) / 2.2) : Int (Double (myWeight) * 2.2)
    }
}

