//
//  userModel.swift
//  spacex
//
//  Created by Charlie Kingsland on 20/01/2021.
//

struct Patch: Codable {
    var missionPatch: String?
    var missionPatchSml: String?
    
    private enum CodingKeys: String, CodingKey {
        case missionPatch = "large"
        case missionPatchSml = "small"
    }
}

struct Links: Codable {
    let patch: Patch
    let youtube_id: String?
}

struct Launch: Codable, Identifiable {
    let id = UUID()
//    let flight_number: Int
    let details: String?
    let name: String
    let date_unix: Double
    let date_utc: String
    let links: Links
    let rocket: String
//    let upcoming: String
}



import Foundation

class apiCall {
    func getUsers(completion:@escaping ([Launch]) -> ()) {
        guard let url = URL(string: "https://api.spacexdata.com/v4/launches/upcoming") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let launches = try! JSONDecoder().decode([Launch].self, from: data!)
//            print(launches)
            
            DispatchQueue.main.async {
                completion(launches)
            }
        }
        .resume()
    }
}
