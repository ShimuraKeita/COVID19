//
//  Model.swift
//  COVID19
//
//  Created by 志村　啓太 on 2021/01/03.
//

import Foundation


struct TotalData {
    
    let confirmad: Int
    let critical: Int
    let deaths: Int
    let recovered: Int
    
    var fatalityRate: Double {
        return (100.00 * Double(deaths)) / Double(confirmad)
    }
    
    var recoveredRate: Double {
        return (100.00 * Double(recovered)) / Double(confirmad)
    }
}

struct CountryData {
    
    let country: String
    let confirmad: Int64
    let critical: Int64
    let deaths: Int64
    let recovered: Int64
    let longitude: Double
    let latitude: Double
    
    var fatalityRate: Double {
        return (100.00 * Double(deaths)) / Double(confirmad)
    }
    
    var recoveredRate: Double {
        return (100.00 * Double(recovered)) / Double(confirmad)
    }
}

struct DetailedCountryData {
    
    let country: String
    
    let confirmadCases: Int
    let newCases: Int
    
    let recoveredCases: Int
    let criticalCases: Int
    let activeCases: Int
    
    let deaths: Int
    let newDeaths: Int
    
    let testDone: Int
    
    var fatalityRate: Double {
        return (100.00 * Double(deaths)) / Double(confirmadCases)
    }
    
    var recoveredRate: Double {
        return (100.00 * Double(recoveredCases)) / Double(confirmadCases)
    }
}

let testTotalData = TotalData(confirmad: 200, critical: 100, deaths: 20, recovered: 50)
let testCountryData = CountryData(country: "Test", confirmad: 500, critical: 300, deaths: 200, recovered: 100, longitude: 0.0, latitude: 0.0)
