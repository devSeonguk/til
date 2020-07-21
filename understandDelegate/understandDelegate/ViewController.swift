//
//  ViewController.swift
//  understandDelegate
//
//  Created by Seonguk Jeong on 21/07/2020.
//  Copyright © 2020 Seonguk Jeong. All rights reserved.
//


// To understand how Delegate works
import UIKit

// Adopt Protocol
class ViewController: UIViewController, UITextFieldDelegate, {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var labelField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
    }
    
    // You can change the label.text with method by Enter.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        labelField.text = textField.text
        
        view.endEditing(true)
        
        return true
    }
    
//    @IBAction func buttonPressed(_ sender: UIButton) {
//
//        labelField.text = textField.text
//
//        view.endEditing(true)
//    }
    
}

