//
//  CovidFetchRequest.swift
//  COVID19
//
//  Created by 志村　啓太 on 2021/01/03.
//

import Foundation
import Alamofire
import SwiftyJSON


class CovidFetchRequest: ObservableObject {
    
    init() {
        getCurrentTotal()
    }
    
    func getCurrentTotal() {
        let headers: HTTPHeaders = [
            "x-rapidapi-key": "1607a04f58msh09cc41c37d0e90cp180415jsn7502e4af8ab6",
            "x-rapidapi-host": "covid-19-data.p.rapidapi.com"
        ]
        
        AF.request("https://covid-19-data.p.rapidapi.com/totals", headers: headers).responseJSON { response in
            debugPrint(response)
        }

    }
}
