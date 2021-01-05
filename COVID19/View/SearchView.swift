//
//  SearchView.swift
//  COVID19
//
//  Created by 志村　啓太 on 2021/01/05.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            TextField("国名で検索", text: $searchText)
                .padding()
        }
        .frame(height: 50)
        .background(Color("cardBackgroundGray"))
    }
}
