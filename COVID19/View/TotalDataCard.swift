//
//  TotalDataCard.swift
//  COVID19
//
//  Created by 志村　啓太 on 2021/01/03.
//

import SwiftUI

struct TotalDataCard: View {
    
    var name: String = "Confirmad"
    var number: String = "Err"
    var color: Color = .primary
    
    var body: some View {
        
        GeometryReader {geometry in
            VStack {
                Text(self.name)
                    .font(.body)
                    .padding(5)
                    .foregroundColor(self.color)
                Text(self.number)
                    .font(.subheadline)
                    .padding(5)
                    .foregroundColor(self.color)
            }
            .frame(width: geometry.size.width, height: 80, alignment: .center)
            .background(Color("cardBackgroundGray"))
            .cornerRadius(8.0)
        }
    }
}

struct TotalDataCard_Previews: PreviewProvider {
    static var previews: some View {
        TotalDataCard()
    }
}
