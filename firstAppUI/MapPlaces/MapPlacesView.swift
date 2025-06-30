//
//  MapPlacesView.swift
//  firstAppUI
//
//  Created by Christian Perez flores on 23-06-25.
//

import SwiftUI
import MapKit

struct MapPlacesView: View {
    
    @State var place: [MapPlaceModel] = []
    @State var showPopUp: CLLocationCoordinate2D? = nil
    @State var placeName: String = ""
    @State var isFavorite: Bool = false
    @State var showSheet = false
    
    let modalHeight = stride(from: 0.4, through: 0.4, by: 0.1).map { PresentationDetent.fraction($0)}
    
    let emptyModal = stride(from: 0.2, through: 0.2, by: 0.1).map { PresentationDetent.fraction($0)}
    
    @State var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -33.443267,
                                           longitude: -70.666866),
            span: MKCoordinateSpan(
                latitudeDelta: 1,
                longitudeDelta: 1
            )
        )
    )
    
    var body: some View {
        ZStack {
            MapReader{ proxy in
                Map(position: $position) {
                    ForEach(place) { places in
                        let color = places.favorite ? Color.yellow : Color.red
                        Annotation(places.name,
                                   coordinate: places.coordinates) {
                            Circle()
                                .stroke(Color.black, lineWidth: 2).fill(color)
                                .frame(height: 20)
                        }
                    }
                }
                .onTapGesture { coord in
                    if let coordinate = proxy.convert(coord, from: .local) {
                        showPopUp = coordinate
                    }
                }.overlay{
                    VStack {
                        Button("Ver lista"){
                            showSheet = true
                        }.disabled(place.isEmpty)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(.white)
                            .cornerRadius(16)
                            .padding(16)
                        Spacer()
                    }
                }
            }
            if showPopUp != nil {
                let view = VStack{
                    Text("Añadir lugar").font(.headline)
                    Spacer()
                    TextField("Escriba el alias", text: $placeName)
                        .font(.subheadline)
                        .autocorrectionDisabled()
                        .keyboardType(.namePhonePad)
                    Toggle("Guardar en favoritos?", isOn: $isFavorite)
                        .font(.subheadline)
                    Spacer()
                    Button("Guardar", action: {
                        savePlace(placeName,
                                  showPopUp!,
                                  isFavorite)
                        savePlaces(place)
                        cleanData()
                    }).disabled(placeName.isEmpty)
                }
                withAnimation{
                    CustomDialogue(closeDialogue: {
                        showPopUp = nil
                    },
                                   onDismissOutside: true,
                                   content: view)
                }
            }
        }.sheet(isPresented: $showSheet){
            Text("Tus lugares")
                .font(.title)
                .padding(.horizontal, 16)
                .padding(.top, 24)
                .bold()
                .frame(alignment: .center)
            ScrollView(.horizontal){
                LazyHStack{
                    ForEach(place){ places in
                        let color = places.favorite ? Color.yellow : Color.red
                        VStack {
                            Text(places.name).font(.title3).bold()
                        }.frame(width: 120, height: 100)
                            .overlay{
                                RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(color, lineWidth: 1)
                            }.shadow(radius: 5).padding(.horizontal, 8)
                            .onTapGesture {
                                onTapItem(places)
                                showSheet = false
                            }
                    }
                }.padding()
            }.presentationDetents(Set(modalHeight))
            Button("Limpiar lista") {
                place = []
                savePlaces([])
                showSheet = false
            }.padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(.white)
                .cornerRadius(16)
                .padding(16)
                .font(.title2).foregroundColor(.black)
                .border(.gray,width: 1.5)
            Spacer()
        }.onAppear{
            place = loadPlaces()
        }
    }
    
    private func onTapItem(_ place: MapPlaceModel) {
        withAnimation {
            position = MapCameraPosition.region(
                MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: place.coordinates.latitude,
                        longitude: place.coordinates.longitude),
                    span: MKCoordinateSpan(
                        latitudeDelta: 1,
                        longitudeDelta: 1)
                )
            )
        }
    }
    
    private func savePlace(_ name: String,
                           _ position: CLLocationCoordinate2D,
                           _ favorite: Bool) {
        let newPlace: MapPlaceModel = MapPlaceModel(
            name: name,
            coordinates: position,
            favorite: favorite
        )
        place.append(newPlace)
    }
    
    private func cleanData() {
        showPopUp = nil
        placeName = ""
        isFavorite = false
    }
    
    func savePlaces(_ places: [MapPlaceModel]) {
        if let data = try? JSONEncoder().encode(places) {
            UserDefaults.standard.set(data, forKey: "savedPlaces")
        }
    }

    func loadPlaces() -> [MapPlaceModel] {
        if let data = UserDefaults.standard.data(forKey: "savedPlaces"),
           let places = try? JSONDecoder().decode([MapPlaceModel].self, from: data) {
            return places
        }
        return []
    }
}

#Preview {
    MapPlacesView()
}
