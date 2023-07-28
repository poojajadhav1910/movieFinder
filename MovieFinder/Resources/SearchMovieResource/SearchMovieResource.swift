//
//  SearchMovieResource.swift
//  MovieFinder
//
//  Created by POOJA SAGAR GARUD on 27/07/23.
//

import Foundation
struct SearchMovieResource {
    
    func searchMovie(name: String, completion: @escaping(_ result: SearchMovieResponse?) -> Void)
    {
         let apiManager = APIManager()
         let searchMovieRequest: SearchMovieRequest = SearchMovieRequest(query: name)
        
        let searchMovieEndpoint = URL(string: "\(Endpoints.baseUrl)\(Endpoints.searchMoviePath)")!
        var components = URLComponents(url: searchMovieEndpoint, resolvingAgainstBaseURL: false)
        components?.queryItems = searchMovieRequest.getURLQueryItems()

        apiManager.getApiData(requestUrl: (components?.url!)!, resultType: SearchMovieResponse.self) { (response) in

            completion(response)
        }
        
    }

}
