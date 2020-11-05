//
//  ViewController.swift
//  The Light
//
//  Created by Dmitriy Karushev on 04.11.2020.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var conditionLabel: UILabel! //состояние фонарика On/Off
    @IBOutlet weak var colorName: UILabel! //название цвета
    var color = 0 // переменная для цвета
    var isLightOn = false
    
    //спрятал statusBar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        conditionLabel.text = "Off"
        UpdateUI()
        // Do any additional setup after loading the view.
    }
    
    fileprivate func UpdateUI() {
        switch color {
        case 0:
            colorName.textColor = .black
            colorName.text = "White"
            view.backgroundColor = .white
            conditionLabel.textColor = .black
            color += 1
        case 1:
            view.backgroundColor = .red
            colorName.text = "Red"
            color += 1
        case 2:
            view.backgroundColor = .orange
            colorName.text = "Orange"
            color += 1
        case 3:
            view.backgroundColor = .yellow
            colorName.text = "Yellow"
            color += 1
        case 4:
            view.backgroundColor = .green
            colorName.text = "Green"
            color += 1
        case 5:
            view.backgroundColor = .cyan
            colorName.text = "Cyan"
            color += 1
        case 6:
            view.backgroundColor = .blue
            colorName.text = "Blue"
            color += 1
        case 7:
            view.backgroundColor = .magenta
            colorName.text = "Magenta"
            color += 1
        case 8:
            view.backgroundColor = .black
            colorName.text = "Black"
            colorName.textColor = .white
            color = 0
            conditionLabel.textColor = .white
        default:
            break
            
            
        }
    
    }
    
    @IBAction func buttonPressed() {
        UpdateUI()
        
    }
    
    //switch
    @IBAction func switchCondition(_ sender: UISwitch) {
        //функция вкл фонарика
        func toggleTorch(on: Bool) {
            
            guard let device = AVCaptureDevice.default(for: .video) else { return }
            
            if device.hasTorch {
                do {
                    try device.lockForConfiguration()
                    
                    if on == true {
                        device.torchMode = .on
                    } else {
                        device.torchMode = .off
                    }
                    
                    device.unlockForConfiguration()
                } catch {
                    print("Torch could not be used")
                }
            } else {
                print("Torch is not available")
            }
            
        }
        //включение фонарика
        switch sender.isOn {
        case true:
            conditionLabel.text = "On"
            isLightOn.toggle()
            toggleTorch(on: isLightOn)
            UIScreen.main.brightness = CGFloat(1)
        default:
            conditionLabel.text = "Off"
            isLightOn.toggle()
            toggleTorch(on: isLightOn)
            UIScreen.main.brightness = CGFloat(0.5)
        }
}
    
    
}




