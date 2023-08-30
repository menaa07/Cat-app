//
//  CatImagesView.swift
//  myCat App
//
//

import SwiftUI
import Subsonic

struct CatImagesView: View {
    
    @State var catURL = "https://cataas.com/cat?q="
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: catURL)!) { image in
                image
                    .resizable()
                    .scaledToFit()
                
            } placeholder: {
                ProgressView()
            }
            Spacer()
            Button("Load a cat") {
                    catURL += "1"
                print("Loding....")
            }
            .buttonStyle(.borderedProminent)
        }
        .onAppear {
            catURL += "1"
            play(sound:"meow.m4a")
        }
    }
}

struct CatImagesView_Previews: PreviewProvider {
    static var previews: some View {
        CatImagesView()
    }
}
