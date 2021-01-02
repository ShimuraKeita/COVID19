//
//  TatalDataView.swift
//  COVID19
//
//  Created by 志村　啓太 on 2021/01/03.
//

import SwiftUI

struct TatalDataView: View {
    
    var totalData: TotalData
    
    var body: some View {
        
        VStack {
            HStack {
                TotalDataCard(number: totalData.confirmad.formatNumber(), name: "確認")
                TotalDataCard(number: totalData.critical.formatNumber(), name: "重傷",color: .yellow)
                TotalDataCard(number: totalData.deaths.formatNumber(), name: "死者", color: .red)
            }
            
            HStack {
                TotalDataCard(number: String(format: "%.2f", totalData.fatalityRate), name: "致死率 %", color: .red)
                TotalDataCard(number: totalData.recovered.formatNumber(), name: "回復",color: .green)
                TotalDataCard(number: String(format: "%.2f", totalData.recoveredRate), name: "回復率 %", color: .green)
            }
        }
        .frame(height: 170)
        .padding(10)
    }
}

struct TatalDataView_Previews: PreviewProvider {
    static var previews: some View {
        TatalDataView(totalData: testTotalData)
    }
}
