//
//  SecondViewController.swift
//  Covid
//
//  Created by Nolan on 2020-12-29.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var CanadaButton: UIButton!
    @IBOutlet weak var UsaButton: UIButton!
    @IBOutlet weak var SwitzerlandButton: UIButton!
    @IBOutlet weak var JapanButton: UIButton!
    @IBOutlet weak var GermanyButton: UIButton!
    
    @IBOutlet var Buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        for button in Buttons {
            button.layer.cornerRadius = 8
            button.backgroundColor = .darkGray
            button.setTitleColor(.white, for: .normal)
            button.frame.size = CGSize(width: 100.0, height: 35.0)
        }
    }
    
    @IBAction func onButtonClick(sender: UIButton) {
        
        switch sender {
            case CanadaButton :
                print("Canada Button Clicked")
                
                DispatchQueue.main.async {
                    if let vc = self.storyboard?.instantiateViewController(identifier: "tableview") {
                        self.present(vc, animated: true)
                    }
                }
                break;
            case UsaButton :
                print("Usa Button clicked")
                break;
            case SwitzerlandButton :
                print("Switzerland Button clicked")
                break;
            case JapanButton :
                print("Japan Button clicked")
                break;
            case GermanyButton :
                print("Germany Button clicked")
                break;
            default :
                print("default")
                break;
        }
    }
}

