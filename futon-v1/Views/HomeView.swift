//
//  HomeView.swift
//  futon-v1
//
//  Created by Linh Dang on 3/30/24.
//

import SwiftUI
import MapKit

struct HomeView: View {
    @State var searchText = "Monster University"
    @State var isPresented = false
    
    // Define your pins as an array of MKPointAnnotation
        @State private var pins: [MKPointAnnotation] = [
            createPin(title: "Mike Wazowski", coordinate: CLLocationCoordinate2D(latitude: 37.8327, longitude: -122.2760)),
            createPin(title: "James P. Sullivan", coordinate: CLLocationCoordinate2D(latitude: 37.8305, longitude: -122.2813)),
            createPin(title: "Don Carlton", coordinate: CLLocationCoordinate2D(latitude: 37.8312, longitude: -122.2775)),
        ]

        // Helper function to create pins
        static func createPin(title: String, coordinate: CLLocationCoordinate2D) -> MKPointAnnotation {
            let pin = MKPointAnnotation()
            pin.title = title
            pin.coordinate = coordinate
            return pin
        }

        var body: some View {
            ZStack {
                // Map View
                MapView(pins: pins)
                    .edgesIgnoringSafeArea(.all)
                
                // Search bar
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 100)
                            .fill(.white)
                            .frame(width: 380, height: 50)
                        
                        RoundedRectangle(cornerRadius: 100)
                            .stroke(.black)
                            .frame(width: 380, height: 50)
                        
                        TextField("", text: $searchText)
                            .padding(.leading, 30)
                    }
                    
                    Spacer()
                }
                
                
                // Button
                VStack {
                    Spacer()
                    
                    Button {
                        isPresented = true
                    } label: {
                        VStack {
                            Image("view_btn")
                        }
                        .foregroundColor(.black)
                        .offset(y: 30)
                    }
                }
                .padding(.bottom, 40)
                
               
            }
            .sheet(isPresented: $isPresented){
                VStack {
                    SwipeView(users: [exampleUser1, exampleUser2, exampleUser3])
                }
            }
            
        }
}

struct MapView: UIViewRepresentable {
    var pins: [MKPointAnnotation]

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator

        // Set the initial region of the map
        let center = CLLocationCoordinate2D(latitude: 37.8325, longitude: -122.2791)
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02) // Adjusted span
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)

        return mapView
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        view.removeAnnotations(view.annotations)
        view.addAnnotations(pins)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard let annotation = annotation as? MKPointAnnotation else {
                return nil
            }
            
            let identifier = "customAnnotation"
            var annotationView: MKAnnotationView
            
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKAnnotationView {
                annotationView = dequeuedView
            } else {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView.canShowCallout = true
            }
                        
            
            // Create house icon
            let imageView = UIImageView(image: UIImage(systemName: "graduationcap.circle.fill"))
            imageView.tintColor = .blue
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            annotationView.addSubview(imageView)
            
            return annotationView
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
