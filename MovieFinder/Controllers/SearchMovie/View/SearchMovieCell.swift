//
//  SearchMovieCell.swift
//  MovieFinder
//
//  Created by POOJA SAGAR GARUD on 27/07/23.
//

import UIKit
class SearchMovieCell: UITableViewCell {
    @IBOutlet weak var imgMovie: LazyImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
