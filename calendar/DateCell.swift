//
//  DateCell.swift
//  calendar
//
//  Created by Charlie Kingsland on 12/09/2021.
//

import SwiftUI

struct DateCell: View {
    
    let isLaunch: Bool
    let date: Date
    
    var body: some View {
        //        Text(date.day)
        //            .padding(8)
        ////            .background(Color.purple)
        ////            .cornerRadius(20)
        //            .padding(.bottom, 10)
        
        VStack {
            Text(date.day)
                .padding(.bottom, -5)
                .font(.system(size: 20))
            switch isLaunch {
            case false:
                Circle()
                    .foregroundColor(Color(UIColor.systemBackground))
                    .frame(width: 7, height: 7)
            case true:
                Circle()
                    .foregroundColor(.red)
                    .frame(width: 7, height: 7)
            }
        }.padding(.bottom, 10)
        
    }
}

struct DateCell_Previews: PreviewProvider {
    static var previews: some View {
        DateCell(isLaunch: true, date: Date())
    }
}
