//
//  Localizable.swift
//  TrendyTravel
//
//  Created by Amelie Pocchiolo on 18/07/2023.
//

import Foundation

// internal is implemented by default on every class, struct, class, enum, etc...
// No need to say it explicitly.

enum L10n {
    enum DestinationView {
        enum SchearchBar {
            static let title = NSLocalizedString("destinationView.schearchBar.title", comment: "")
        }
        enum NavigationBar {
            static let title = NSLocalizedString("destinationView.navigationBar.title", comment: "")
        }
    }
    
    enum CategoryDetailLoadingView {
        static let loarding = NSLocalizedString("categoryDetailLoadingView.loarding", comment: "")
    }
    
    enum PopularDestinationsView {
        static let title = NSLocalizedString("popularDestinationsView.title", comment: "")
        static let see_all = NSLocalizedString("popularDestinationsView.see_all", comment: "")
    }
    
    enum PopularDestinationsDetailsView {
        enum Toggle {
            static let title = NSLocalizedString("popularDestinationsDetailsView.toggle.title", comment: "")
            static let hide = NSLocalizedString("popularDestinationsDetailsView.toggle.hide", comment: "")
            static let show = NSLocalizedString("popularDestinationsDetailsView.toggle.show", comment: "")
        }
    }
    
    enum DiscoverView {
        enum SchearchBar {
            static let prompt = NSLocalizedString("discoverView.schearchBar.promt", comment: "")
        }
        enum NavigationBar {
            static let title = NSLocalizedString("discoverView.navigationBar.title", comment: "")
        }
    }
    
    enum TrendingCreatorsListView {
        static let title = NSLocalizedString("trendingCreatorsListView.title", comment: "")
        static let see_all = NSLocalizedString("trendingCreatorsListView.see_all", comment: "")
    }
    
    enum PopularRestaurantsView {
        static let title = NSLocalizedString("popularRestaurantsView.title", comment: "")
        static let see_all = NSLocalizedString("popularRestaurantsView.see_all", comment: "")
    }
    
    enum RestaurantDetailsView {
        static let content = NSLocalizedString("restaurantDetailsView.content", comment: "")
        static let title = NSLocalizedString("restaurantDetailsView.title", comment: "")
        static let navigationBar_title = NSLocalizedString("restaurantDetailsView.navigationBar_title", comment: "")
    }
    
    enum ReviewList {
        static let title = NSLocalizedString("reviewList.title", comment: "")
    }
    
    enum MyProfileView {
        static let follow = NSLocalizedString("myProfileView.follow", comment: "")
        static let contact = NSLocalizedString("myProfileView.contact", comment: "")
        enum Followers {
            static let followers = NSLocalizedString("myProfileView.followers.numero", comment: "")
        }
        enum Following {
            static let following = NSLocalizedString("myProfileView.following.numero", comment: "")
        }
    }
    
    enum UserDetailsView {
        static let follow = NSLocalizedString("userDetailsView.follow", comment: "")
        static let likes = NSLocalizedString("userDetailsView.likes", comment: "")
        static let contact = NSLocalizedString("userDetailsView.contact", comment: "")
        enum Followers {
            static let followers = NSLocalizedString("userDetailsView.followers.followers", comment: "")
        }
        enum Following {
            static let following = NSLocalizedString("userDetailsView.following.following", comment: "")
        }
    }
    
    enum PostsListView {
        static let likes = NSLocalizedString("postsListView.likes", comment: "")
    }
    
    enum LoginView {
        static let signIn = NSLocalizedString("loginView.signIn", comment: "")
        static let signUp = NSLocalizedString("loginView.signUp", comment: "")
    }
    
    enum SignInView {
        static let logIn = NSLocalizedString("signInView.logIn", comment: "")
        static let email = NSLocalizedString("signInView.email", comment: "")
        static let password = NSLocalizedString("signInView.password", comment: "")
        static let connect = NSLocalizedString("signInView.connect", comment: "")
    }
    
    enum SignUpView {
        static let title = NSLocalizedString("signUpView.title", comment: "")
        static let full_name = NSLocalizedString("signUpView.full_name", comment: "")
        static let username = NSLocalizedString("signUpView.username", comment: "")
        static let email = NSLocalizedString("signUpView.email", comment: "")
        static let password = NSLocalizedString("signUpView.password", comment: "")
        static let register = NSLocalizedString("signUpView.register", comment: "")
    }
    
    enum DestinationsCategoriesView {
        static let culture = NSLocalizedString("destinationsCategoriesView.culture", comment: "")
        static let show = NSLocalizedString("destinationsCategoriesView.show", comment: "")
        static let sports = NSLocalizedString("destinationsCategoriesView.sports", comment: "")
        static let restaurant = NSLocalizedString("destinationsCategoriesView.restaurant", comment: "")
        static let bar = NSLocalizedString("destinationsCategoriesView.bar", comment: "")
    }
}
