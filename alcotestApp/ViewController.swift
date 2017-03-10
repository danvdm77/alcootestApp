//
//  ViewController.swift
//  alcotestApp
//
//  Created by etudiant02 on 07/03/2017.
//  Copyright © 2017 etudiant02. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var biereCount: UILabel!
    
    @IBOutlet weak var wineCount: UILabel!
    
    @IBOutlet weak var whiskyCount: UILabel!
    
    @IBOutlet weak var portoCount: UILabel!
    
    @IBOutlet weak var alcoolRate: UILabel!
    
    @IBOutlet weak var labOups: UILabel!
    
    var times = ["0", "1", "2", "3", "4", "5"]
    var user = User()
    var drinks = [Drink]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        user.nbOfGlasses = [0,0,0,0]
        
        drinks.append(Drink(name: "Bière", alcooholRate: 0.04, glassSize: 330))
        drinks.append(Drink(name: "Vin", alcooholRate: 0.12, glassSize: 120))
        drinks.append(Drink(name: "Whisky", alcooholRate: 0.40, glassSize: 50))
        drinks.append(Drink(name: "Porto", alcooholRate: 0.18, glassSize: 80))

        progressBar.setProgress(0.0, animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor.white 
        updateDisplay (tag: 0, number: 0)
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func drinkPressed(_ sender: UIButton) {
//        print (sender.tag)
        user.nbOfGlasses[sender.tag - 1] += 1
        let intTmp = user.nbOfGlasses[sender.tag - 1]
        updateDisplay (tag: sender.tag, number: intTmp)
    }
    
    @IBAction func drinkUnpressed(_ sender: UIButton) {
//        print (sender.tag)
        user.nbOfGlasses[sender.tag - 1] -= (user.nbOfGlasses[sender.tag - 1] > 0 ? 1 : 0)
        let intTmp = user.nbOfGlasses[sender.tag - 1]
        updateDisplay (tag: sender.tag, number: intTmp)
    }
    
    @IBAction func profileButtonPressed(_ sender: UIBarButtonItem) {
//        print ("Bouton de profil cliqué")
        self.performSegue(withIdentifier: "mainToProfile", sender: self)
    }
    
    func updateDisplay (tag: Int, number: Int) {
        switch tag {
        case 1:
            biereCount.text = intToString (number, digits: 0)
            break
        case 2:
            wineCount.text = intToString (number, digits: 0)
            break
        case 3:
            whiskyCount.text = intToString (number, digits: 0)
            break
        case 4:
            portoCount.text = intToString (number, digits: 0)
            break
        default:
            break
        }
        
        let temp = user.computeAlcooholRate (drinks: drinks)
        alcoolRate.text = doubleToString (myDouble: temp, nbOfDigits: 2)

        let progress = Float(temp / 0.8)
        progressBar.setProgress(progress, animated: true)
        
        if progress > (0.5 / 0.8) { labOups.text = "Oups !!"
        }   else {
            labOups.text = ""
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.times.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        print(times[row])
        return self.times[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print (self.times[row])
//        let progress = Float(1.0 / Double (self.times.count) * stringToDouble (self.times[row])!)
//        progressBar.setProgress(progress, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mainToProfile" {
            if let destinationVC = segue.destination as?
                ViewController_2 {
                destinationVC.user = self.user
            }
        }
    }
}

