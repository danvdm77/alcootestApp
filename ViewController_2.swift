//
//  ViewController_2.swift
//  alcotestApp
//
//  Created by etudiant02 on 07/03/2017.
//  Copyright © 2017 etudiant02. All rights reserved.
//

import UIKit

class ViewController_2: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerView_2: UIPickerView!

    @IBOutlet weak var genderSegmentedCt: UISegmentedControl!
    
    var user: User!

    var weights = ["40", "45", "50", "55", "60", "65", "70", "75", "80", "85", "90", "95", "100", "105", "110"]
    var wUnits = ["Kg", "Lb"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.pickerView_2.delegate = self
        self.pickerView_2.dataSource = self
        
        var pickerRow: Int!
//        for (index, value) in weights.enumerated() {
//            if value == intToString (user.weight, digits: 0) {
//                pickerRow = index
//            }
//        }
        pickerRow = weights.index(of: intToString (user.weight, digits: 0)!)
        self.pickerView_2.selectRow(pickerRow, inComponent: 0, animated: true)
        self.genderSegmentedCt.selectedSegmentIndex = user.gender == .man ? 0 : 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor.white
//        self.checkAmountTextField.text = "$ 0,0"
//        self.genderSegmentedCt.selectedSegmentIndex = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func genderSegmented(_ sender: UISegmentedControl) {
        user.gender = genderSegmentedCt.selectedSegmentIndex == 0 ? .man : .woman
        user.persistData ()
        print ("\(user.weight) - \(user.gender) - \(self.genderSegmentedCt.selectedSegmentIndex)")
    }
    
    func numberOfComponents(in pickerView_2: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView_2: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 0 ? self.weights.count : self.wUnits.count
    }
    
    func pickerView(_ pickerView_2: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //        print(weights[row])
        return component == 0 ? self.weights[row] : self.wUnits[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            print (self.weights[row])
            user.weight = Int(stringToDouble (self.weights[row])!)
            user.persistData ()
            print ("\(user.weight) - \(user.gender) - \(self.genderSegmentedCt.selectedSegmentIndex)")
        }
        else {
            print (self.wUnits[row])
            user.weight = Int(stringToDouble (self.weights[row])! / 2.2)
            user.persistData ()
            print ("\(user.weight) - \(user.gender) - \(self.genderSegmentedCt.selectedSegmentIndex)")
            for (index, value) in weights.enumerated() {
                weights[index] = intToString (Int (stringToDouble(value)! / 2.2), digits: 0)!
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
