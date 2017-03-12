//
//  ViewController.swift
//  Calcu
//
//  Created by Yedhukrishnan H on 1/23/17.
//  Copyright © 2017 Yedhukrishnan H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var timestamp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         setCurrentTime()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
       
    }

    func setCurrentTime () {
        
        // get the current date and time
        let currentDateTime = Date()
        
        // initialize the date formatter and set the style
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        
        // get the date time String from the date object
        formatter.string(from: currentDateTime) // October 8, 2016 at 10:48:53 PM
        timestamp.text = "Date: " + formatter.string(from: currentDateTime)
    }
    
    func setLabelAttributes () {
        
        let string = timestamp.text ?? ""
        
        let attributedString = NSMutableAttributedString(string: string as String)
        
        let normalfont = UIFont.systemFont(ofSize: 14)
        let normalAttribute = [NSForegroundColorAttributeName: UIColor.darkGray, NSFontAttributeName: normalfont]
        
        let boldfont = UIFont.boldSystemFont(ofSize: 14)
//        let boldAttribute = [NSForegroundColorAttributeName: UIColor.darkGray, NSFontAttributeName: boldfont]
        attributedString.addAttributes(normalAttribute, range: string.range(of: "Date: "))
        
        timestamp.attributedText = attributedString
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentages = [0.18, 0.2, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = tip + bill
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)    }
    
    @IBAction func percentageChanged(_ sender: Any) {
        let tipPercentages = [0.18, 0.2, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = tip + bill
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    }



