//
//  PictureTableViewCell.swift
//  Pryanik
//
//  Created by Mishana on 08.08.2022.
//

import UIKit
import SDWebImage


class PictureTableViewCell: UITableViewCell {
    
    static var reuseId: String = "Picture"
    
    var pictureImage = UIImageView()
    var titleLabel  = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(pictureImage)
        addSubview(titleLabel)
        
        configureImageView()
        configureLabel()
        setImageConstraints()
        setLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(data: DataNames?) {
        pictureImage.image = urlPhoto(data: data?.url)
        titleLabel.text = data?.text
    }
    
    func configureImageView() {
        pictureImage.layer.cornerRadius = 10
        pictureImage.clipsToBounds = true
        
    }
    
    func configureLabel() {
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints() {
        pictureImage.translatesAutoresizingMaskIntoConstraints                                              = false
        pictureImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive                              = true
        pictureImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive                = true
        pictureImage.heightAnchor.constraint(equalToConstant: 80).isActive                                  = true
        pictureImage.widthAnchor.constraint(equalTo: pictureImage.heightAnchor, multiplier: 16/9).isActive  = true
    }
    
    func setLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints                                              = false
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive                              = true
        titleLabel.leadingAnchor.constraint(equalTo: pictureImage.trailingAnchor, constant: 20).isActive  = true
        titleLabel.heightAnchor.constraint(equalToConstant: 80).isActive                                  = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive             = true
    }
    
    func urlPhoto(data: String?) -> UIImage{
        guard let data = data else {return UIImage()}
        let url = URL(string: data)
        pictureImage.sd_setImage(with: url, completed: nil)
        return UIImage()
    }
}
