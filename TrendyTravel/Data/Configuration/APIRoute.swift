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
    
    // MARK: Image
    let imageURL = "https://trendytravel.onrender.com/image"
    
    // MARK: Destinations - GET(all,id)
    var destinationsBaseURL: String { baseURL + "destinations/" }
    
    // MARK: Activities - GET(all,id)
    var activitiesBaseURL: String { baseURL + "activities/" }
    
    // MARK: Users - GET(all,id)/POST/PUT(id)/DELETE(id)
    var userBaseURL: String { baseURL + "users/" }
    
    // MARK: Followers - POST/DELETE(id)
    var followersBaseURL: String { baseURL + "followers/" }
    
    // MARK: Posts - GET(all,id)/POST/PUT(id)/DELETE(id)
    var postsBaseURL: String { baseURL + "posts/" }
    
    // MARK: Likes - POST/DELETE(id)
    var likesBaseURL: String { baseURL + "likes/" }
    
    // MARK: Reviews - GET(all,id)/POST/PUT(id)/DELETE(id)
    var reviewsBaseURL: String { baseURL + "reviews/" }
}
