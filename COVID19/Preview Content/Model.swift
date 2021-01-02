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
