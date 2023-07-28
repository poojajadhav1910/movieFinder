//
//  ViewController.swift
//  MovieFinder
//
//  Created by POOJA SAGAR GARUD on 26/07/23.
//

import UIKit

class SearchMovieViewController: UIViewController{
    var searchedMovie: [Movie] = []
    lazy var resource: SearchMovieResource = SearchMovieResource()
    var workItemReference : DispatchWorkItem? = nil
    var searching = false

    @IBOutlet weak var srcMovie: UISearchBar!
    @IBOutlet weak var tblMovie: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tblMovie.register(UINib(nibName: "SearchMovieTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchMovieCell")

        tblMovie.reloadData()
    }


}

