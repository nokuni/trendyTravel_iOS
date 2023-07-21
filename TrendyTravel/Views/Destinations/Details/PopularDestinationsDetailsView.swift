//
//  PopularDestinationsDetailsView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 17/07/2023.
//

import SwiftUI
import MapKit

struct PopularDestinationsDetailsView: View {
    @EnvironmentObject var activityVM: ActivityViewModel
    @EnvironmentObject private var destinationVM: DestinationViewModel
    var destination: Destination
    @State var region: MKCoordinateRegion
    @State var isShowingAttractions = true
    @State var selectedIndex: Int = 0
    
    init(destination: Destination) {
        self.destination = destination
        self.region = MKCoordinateRegion(
            center: .init(
                latitude: destination.latitude,
                longitude: destination.longitude
            ),
            span: .init(
                latitudeDelta: 0.07,
                longitudeDelta: 0.07
            )
        )
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            carouselHeader()
            nameAndRating()
            showMapActivityToggle()
            destinationMap()
        }
        .navigationBarTitle(destination.city, displayMode: .inline)
    }
    
    @ViewBuilder
    private func carouselHeader() -> some View {
        DestinationDetailCarouselHeader(selectedIndex: $selectedIndex,
                                        images: activityVM.activityImages(destination: destination))
        .frame(height: 250)
    }
    
    @ViewBuilder
    private func nameAndRating() -> some View {
        if activityVM.destinationActivities(destination: destination).isNotEmpty {
            HStack {
                Text(activityVM.activities[selectedIndex].name)
                    .font(.system(.callout, design: .default, weight: .bold))
                Spacer()
                StarRatingView(rating: activityVM.activities[selectedIndex].rating)
                
            }
            .padding(.horizontal)
        }
    }
    
    @ViewBuilder
    private func showMapActivityToggle() -> some View {
        HStack {
            Text(L10n.location)
                .font(.system(size: 18, weight: .semibold))
            Spacer()
            Button(action: {
                isShowingAttractions.toggle()
            }) {
                Text("\(isShowingAttractions ? L10n.hideActivities : L10n.showActivities)")
                    .font(.system(size: 12, weight: .semibold))
            }
            Toggle("", isOn: $isShowingAttractions)
                .labelsHidden()
        }
        .padding()
        .disabled(activityVM.destinationActivities(destination: destination).isEmpty)
    }
    
    @ViewBuilder
    private func destinationMap() -> some View {
        Map(coordinateRegion: $region,
            annotationItems: isShowingAttractions ? activityVM.destinationActivities(destination: destination) : []) { activity in
            MapAnnotation(coordinate: .init(latitude: activity.latitude, longitude: activity.longitude)) {
                CustomMapAnnotationView(activity: activity)
            }
        }
            .frame(height: 300)
    }
}

private struct PopularDestinationsDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularDestinationsDetailsView(destination: Destination.example)
    }
}
