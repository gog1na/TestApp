//
//  PersonTableViewCell.swift
//  TestApp
//
//  Created by Giorgi Goginashvili on 11/15/23.
//

import UIKit
import Kingfisher
import SDWebImage

class PersonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageVIew: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userNameLabel.textColor = .black
        imageVIew.layer.cornerRadius = 40
        imageVIew.layer.borderWidth = 1
        imageVIew.layer.borderColor = UIColor.black.cgColor
        imageVIew.sizeToFit()
    }

    func configure(with person: Person) {
        guard let image = person.imageUrl else { return }
        imageVIew.kf.indicatorType = .activity
        imageVIew.kf.setImage(with: URL(string: image), options: [.fromMemoryCacheOrRefresh])
        
        userNameLabel.text = person.title
    }
    
}
