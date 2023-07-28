//
//  APIManager.swift
//  MovieFinder
//
//  Created by POOJA SAGAR GARUD on 27/07/23.
//

import Foundation

struct APIManager
{
    func getApiData<T:Decodable>(requestUrl: URL,resultType: T.Type, completionHandler:@escaping(_ result: T?)-> Void)
    {

        let header = ["Authorization": "Bearer \(Header.authorizationToken)"]
        var urlRequest = URLRequest(url: requestUrl, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60.0)
        urlRequest.allHTTPHeaderFields = header
        urlRequest.httpMethod = "GET"
        URLSession.shared.dataTask(with: urlRequest) { (responseData, httpUrlResponse, error) in
            if(error == nil && responseData != nil && responseData?.count != 0)
            {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: responseData!)
                    _=completionHandler(result)
                }
                catch let error{
                    debugPrint("error occured while decoding = \(error)")
                }
            }
        }.resume()
    }
}
