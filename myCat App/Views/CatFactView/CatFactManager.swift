//
//  CatFactManager.swift
//  myCat App
//
//

import Foundation

class CatFactManager : ObservableObject {
    
    let apiURL = URL(string: "https://catfact.ninja/fact")!
    @Published var catFact : CatFact?
    
    func getCatFact() {
        catFact = nil
        // Running on background
        Task {
            // Get data from API
            let (data, _) = try await URLSession.shared.data(from: apiURL)
            
            print("got a fact !")
            print(String(data: data, encoding: .utf8)!)
            
            // Return this to main task
            try await MainActor.run {
                // Convert JSON to data
                self.catFact  =  try JSONDecoder().decode(CatFact.self, from: data)
            }
        }
    }
    
}
