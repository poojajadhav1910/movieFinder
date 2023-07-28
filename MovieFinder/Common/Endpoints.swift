//
//  Endpoints.swift
//  ComponentsDemo
//
//  Created by CodeCat15 on 5/28/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation
struct Header
{
    static let contentType = "application/json"
    static let authorizationToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhYjUwNWIzYjg3NTkyZGY4YmU5MmYzOWZkN2E4Y2M5MyIsInN1YiI6IjY0YzExMjdlMmYxYmUwMDBlYmQ1NjRhZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BfRv26NGn-wyKDjtj7YeEMPAsUbJ6oML8TiNmFnMLbA"
}
struct Endpoints
{
    static let baseUrl = "https://api.themoviedb.org/3/"
    static let searchMoviePath = "search/movie"
    static let imageBaseUrl = "https://image.tmdb.org/t/p/w500"
}
