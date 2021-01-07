//
//  CountryDetailView.swift
//  COVID19
//
//  Created by 志村　啓太 on 2021/01/05.
//

import SwiftUI

struct CountryDetailView: View {
    
    @ObservedObject var countryStatisticsRequest = CountryStatisticsFetchRequest()
    
    var countryName: String
    
    var body: some View {
        
        VStack {
            VStack {
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryData?.confirmadCases.formatNumber() ?? "Err", name: "確認者数")
                    .padding(.top)
                
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryData?.activeCases.formatNumber() ?? "Err", name: "現感染者")
                
                CountryDetailRow(number: "+" + (countryStatisticsRequest.detailedCountryData?.newCases.formatNumber() ?? "Err"), name: "新たに確認")
                
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryData?.recoveredCases.formatNumber() ?? "Err", name: "回復者", color: .green)
                
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryData?.criticalCases.formatNumber() ?? "Err", name: "重傷者", color: .yellow)
                
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryData?.deaths.formatNumber() ?? "Err", name: "死亡者", color: .red)
                
                CountryDetailRow(number: "+" + (countryStatisticsRequest.detailedCountryData?.newDeaths.formatNumber() ?? "Err"), name: "新たな死亡者", color: .red)
                
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryData?.testDone.formatNumber() ?? "Err", name: "Test Done", color: .yellow)
                
                CountryDetailRow(number: String(format: "%.2f", countryStatisticsRequest.detailedCountryData?.fatalityRate ?? 0.0) + "%" , name: "致死率", color: .red)
                
                CountryDetailRow(number: String(format: "%.2f", countryStatisticsRequest.detailedCountryData?.recoveredRate ?? 0.0) + "%" , name: "回復率", color: .green)
            }
            .background(Color("cardBackgroundGray"))
            .cornerRadius(8)
            .padding()
            
            Spacer()
        }
        .padding(.top, 25)
        .navigationBarTitle(countryName)
        .onAppear() {
            self.getStatustucs()
        }
    }
    
    private func getStatustucs() {
        print("sssssss")
        countryStatisticsRequest.getStatsFor(country: self.countryName.replacingOccurrences(of: " ", with: "-"))
    }
}
