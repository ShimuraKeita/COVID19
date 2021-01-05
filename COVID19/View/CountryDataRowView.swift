//
//  CountryDataRowView.swift
//  COVID19
//
//  Created by 志村　啓太 on 2021/01/03.
//

import SwiftUI

struct CountryDataRowView: View {
    
    var countryData: CountryData
    
    var body: some View {
        
        HStack {
            Text(countryData.country)
                .fontWeight(.medium)
                .font(.subheadline)
                .lineLimit(2)
                .frame(width: 100, alignment: .leading)
            
            Spacer()
            
            Text(countryData.confirmad.formatNumber())
                .lineLimit(1)
                .minimumScaleFactor(0.7)
                .font(.subheadline)
                .frame(height: 40)
                .padding(.leading, 5)
            
            Spacer()
            
            Text(countryData.deaths.formatNumber())
                .lineLimit(1)
                .minimumScaleFactor(0.7)
                .frame(width: 50, height: 40, alignment: .center)
                .font(.subheadline)
                .foregroundColor(.red)
                .padding(.leading, 5)
            
            Spacer()
            
            Text(countryData.recovered.formatNumber())
                .lineLimit(1)
                .minimumScaleFactor(0.7)
                .frame(width: 50, height: 40, alignment: .center)
                .font(.subheadline)
                .foregroundColor(.green)
        }
        .background(Color.gray)
    }
}

struct CountryDataRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDataRowView(countryData: testCountryData)
    }
}
