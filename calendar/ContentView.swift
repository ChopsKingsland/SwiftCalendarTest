//
//  ContentView.swift
//  calendar
//
//  Created by Charlie Kingsland on 28/03/2021.
//

import SwiftUI
import DateGrid

struct ContentView: View {
    @State var launches: [Launch] = []
    
    @State var selectedMonthDate = Date()
    
    @State var dates: [Int] = []
    //    var mode = CalendarMode.month(estimateHeight: 400)
    
    var body: some View {
        NavigationView {
            VStack {
                DateGrid(interval: .init(start: Date.getDate(from: "2020 9 01")!, end: Date.getDate(from: "2022 9 01")!), selectedMonth: $selectedMonthDate, mode: .month(estimateHeight: 250)) { dateGridDate in
                    //            Text(dateGridDate.date.day)
                    
//                    if dates.contains(where: 10) {
////                        print("yes")
//                        DateCell(isLaunch: true, date: dateGridDate.date)
//                    }
                    
                    switch dates.contains(Int(dateGridDate.date.day) ?? 0) {
                    case true:
                        DateCell(isLaunch: true, date: dateGridDate.date)
                    case false:
                        DateCell(isLaunch: false, date: dateGridDate.date)
                    }
                    
//                    Text(launches)
                }
            }
        }.onAppear {
            let json = makeGetCall()
            let jsonData = json.data(using: .utf8)!
            launches = try! JSONDecoder().decode([Launch].self, from: jsonData)
//            print(launches.name)
//            print(launches)
            
            let today = Date()
            
            for launch in launches {
//                print(launch.name)
                let date = Date(timeIntervalSince1970: launch.date_unix)
                let components = Calendar.current.dateComponents([ .month, .day], from: date)
                
                if (Calendar.current.dateComponents([ .month], from: date) == Calendar.current.dateComponents([ .month], from: today)) {
//                    print(launch.name)
                    
//                    print(components.day ?? 0)
                    
                    dates.append(components.day ?? 0)
                }
                
                print(dates)
                
//                print(Calendar.current.dateComponents([ .month], from: date))
            }
        }
    }
    
    func makeGetCall() -> String {
        guard let myURL = URL(string: "https://api.spacexdata.com/v4/launches/upcoming") else {
            print("Error: \(String(describing: link)) doesn't seem to be a valid URL")
            return "error"
        }

        do {
            let content = try String(contentsOf: myURL, encoding: .ascii)
//            print("Content: \(content)")
            return content
        } catch let error {
            print("Error: \(error)")
            return "error"
        }
    }
    
    func grabLaunches() {
        apiCall().getUsers{ (launches) in self.launches = launches}
    }
    
    enum CalenderMode {
        case month(estimateHeight: CGFloat)
        case week(estimateHeight: CGFloat)
        var estimateHeight: CGFloat {
            switch self {
            case .month(estimateHeight: let estimateHeight):
                return estimateHeight
            case .week(estimateHeight: let estimateHeight):
                return estimateHeight
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
