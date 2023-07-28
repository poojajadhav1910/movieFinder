//
//  SearchMovieRequest.swift
//  MovieFinder
//
//  Created by POOJA SAGAR GARUD on 27/07/23.
//

import Foundation
struct SearchMovieRequest: Encodable {
    
    var query: String
    let page: Int32 = 1
    let includeAdult: Bool = false
    let language, primaryReleaseYear, region, year: String?
    
    init(query: String) {
        self.query = query
        language = ""
        primaryReleaseYear = ""
        region = ""
        year = ""
    }

    enum CodingKeys: String, CodingKey {
        case query, page, includeAdult, language, year, region
        case primaryReleaseYear = "primary_release_year"
    }
}

