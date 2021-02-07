//
//  dataProtocol.swift
//  Covid
//
//  Created by Nolan on 2021-02-06.
//

import UIKit

class DataProtocol: NSObject {

    var data: String;
    var country: String;
    var city: String;
    
    init(data: String, country: String, city: String) {
        self.data = data
        self.country = country
        self.city = city
    }
}
