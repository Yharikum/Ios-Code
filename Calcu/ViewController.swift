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
    @IBOutlet weak var billLbl: UILabel!
    @IBOutlet weak var item1Field: UITextField!
    @IBOutlet weak var item2Field: UITextField!
    @IBOutlet weak var timestampLbl: UILabel!
    @IBOutlet weak var billInvoiceLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         setCurrentTime()
         setLabelAttributes()
         calculateTip(self)
        
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
        timestampLbl.text = "Date: " + formatter.string(from: currentDateTime)
    }
    
    func setLabelAttributes () {
        
        let timeAttributedString = NSMutableAttributedString(string: timestampLbl.text ?? "" as String)
        let invoiceAttributedString = NSMutableAttributedString(string: billInvoiceLbl.text ?? "" as String)
        
        let boldFont = UIFont.boldSystemFont(ofSize: 11)
        let boldAttribute = [NSForegroundColorAttributeName: UIColor.black, NSFontAttributeName: boldFont]
        
        timeAttributedString.addAttributes(boldAttribute, range: NSRange(
            location: "Date: ".characters.count,
            length: (timestampLbl.text ?? "").characters.count - "Date: ".characters.count))
        
        invoiceAttributedString.addAttributes(boldAttribute, range: NSRange(
            location: "Bill#: ".characters.count,
            length: (billInvoiceLbl.text ?? "").characters.count - "Bill#: ".characters.count))
        
        timestampLbl.attributedText = timeAttributedString
        billInvoiceLbl.attributedText = invoiceAttributedString
    }
    
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentages = [0.18, 0.2, 0.25]
        let item1 = Double(item1Field.text!) ?? 0
        let item2 = Double(item2Field.text!) ?? 0
        billLbl.text =  String(format: "$%.2f", item1+item2)
        let tip = (item1+item2) * tipPercentages[tipControl.selectedSegmentIndex]
        let total = tip + item1 + item2
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)    }
    
    @IBAction func percentageChanged(_ sender: Any) {
        let tipPercentages = [0.18, 0.2, 0.25]
        let item1 = Double(item1Field.text!) ?? 0
        let item2 = Double(item2Field.text!) ?? 0
        billLbl.text =  String(format: "$%.2f", item1+item2)
        let tip = (item1+item2) * tipPercentages[tipControl.selectedSegmentIndex]
        let total = tip + item1 + item2
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    }



