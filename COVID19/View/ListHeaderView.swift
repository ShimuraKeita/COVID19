//
//  ListHeaderView.swift
//  COVID19
//
//  Created by 志村　啓太 on 2021/01/03.
//

import SwiftUI

struct ListHeaderView: View {
    var body: some View {
        
        HStack {
            Text("国")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(width: 100, alignment: .leading)
                .padding(.leading, 30)
            
            Spacer()
            
            Text("確認者数")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(height: 40)
                .padding(.leading, 5)
            
            Spacer()
            
            Text("死者数")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(height: 40)
                .padding(.leading, 5)
            
            Spacer()
            
            Text("回復者数")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(height: 40)
                .padding(.trailing, 30)
        }
        .background(Color.gray)
    }
}

struct ListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ListHeaderView()
    }
}
