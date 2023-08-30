//
//  ContentView.swift
//  myCat App
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CatFactsView()
                .tabItem{
                    Label("Show Fact", systemImage: "lightbulb")
                }
            CatImagesView()
                .tabItem {
                    Label("Random Cat", systemImage: "photo")
                }
            CatBounceView()
                        .tabItem {
                            Label("Bouncy Cat",systemImage: "arrowshape.bounce.right")
                        }
                        .edgesIgnoringSafeArea(.top)
            CatGalleryView()
                .tabItem {
                    Label("Cat Gallery", systemImage: "photo.stack")
                }
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
