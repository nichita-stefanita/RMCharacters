//
//  CharacterTableViewCell.swift
//  RM Characters
//
//  Created by Nichita Stefanita on 07.10.2021.
//

import UIKit
import SDWebImage

class CharacterTableViewCell: UITableViewCell {

    
    @IBOutlet weak private var photoImageView: UIImageView!
    
    @IBOutlet weak private var shadowView: UIView!
    // MARK: Labels
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var originLabel: UILabel!
    @IBOutlet weak private var episodeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setShadow()
    }
    
    public func cellSetup(model: Character) {
        nameLabel.text = model.name
        originLabel.text = model.originLocation.name
        photoImageView.sd_setImage(with: URL(string: model.photoURL), placeholderImage: UIImage(systemName: "person"))
    }
    
    private func setShadow() {
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowColor = UIColor.gray.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 10, height: 1)
        shadowView.layer.shadowOpacity = 0.7
        shadowView.layer.shadowRadius = 10
    }
}
