//
//  ViewController.swift
//  Covid
//
//  Created by Nolan on 2020-12-29.
//
import UIKit


extension Notification.Name {
    static let didReceiveData = Notification.Name("didReceiveData")
    static let didCompleteTask = Notification.Name("didCompleteTask")
    static let completedLengthyDownload = Notification.Name("completedLengthyDownload")
}

class ViewController: UIViewController {
    
    
    @IBOutlet var Buttons: [UIButton]!
    @IBOutlet weak var covidImage: UIImageView!
    @IBOutlet weak var SelectCountryButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        for button in Buttons {
            button.layer.cornerRadius = 8
        }
    }
    
    @IBAction func didClickSelectCountry() {
        guard let vc = storyboard?.instantiateViewController(identifier: "second")
        else {
            print("couldn't find second view controller")
            return
        }
        present(vc, animated: true)
    }
}

