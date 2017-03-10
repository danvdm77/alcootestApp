//
//  Utilities.swift
//  alcotestApp
//
//  Created by etudiant02 on 07/03/2017.
//  Copyright © 2017 etudiant02. All rights reserved.
//

import Foundation
import UIKit

func simpleAlert(title: String?, message: String?, acceptTitle: String?, myController: UIViewController, completionHandler:(()->Void)? ) {
    let alertController = UIAlertController(title: title != nil ? title! : "Alert", message: message != nil ? message! : "", preferredStyle: .alert)
    
    // Create the action.
    let acceptAction = UIAlertAction(title: acceptTitle != nil ? acceptTitle! : "OK", style: .default) { _ in
        completionHandler?()
        // print("The simple alert's accept action occurred.")
    }
    
    // Add the action.
    alertController.addAction(acceptAction)
    myController.present(alertController, animated: true, completion: nil)
}

extension Double {
    func toFormattedString(_ digits : Int) -> String? {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = digits
        formatter.minimumFractionDigits = digits
        
        if let output = formatter.string(from: NSNumber.init(value:self)) {
            return output
        } else {
            return nil
        }
    }
}

extension NSNumber {
    func toFormattedString(_ digits : Int) -> String? {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = digits
        formatter.minimumFractionDigits = digits
        
        if let output = formatter.string(from: self) {
            return output
        } else {
            return nil
        }
    }
}

func intToString(_ number: Int, digits: Int) -> String? {
//    print("ENTER INT TO STRING")
    let formatter = NumberFormatter()
    
    formatter.numberStyle = .decimal
    formatter.maximumFractionDigits = digits
    formatter.minimumFractionDigits = digits
    
    if let output = formatter.string(from: NSNumber.init(value:number)) {
//                print("EXIT INT TO STRING")
        return output
    } else {
//        print("EXIT INT TO STRING WITH NIL")
        return nil
    }

}

func numberToString(_ number: NSNumber, digits: Int) -> String? {
    let formatter = NumberFormatter()
    
    formatter.numberStyle = .decimal
    formatter.maximumFractionDigits = digits
    formatter.minimumFractionDigits = digits
    
    if let output = formatter.string(from: number) {
        return output
    } else {
        return nil
    }
}


func stringToDouble(_ myString: String) -> Double? {
    
    //    let formatter = NumberFormatter()
    //    let myNumber = formatter.number(from: myString)
    //    let myDouble = myNumber?.doubleValue
    //    return myDouble
    
    return NumberFormatter().number(from: myString)?.doubleValue
}


/// Convertit un Double en String
///
/// - parameter myDouble:   Double en entrée
/// - parameter nbOfDigits: Nombre exact de chiffres après la virgule.
///
/// - returns: La String en résultat
func doubleToString(myDouble: Double, nbOfDigits: Int) -> String? {
    let formatter = NumberFormatter()
    
    formatter.numberStyle = .decimal
    formatter.maximumFractionDigits = nbOfDigits
    formatter.minimumFractionDigits = nbOfDigits
    
    if let output = formatter.string(from: NSNumber(value:myDouble)) {
        return output
    } else {
        return nil
    }
}




