//
//  CatGalleryView.swift
//  myCat App
//

//

import SwiftUI
import PhotosUI


struct ImageContainer : Identifiable {
    var id = UUID()
    var image : Image
}


struct CatGalleryView: View {
    @State var photoPicked : PhotosPickerItem?
    // @State var image : Image?
    @State var imagesContainers : [ImageContainer] = []
    @State var selectedStyle = 0
    @State var columns = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            VStack {
              /*  if let image {
                    image.resizable().scaledToFit()
                } else {
                    Text("Pick an image")
                } */
                Picker("Select a style", selection: $selectedStyle) {
                    Text("Grid").tag(0)
                    Text("Rows").tag(1)
                }
                .pickerStyle(.segmented)
                .padding()
                .onChange(of: selectedStyle) { newValue in
                    if selectedStyle == 0 {
                        columns = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
                    } else {
                        columns = [GridItem(.flexible())]
                    }
                }
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(imagesContainers) { imageContainer in
                            if selectedStyle == 0 {
                                imageContainer.image
                                    .resizable().scaledToFit()
                            } else {
                                imageContainer.image
                                    .resizable().scaledToFit()
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .frame(height: 200)
                                    .clipped()
                            }
                        }
                    }
                }
            }
                .navigationTitle("Cat Gallery")
                .toolbar {
                    PhotosPicker(selection: $photoPicked) {
                        Image(systemName: "photo.on.rectangle.angled")
                    }
                }
        }
        .onChange(of: photoPicked) { newValue in
            Task {
                if let image = try? await photoPicked?.loadTransferable(type: Image.self) {
                    await MainActor.run {
                        self.imagesContainers.append(ImageContainer(image: image))
                    }
                }
            }
        }
    }
}

struct CatGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        CatGalleryView()
    }
}
