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
                TotalDataCard(name: "確認者数", number: totalData.confirmad.formatNumber() + "人")
                TotalDataCard(name: "死者", number: totalData.deaths.formatNumber() + "人", color: .red)
                TotalDataCard(name: "回復者数", number: totalData.recovered.formatNumber() + "人",color: .green)
            }
            
            HStack {
                TotalDataCard(name: "重傷者", number: totalData.critical.formatNumber() + "人",color: .yellow)
                TotalDataCard(name: "致死率", number: String(format: "%.2f", totalData.fatalityRate) + "%", color: .red)
                
                TotalDataCard(name: "回復率", number: String(format: "%.2f", totalData.recoveredRate) + "%", color: .green)
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
