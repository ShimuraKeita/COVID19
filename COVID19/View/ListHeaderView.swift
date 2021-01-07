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
                .frame(width: 60, alignment: .leading)
                .padding(.leading, 30)
            
            Spacer()
            
            Text("確認者数")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(width: 70, height: 40, alignment: .center)
                .padding(.leading, 5)
            
            Spacer()
            
            Text("死者数")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(width: 70, height: 40, alignment: .center)
                .padding(.leading, 5)
            
            Spacer()
            
            Text("回復者数")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(width: 70, height: 40, alignment: .center)
                .padding(.trailing, 40)
        }
        .background(Color("cardBackgroundGray"))
    }
}

struct ListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ListHeaderView()
    }
}
