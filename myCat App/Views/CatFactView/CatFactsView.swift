//
//  CatFactsView.swift
//  myCat App
//
 11/08/2023.
//

import SwiftUI

struct CatFactsView: View {
    @StateObject var catFactsManager = CatFactManager()
    
    var body: some View {
        VStack {
            if let catFact = catFactsManager.catFact {
                Text(catFact.fact)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            else {
                ProgressView()
                    .progressViewStyle(.circular)
            }
            Button {
                catFactsManager.getCatFact()
            }
        label: {
            Text("Get another Fact!")
        }
        .buttonStyle(.borderedProminent)
        }
        .onAppear{
                  catFactsManager.getCatFact()
        }
    }
}

struct CatFactsView_Previews: PreviewProvider {
    static var previews: some View {
        CatFactsView()
    }
}
