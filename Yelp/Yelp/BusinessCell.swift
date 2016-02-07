//
//  BusinessCell.swift
//  Yelp
//
//  Created by Chase McCoy on 2/6/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {
  @IBOutlet var thumbnail: UIImageView!
  @IBOutlet var ratingImageView: UIImageView!

  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var distanceLabel: UILabel!
  @IBOutlet var reviewsLabel: UILabel!
  @IBOutlet var addressLabel: UILabel!
  @IBOutlet var categoriesLabel: UILabel!
  
  var business: Business! {
    didSet {
      thumbnail.setImageWithURL(business.imageURL!)
      ratingImageView.setImageWithURL(business.ratingImageURL!)
      
      nameLabel.text = business.name
      distanceLabel.text = business.distance
      reviewsLabel.text = "\(business.reviewCount!) Reviews"
      addressLabel.text = business.address
      categoriesLabel.text = business.categories
    }
  }
  
  override func awakeFromNib() {
    thumbnail.layer.cornerRadius = 5
    thumbnail.clipsToBounds = true
    
    nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
  }
  
}
