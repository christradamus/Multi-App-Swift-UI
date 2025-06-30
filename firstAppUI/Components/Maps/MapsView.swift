//
//  MapsView.swift
//  firstAppUI
//
//  Created by Christian Perez flores on 19-06-25.
//

import SwiftUI
import MapKit

struct MapsView: View {
    
    @State var position = MapCameraPosition.region(
        MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: -34.76148203702341,
            longitude: -71.8305601845057),
        span: MKCoordinateSpan(
            latitudeDelta: 0.005,
            longitudeDelta: 0.0005)
        )
    )
    
    var body: some View {
        ZStack {
            MapReader { proxy in
                Map(position: $position) {
                    Annotation("Casa minina", coordinate: CLLocationCoordinate2D(
                        latitude: -34.76148203702341,
                        longitude: -71.8305601845057)) {
                            Circle()
                                .frame(height: 30)
                                .foregroundStyle(.yellow)
                        }
                    Annotation("Casa chris", coordinate: CLLocationCoordinate2D(
                        latitude: -33.21761837887706,
                        longitude: -70.6791248365512)) {
                            Circle()
                                .frame(height: 30)
                                .foregroundStyle(.red)
                        }
                }
                    .mapStyle(.hybrid)
                    .onMapCameraChange(frequency: .continuous) { context in
                        print("we are in \(context.region)")
                    }
                    .onTapGesture { coordinate in
                        if let coords = proxy.convert(coordinate, from: .local) {
                            withAnimation {
                                position = MapCameraPosition.region(
                                    MKCoordinateRegion(
                                        center: CLLocationCoordinate2D(
                                            latitude: coords.latitude,
                                            longitude: coords.longitude),
                                        span: MKCoordinateSpan(
                                            latitudeDelta: 0.005,
                                            longitudeDelta: 0.0005)
                                    )
                                )
                            }
                        }
                    }
            }
            VStack {
                Spacer()
                HStack {
                    Button("Casa Chris"){
                        withAnimation {
                            position = MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(
                                        latitude: -33.21761837887706,
                                        longitude: -70.6791248365512),
                                    span: MKCoordinateSpan(
                                        latitudeDelta: 0.005,
                                        longitudeDelta: 0.0005)
                                )
                            )
                        }
                    }.padding(32)
                        .background(.white)
                        .padding()
                    Button("Casa Minina"){
                        withAnimation{
                            position = MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(
                                        latitude: -34.7609368,
                                        longitude: -71.8319572),
                                    span: MKCoordinateSpan(
                                        latitudeDelta: 0.005,
                                        longitudeDelta: 0.0005)
                                )
                            )
                        }
                    }.padding(32)
                        .background(.white)
                        .padding()
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.imcBack)
    }
}

#Preview {
    MapsView()
}
