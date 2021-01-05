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
    @State var isSearchVisible = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                if isSearchVisible {
                    SearchView(searchText: $searchText)
                }
                
                TatalDataView(totalData: covidFetch.totalData)
                ListHeaderView()
                
                List {
                    ForEach(covidFetch.allCountries.filter {
                        self.searchText.isEmpty ? true : $0.country.lowercased().contains(self.searchText.lowercased())
                    } , id: \.country) { countryData in
                        
                        NavigationLink(destination:
                                        CountryDetailView(countryData: countryData)) {
                            CountryDataRowView(countryData: countryData)
                        }
                    }
                }
            }
            .navigationBarTitle("最近のデータ", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.isSearchVisible.toggle()
                                        
                                        if !self.isSearchVisible {
                                            self.searchText = ""
                                        }
                                    }, label: {
                                        Image(systemName: "magnifyingglass")
                                    }))
        }
    }
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
        RecentView()
    }
}
