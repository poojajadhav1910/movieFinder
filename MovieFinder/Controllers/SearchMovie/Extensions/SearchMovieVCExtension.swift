//
//  SearchMovieVCExtension.swift
//  MovieFinder
//
//  Created by POOJA SAGAR GARUD on 27/07/23.
//

import UIKit

extension SearchMovieViewController : UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        workItemReference?.cancel()
        // make api call to fetch the data
        if searchText == ""
        {
            self.clearSearchTable()
        }
        let movieSearchWorkItem = DispatchWorkItem
        {
            self.searchMovieWithName(movieName: searchText)
        }
        workItemReference = movieSearchWorkItem
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: movieSearchWorkItem)

    }

    private func searchMovieWithName(movieName: String)
    {
        resource.searchMovie(name: movieName, completion: { (response) in
            self.searchedMovie.removeAll()
            guard let movies = response?.movies, movies.count != 0 else {
                return
            }
            self.searchedMovie = movies
            self.searching = true

            DispatchQueue.main.async {
                self.tblMovie.reloadData()
            }
        })
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
        guard let text = searchBar.text, text.isEmpty == false else {
            return
        }
        searchBar.text = ""
        self.clearSearchTable()
    }
    func clearSearchTable()
    {
        searching = false
        tblMovie.reloadData()
        srcMovie.text
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if(searching){
            return searchedMovie.count
        }else{
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {

        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchMovieCell") as! SearchMovieCell
        if(searching) {
            let movie =  searchedMovie[indexPath.row]
            cell.lblTitle.text = movie.title
            cell.lblDescription.text = movie.overview == "" ? "Details not available" : movie.overview
            let posterPathString = Endpoints.imageBaseUrl + (movie.posterPath ?? "")
            let posterPathUrl = URL(string:posterPathString)!
            cell.imgMovie.loadImage(fromURL: posterPathUrl, placeHolderImage: "LaunchImage")

        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }
}
