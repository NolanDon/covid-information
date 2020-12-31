//
//  CityFinder.swift
//  Covid
//
//  Created by Nolan on 2020-12-30.
//

import Foundation


struct CovidGlobalResponse: Decodable {
    var response: [CovidAPIResponseDetail]
}

struct CovidAPIResponseDetail:Decodable {
    
    var country:String
    var todayCases:Int
    var deaths:Int
    var todayDeaths:Int
    var recovered:Int
    var active:Int
    var critical:Int
    
}

//      "country":"USA",
//      "cases":20119503,
//      "todayCases":137062,
//      "deaths":349121,
//      "todayDeaths":2444,
//      "recovered":11935178,
//      "active":7835204,
//      "critical":29089,
//      "casesPerOneMillion":60607,
//      "deathsPerOneMillion":1052,
//      "totalTests":251078176,
//      "testsPerOneMillion":756338
