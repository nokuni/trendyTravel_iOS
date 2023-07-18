//
//  Localizable.swift
//  TrendyTravel
//
//  Created by Amelie Pocchiolo on 18/07/2023.
//

import Foundation

internal enum L10n {
    internal enum DestinationView {
        internal enum SchearchBar {
            internal static let title = NSLocalizedString("Where do you want to go?", comment: "")
        }
        internal enum navigationBar {
            internal static let title = NSLocalizedString("Discover", comment: "")
        }
    }
    internal enum CategoryDetailLoadingView {
        internal static let loarding = NSLocalizedString("Loarding...", comment: "")
    }
    internal enum PopularDestinationsView {
        internal enum Section {
            internal static let title = NSLocalizedString("Popular Destinations", comment: "")
            internal static let see_all = NSLocalizedString("See all", comment: "")
        }
    }
    internal enum PopularDestinationsDetailsView {
        internal enum toggle {
            internal static let title = NSLocalizedString("Location", comment: "")
            internal static let hide = NSLocalizedString("Hide Attractions", comment: "")
            internal static let show = NSLocalizedString("Show Attractions", comment: "")
        }
    }
    internal enum DiscoverView {
        internal enum SchearchBar {
            internal static let prompt = NSLocalizedString("Where do you want to go?", comment: "")
        }
        internal enum navigationBar {
            internal static let title = NSLocalizedString("Discover", comment: "")
        }
    }
    internal enum TrendingCreatorsListView {
        internal enum Section {
            internal static let title = NSLocalizedString("Popular Restaurants", comment: "")
            internal static let see_all = NSLocalizedString("See all", comment: "")
        }
    }
    internal enum PopularRestaurantsView {
        internal enum Section {
            internal static let title = NSLocalizedString("Popular Restaurants", comment: "")
            internal static let see_all = NSLocalizedString("See all", comment: "")
        }
    }
    internal enum RestaurantDetailsView {
        internal static let content = NSLocalizedString("Very good restaurant with typical Tokyo habitants and amazing food", comment: "")
        internal static let title = NSLocalizedString("Location & Description", comment: "")
        internal static let name = NSLocalizedString("Tokyo, Japan", comment: "")
        internal static let navigationBar_title = NSLocalizedString("Restaurant Details", comment: "")
    }
    internal enum RestaurantTile {
        internal static let rate = NSLocalizedString("4.7", comment: "")
        internal static let name = NSLocalizedString("Tokyo, Japan", comment: "")
    }
    internal enum ReviewList {
        internal static let title = NSLocalizedString("Customer Reviews", comment: "")
        internal static let name = NSLocalizedString("Billy Jones", comment: "")
        internal static let date = NSLocalizedString("Dec 2020", comment: "")
    }
    internal enum myProfileView {
        internal static let numero = NSLocalizedString("2541", comment: "")
        internal static let description = NSLocalizedString("YouTuber, Vlogger, Travel Creator", comment: "")
        internal static let follow = NSLocalizedString("Follow", comment: "")
        internal static let contact = NSLocalizedString("Contact", comment: "")
        internal enum followers {
            internal static let followers = NSLocalizedString("Followers", comment: "")
            internal static let numbers = NSLocalizedString("3", comment: "")
        }
        internal enum following {
            internal static let following = NSLocalizedString("Following", comment: "")
            internal static let numbers = NSLocalizedString("2", comment: "")
        }
    }
    internal enum userDetailsView {
        internal static let numero = NSLocalizedString("2541", comment: "")
        internal static let description = NSLocalizedString("YouTuber, Vlogger, Travel Creator", comment: "")
        internal static let follow = NSLocalizedString("Follow", comment: "")
        internal static let likes = NSLocalizedString("102 likes", comment: "")
        internal static let contact = NSLocalizedString("Contact", comment: "")
        internal enum Followers {
            internal static let followers = NSLocalizedString("Followers", comment: "")
            internal static let numbers = NSLocalizedString("3", comment: "")
        }
        internal enum Following {
            internal static let following = NSLocalizedString("Following", comment: "")
            internal static let numbers = NSLocalizedString("2", comment: "")
        }
    }
    internal enum PostsListView {
        internal static let likes = NSLocalizedString("102 likes", comment: "")
    }
    internal enum LoginView {
        internal static let signIn = NSLocalizedString("Sign In", comment: "")
        internal static let signUp = NSLocalizedString("Sign Up", comment: "")
    }
    internal enum SignInView {
        internal static let logIn = NSLocalizedString("Log in", comment: "")
        internal static let email = NSLocalizedString("Email", comment: "")
        internal static let password = NSLocalizedString("Password", comment: "")
        internal static let connect = NSLocalizedString("Connect", comment: "")
    }
    internal enum SignUpView {
        internal static let title = NSLocalizedString("Create an account", comment: "")
        internal static let full_name = NSLocalizedString("Create an accFull name", comment: "")
        internal static let username = NSLocalizedString("Username", comment: "")
        internal static let email = NSLocalizedString("Email", comment: "")
        internal static let password = NSLocalizedString("Password", comment: "")
        internal static let register = NSLocalizedString("Register", comment: "")
    }
}
