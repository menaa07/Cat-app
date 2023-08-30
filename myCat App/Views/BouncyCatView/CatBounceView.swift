//
//  CatBounceView.swift
//  myCat App
//


import SwiftUI
//import MapKit

struct CatBounceView: UIViewControllerRepresentable { // View { // UIViewRepresentable {
   /* func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // leave it empty
    }
    
    var body: some View {
        NavigationStack {
            
        }
    } */
    
    func makeUIViewController(context: Context) -> CatBounceViewController {
        let storyBoard = UIStoryboard(name: "CatBounceScreen", bundle: .main)
        
        if let viewController = storyBoard.instantiateViewController(identifier: "CatBounce") as? CatBounceViewController {
            return viewController
        } else {
            fatalError("could not instantiate")
        }
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // leave it empty
    }
}

 
/*struct FontViewContainer : UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIFontPickerViewController {
        UIFontPickerViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // leave it empty
    }
}
*/

struct CatBounceView_Previews: PreviewProvider {
    static var previews: some View {
        CatBounceView()
    }
}
