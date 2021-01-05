//
//  CountryDetailView.swift
//  COVID19
//
//  Created by 志村　啓太 on 2021/01/05.
//

import SwiftUI

struct CountryDetailView: View {
    
    var countryData: CountryData
    
    var body: some View {
        
        VStack {
            VStack {
                CountryDetailRow(number: countryData.confirmad.formatNumber(), name: "確認済")
                    .padding(.top)
                CountryDetailRow(number: countryData.critical.formatNumber(), name: "重傷者",color: .yellow)
                CountryDetailRow(number: countryData.deaths.formatNumber(), name: "死亡者", color: .red)
                CountryDetailRow(number: String(format: "%.2f", countryData.fatalityRate), name: "致死率 %", color: .red)
                CountryDetailRow(number: countryData.recovered.formatNumber(), name: "回復者", color: .green)
                CountryDetailRow(number: String(format: "%.2f", countryData.recovered), name: "回復率 %", color: .green)
            }
            .background(Color("cardBackgroundGray"))
            .cornerRadius(8)
            .padding()
            
            Spacer()
        }
        .padding(.top, 50)
        .navigationBarTitle(countryData.country)
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(countryData: testCountryData)
    }
}
