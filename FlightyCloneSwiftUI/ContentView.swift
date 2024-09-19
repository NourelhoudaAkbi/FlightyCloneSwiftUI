//
//  ContentView.swift
//  FlightyCloneSwiftUI
//
//  Created by Nour el houda Akbi on 19/9/2024.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @StateObject var uiModel = UIModel()
    @State private var sheetPresented: Bool = true
    @State private var referenceOpacity = 0.0
    @State private var camera: MapCameraPosition = .camera(MapCamera(centerCoordinate: CLLocationCoordinate2D(latitude: 35.44722362595532, longitude: -86.03197387024086), distance: 5_000_000))

    let locations: [AirportAnnotation] = [
        AirportAnnotation(code: "ATL", name: "Atlanta", coordinate: .atl),
        AirportAnnotation(code: "ORD", name: "Chicago", coordinate: .ord)
    ]

    let flightRoute: [CLLocationCoordinate2D] = [.atl, .midPoint, .ord]
    
    var body: some View {
        // create the map ui
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
            Map(position: $camera){
                ForEach (locations){ location in
                    Annotation("\(location.name)", coordinate: location.coordinate, anchor: .leading){
                        HStack(spacing: 3){
                            Circle()
                                .fill(.flightyBlue)
                                .stroke(.white, lineWidth: 2)
                                .frame(height: 12)
                            
                            HStack(spacing: 0) {
                                Text(location.code)
                                    .font(.system(size: 10).weight(.semibold))
                                    .foregroundStyle(.white)
                                    .padding(.leading, 4)
                                    .padding(.trailing, 3)
                                    .frame(maxHeight: .infinity, alignment: .center)
                                    .background(.flightyBlue)
                                
                                Text(location.name)
                                    .font(.system(size: 12))
                                    .foregroundStyle(.white)
                                    .padding(.vertical, 3)
                                    .padding(.leading, 3)
                                    .padding(.trailing, 4)
                                    .background(.flightyLightBlue)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 5.0))
                            .fixedSize()
                        }
                        .offset(x: -5)
                    }
                    MapPolyline(coordinates: flightRoute)
                        .stroke(.flightyPathSecondary, lineWidth: 5)
                    MapPolyline(coordinates: flightRoute)
                        .stroke(.flightyPathPrimary, lineWidth: 2)
                }
                    
                
            }
        }
    }
}

#Preview {
    ContentView()
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}

struct AirportAnnotation: Identifiable {
    let id = UUID()
    let code: String
    let name: String
    let coordinate: CLLocationCoordinate2D
}

extension CLLocationCoordinate2D {
    static let atl = CLLocationCoordinate2D(latitude: 33.640411, longitude: -84.419853)
    static let ord = CLLocationCoordinate2D(latitude: 41.978611, longitude: -87.904724)
    static let midPoint = CLLocationCoordinate2D(latitude: 39.06903755242377, longitude: -86.79896452319443)
    static let overLake = CLLocationCoordinate2D(latitude: 42.03559217412583, longitude: -86.82568547736001)
}


