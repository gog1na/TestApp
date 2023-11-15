//
//  PersonDetailsViewController.swift
//  TestApp
//
//  Created by Giorgi Goginashvili on 11/15/23.
//

import UIKit
import Kingfisher

class PersonDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var person: Person?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    func setupUI() {
        guard let hex = person?.hex,
              let image = person?.imageUrl,
              let likeCount = person?.numHearts,
              let starCount = person?.numVotes,
              let commentCount = person?.numComments,
              let date = person?.dateCreated else { return }
        view.backgroundColor = UIColor(hex: hex)
        title = person?.title ?? ""
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        imageView.layer.cornerRadius = 20
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: URL(string: image))
        likeLabel.text = "\(likeCount)"
        starLabel.text = "\(starCount)"
        commentLabel.text = "\(commentCount)"
        dateLabel.text = "date created: \(date)"
        dateLabel.textColor = .white
    }

}
