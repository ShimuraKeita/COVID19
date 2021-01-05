//
//  CountryDetailRow..swift
//  COVID19
//
//  Created by 志村　啓太 on 2021/01/05.
//

import SwiftUI

struct CountryDetailRow: View {
    
    var number: String = "Err"
    var name: String = "Confirmad"
    var color: Color = .primary
    
    var body: some View {
        
        VStack {
            HStack {
                Text(self.name)
                    .font(.body)
                    .padding(5)
                
                Spacer()
                
                Text(self.number)
                    .font(.subheadline)
                    .padding(5)
                    .foregroundColor(color)
            }
            
            Divider()
        }
        .padding(.leading)
    }
}

struct CountryDatailRow_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailRow()
    }
}
