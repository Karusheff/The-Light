//
//  ViewController.swift
//  The Light
//
//  Created by Dmitriy Karushev on 04.11.2020.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colorName: UILabel!
    var isLightOn = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UpdateUI()
        // Do any additional setup after loading the view.
    }

    fileprivate func UpdateUI() {
        switch isLightOn {
        case 0:
            colorName.text = "White"
            view.backgroundColor = .white
            isLightOn += 1
        case 1:
            view.backgroundColor = .red
            colorName.text = "Red"
            isLightOn += 1
        case 2:
            view.backgroundColor = .orange
            colorName.text = "Orange"
            isLightOn += 1
        case 3:
            view.backgroundColor = .yellow
            colorName.text = "Yellow"
            isLightOn += 1
        case 4:
            view.backgroundColor = .green
            colorName.text = "Green"
            isLightOn += 1
        case 5:
            view.backgroundColor = .cyan
            colorName.text = "Cyan"
            isLightOn += 1
        case 6:
            view.backgroundColor = .blue
            colorName.text = "Blue"
            isLightOn += 1
        case 7:
            view.backgroundColor = .magenta
            colorName.text = "Magenta"
            isLightOn += 1
        default:
            isLightOn = 0
        }
    }
    
    @IBAction func buttonPressed() {
        UpdateUI()
    }
    
}

