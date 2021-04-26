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
    
    
    
    @objc func onDidReceiveData(_ notification: Notification) {
        // Do something now
    }
    
    var apiResult: String = ""
    var ext: String = ""
    var dataStorage = DataProtocol()
    
    var tableViewController = TableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        for button in Buttons {
            button.layer.cornerRadius = 8
            button.backgroundColor = .darkGray
            button.setTitleColor(.white, for: .normal)
            button.frame.size = CGSize(width: 100.0, height: 35.0)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveData(_:)), name: .didReceiveData, object: nil)
        
    }
    
    func loadTableView(data: String, country: String) {
        DispatchQueue.main.async {
            if let vc = self.storyboard?.instantiateViewController(identifier: "tableview") {
                self.present(vc, animated: true)
                
            }
        }
    }
    
    func navigateController() {
        print("navigating")
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(self.tableViewController, animated: true)
        }
    }
    
    func getCovidRequest(country: String) {
        
        let covidRequest = CovidRequest(country: country)
        
        covidRequest.getCovidResult() {
        [weak self] result in
        switch result {
            case .failure(let error):
                print(error)
            case .success(let covidResult):
                self?.tableViewController.data = covidResult["data"] ?? "No Data Available"
                self?.tableViewController.country = country
                self?.navigateController()
            }
        }
    }
   
    
    @IBAction func onButtonClick(sender: UIButton) {
        
        switch sender {
            case CanadaButton :
                
                self.getCovidRequest(country: "canada")
                

                break;
            case UsaButton :
                
                self.getCovidRequest(country: "USA")
//                self.loadTableView()
                
                break;
            case SwitzerlandButton :
                
                self.getCovidRequest(country: "switzerland")
//                self.loadTableView()
                
                break;
            case JapanButton :
                
                self.getCovidRequest(country: "Japan")
//                self.loadTableView()
                
                break;
            case GermanyButton :
                
                self.getCovidRequest(country: "Germany")
//                self.loadTableView()
                
                break;
            default :
                print("default")
                break;
        }
    }
}

