//
//  ContentView.swift
//  COVID19
//
//  Created by 志村　啓太 on 2021/01/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            RecentView().tabItem {
                Tab(imageName: "chart.bar")
            }
        }
        .tag(0)
        
    }
}

private struct Tab: View {
    let imageName: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
        }
    }
}
