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
            internal static let title = NSLocalizedString("destinationView.schearchBar.title", comment: "")
        }
        internal enum NavigationBar {
            internal static let title = NSLocalizedString("destinationView.navigationBar.title", comment: "")
        }
    }
    internal enum CategoryDetailLoadingView {
        internal static let loarding = NSLocalizedString("categoryDetailLoadingView.loarding", comment: "")
    }
    internal enum PopularDestinationsView {
            internal static let title = NSLocalizedString("popularDestinationsView.title", comment: "")
            internal static let see_all = NSLocalizedString("popularDestinationsView.see_all", comment: "")
    }
    internal enum PopularDestinationsDetailsView {
        internal enum Toggle {
            internal static let title = NSLocalizedString("popularDestinationsDetailsView.toggle.title", comment: "")
            internal static let hide = NSLocalizedString("popularDestinationsDetailsView.toggle.hide", comment: "")
            internal static let show = NSLocalizedString("popularDestinationsDetailsView.toggle.show", comment: "")
        }
    }
    internal enum DiscoverView {
        internal enum SchearchBar {
            internal static let prompt = NSLocalizedString("discoverView.schearchBar.promt", comment: "")
        }
        internal enum NavigationBar {
            internal static let title = NSLocalizedString("discoverView.navigationBar.title", comment: "")
        }
    }
    internal enum TrendingCreatorsListView {
            internal static let title = NSLocalizedString("trendingCreatorsListView.title", comment: "")
            internal static let see_all = NSLocalizedString("trendingCreatorsListView.see_all", comment: "")
    }
    internal enum PopularRestaurantsView {
            internal static let title = NSLocalizedString("popularRestaurantsView.title", comment: "")
            internal static let see_all = NSLocalizedString("popularRestaurantsView.see_all", comment: "")
    }
    internal enum RestaurantDetailsView {
        internal static let content = NSLocalizedString("restaurantDetailsView.content", comment: "")
        internal static let title = NSLocalizedString("restaurantDetailsView.title", comment: "")
        internal static let name = NSLocalizedString("restaurantDetailsView.name", comment: "")
        internal static let navigationBar_title = NSLocalizedString("restaurantDetailsView.navigationBar_title", comment: "")
    }
    internal enum RestaurantTile {
        internal static let rate = NSLocalizedString("restaurantTile.rate", comment: "")
        internal static let name = NSLocalizedString("restaurantTile.name", comment: "")
    }
    internal enum ReviewList {
        internal static let title = NSLocalizedString("reviewList.title", comment: "")
        internal static let name = NSLocalizedString("reviewList.name", comment: "")
        internal static let date = NSLocalizedString("reviewList.date", comment: "")
    }
    internal enum MyProfileView {
        internal static let numero = NSLocalizedString("myProfileView.numero", comment: "")
        internal static let description = NSLocalizedString("myProfileView.description", comment: "")
        internal static let follow = NSLocalizedString("myProfileView.follow", comment: "")
        internal static let contact = NSLocalizedString("myProfileView.contact", comment: "")
        internal enum Followers {
            internal static let followers = NSLocalizedString("myProfileView.followers.numero", comment: "")
            internal static let numbers = NSLocalizedString("myProfileView.followers.numero", comment: "")
        }
        internal enum Following {
            internal static let following = NSLocalizedString("myProfileView.following.numero", comment: "")
            internal static let numbers = NSLocalizedString("myProfileView.following.numero", comment: "")
        }
    }
    internal enum UserDetailsView {
        internal static let numero = NSLocalizedString("userDetailsView.numero", comment: "")
        internal static let description = NSLocalizedString("userDetailsView.description", comment: "")
        internal static let follow = NSLocalizedString("userDetailsView.follow", comment: "")
        internal static let likes = NSLocalizedString("userDetailsView.likes", comment: "")
        internal static let contact = NSLocalizedString("userDetailsView.contact", comment: "")
        internal enum Followers {
            internal static let followers = NSLocalizedString("userDetailsView.followers.followers", comment: "")
            internal static let numbers = NSLocalizedString("userDetailsView.followers.numbers", comment: "")
        }
        internal enum Following {
            internal static let following = NSLocalizedString("userDetailsView.following.following", comment: "")
            internal static let numbers = NSLocalizedString("userDetailsView.following.numbers", comment: "")
        }
    }
    internal enum PostsListView {
        internal static let likes = NSLocalizedString("postsListView.likes", comment: "")
    }
    internal enum LoginView {
        internal static let signIn = NSLocalizedString("loginView.signIn", comment: "")
        internal static let signUp = NSLocalizedString("loginView.signUp", comment: "")
    }
    internal enum SignInView {
        internal static let logIn = NSLocalizedString("signInView.logIn", comment: "")
        internal static let email = NSLocalizedString("signInView.email", comment: "")
        internal static let password = NSLocalizedString("signInView.password", comment: "")
        internal static let connect = NSLocalizedString("signInView.connect", comment: "")
    }
    internal enum SignUpView {
        internal static let title = NSLocalizedString("signUpView.title", comment: "")
        internal static let full_name = NSLocalizedString("signUpView.full_name", comment: "")
        internal static let username = NSLocalizedString("signUpView.username", comment: "")
        internal static let email = NSLocalizedString("signUpView.email", comment: "")
        internal static let password = NSLocalizedString("signUpView.password", comment: "")
        internal static let register = NSLocalizedString("signUpView.register", comment: "")
    }
    internal enum DestinationsCategoriesView {
        internal static let culture = NSLocalizedString("destinationsCategoriesView.culture", comment: "")
        internal static let show = NSLocalizedString("destinationsCategoriesView.show", comment: "")
        internal static let sports = NSLocalizedString("destinationsCategoriesView.sports", comment: "")
        internal static let restaurant = NSLocalizedString("destinationsCategoriesView.restaurant", comment: "")
        internal static let bar = NSLocalizedString("destinationsCategoriesView.bar", comment: "")
    }
}
