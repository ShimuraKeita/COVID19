//
//  RecentView.swift
//  COVID19
//
//  Created by 志村　啓太 on 2021/01/03.
//

import SwiftUI

struct RecentView: View {
    
    @ObservedObject var covidFetch = CovidFetchRequest()
    @State var searchText = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                ListHeaderView()
                
                List {
                    ForEach(covidFetch.allCountries.filter {
                        self.searchText.isEmpty ? true : $0.country.lowercased().contains(self.searchText.lowercased())
                    } , id: \.country) { countryData in
                        
                    }
                }
            }
        }
    }
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
        RecentView()
    }
}
