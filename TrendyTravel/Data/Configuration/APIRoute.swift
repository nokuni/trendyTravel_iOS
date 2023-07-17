//
//  APIRoute.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 17/07/2023.
//

import Utility_Toolbox

struct APIRoute {
    
    let manager = APIManager()
    
    // MARK: CORE
    let baseURL = "https://trendytravel.onrender.com/"
    
    // MARK: Destinations - GET(all,id)
    let destinationsBaseURL = "https://trendytravel.onrender.com/destinations"
    
    // MARK: Activities - GET(all,id)
    let activitiesBaseURL = "https://trendytravel.onrender.com/destinations"
    
    // MARK: Users - GET(all,id)/POST/PUT(id)/DELETE(id)
    let userBaseURL = "https://trendytravel.onrender.com/users"
    
    // MARK: Followers - POST/DELETE(id)
    let followersBaseURL = "https://trendytravel.onrender.com/followers"
    
    // MARK: Posts - GET(all,id)/POST/PUT(id)/DELETE(id)
    let postsBaseURL = "https://trendytravel.onrender.com/posts"
    
    // MARK: Likes - POST/DELETE(id)
    let likesBaseURL = "https://trendytravel.onrender.com/likes"
    
    // MARK: Reviews - GET(all,id)/POST/PUT(id)/DELETE(id)
    let reviewsBaseURL = "https://trendytravel.onrender.com/reviews"
}
