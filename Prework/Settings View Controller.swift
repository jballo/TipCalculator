//
//  Settings View Controller.swift
//  Prework
//
//  Created by Jonathan Ballona Sanchez on 10/12/21.
//

import UIKit

class Settings_View_Controller: UIViewController {
    
    let defaults = UserDefaults.standard
    
    
    @IBOutlet weak var excellentTipPercentageControl: UISlider!
    @IBOutlet weak var goodTipPercentageControl: UISlider!
    @IBOutlet weak var badTipPercentageControl: UISlider!
    
    
    
    
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var excellentTipReadOut: UILabel!
    @IBOutlet weak var goodTipReadOut: UILabel!
    @IBOutlet weak var badTipReadOut: UILabel!
    
    
    @IBOutlet weak var themeColorBackground: UILabel!
    @IBOutlet weak var tipSliderColorBackground: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        themeColorBackground.layer.masksToBounds = true
        themeColorBackground.layer.cornerRadius = 20
        tipSliderColorBackground.layer.masksToBounds = true
        tipSliderColorBackground.layer.cornerRadius = 20
        temp.text = defaults.string(forKey: "backCol")!
//        defaults.synchronize()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        excellentTipReadOut.text = (String)(defaults.float(forKey: "excellentTipPercentage") * 100.0) + "%"
        excellentTipPercentageControl.setValue(defaults.float(forKey: "excellentTipPercentage"), animated: false)
        
        
        goodTipReadOut.text = (String)(defaults.float(forKey: "goodTipPercentage") * 100.0) + "%"
        goodTipPercentageControl.setValue(defaults.float(forKey: "goodTipPercentage"), animated: false)
        
        
        
        badTipReadOut.text = (String)(defaults.float(forKey: "badTipPercentage") * 100.0) + "%"
        badTipPercentageControl.setValue(defaults.float(forKey: "badTipPercentage"), animated: false)

        
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear of tipSetting Controller")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear of tipSetting Controller")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear of tipSetting Controller")
    }
    
    
    
    @IBAction func setThemeToSpring(_ sender: Any) {
        temp.text = "spring"
        defaults.setValue(temp.text, forKey: "backCol")
        defaults.synchronize()
    }
    @IBAction func setThemeToSummer(_ sender: Any) {
        temp.text = "summer"
        defaults.setValue(temp.text, forKey: "backCol")
        defaults.synchronize()
    }
    @IBAction func setThemeToFall(_ sender: Any) {
        temp.text = "fall"
        defaults.setValue(temp.text, forKey: "backCol")
        defaults.synchronize()
    }
    
    @IBAction func updateExcellentTipPercentage(_ sender: Any) {

        var currentExcellentTipPercentage = (excellentTipPercentageControl.value)
        currentExcellentTipPercentage = (Float)((Int)(currentExcellentTipPercentage * 100)) / 100.0
        
        print("Current excellent tip percentage: " + String(currentExcellentTipPercentage ))
        excellentTipReadOut.text = String(format: "%.f", currentExcellentTipPercentage*100) + "%"
        defaults.setValue(currentExcellentTipPercentage, forKey: "excellentTipPercentage")
        defaults.synchronize()
    }
    
    @IBAction func updateGoodTipPercentage(_ sender: Any) {
        var currentGoodTipPercentage = goodTipPercentageControl.value
        
        currentGoodTipPercentage = (Float)((Int)(currentGoodTipPercentage * 100)) / 100.0
        print("Current good tip percentage: " + String(currentGoodTipPercentage ))
        goodTipReadOut.text = String(format: "%.f", currentGoodTipPercentage*100) + "%"
        defaults.setValue(currentGoodTipPercentage, forKey: "goodTipPercentage")
        defaults.synchronize()
        
    }
    
    @IBAction func updateBadTipPercentage(_ sender: Any) {
        var currentBadTipPercentage = badTipPercentageControl.value
        currentBadTipPercentage = (Float)((Int)(currentBadTipPercentage * 100)) / 100.0
        
        badTipReadOut.text = String(format: "%.f", currentBadTipPercentage*100.0) + "%"
        defaults.setValue(currentBadTipPercentage, forKey: "badTipPercentage")
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
