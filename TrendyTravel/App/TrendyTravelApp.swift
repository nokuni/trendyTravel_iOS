//
//  TrendyTravelApp.swift
//  TrendyTravel
//
//  Created by Julie Collazos on 26/06/2023.
//

import SwiftUI

@main
struct TrendyTravelApp: App {
    @StateObject var destinationVM = DestinationViewModel()
    @StateObject var activityVM = ActivityViewModel()
    @StateObject var userVM = UserViewModel()
    var body: some Scene {
        WindowGroup {
            ZStack {
                if userVM.isUserConnected {
                    DiscoverView()
                } else {
                    LoginView()
                }
            }
            .environmentObject(destinationVM)
            .environmentObject(activityVM)
            .environmentObject(userVM)
        }
    }
}
