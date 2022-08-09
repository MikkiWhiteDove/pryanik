//
//  HZTableViewCell.swift
//  Pryanik
//
//  Created by Mishana on 08.08.2022.
//

import UIKit

class HZTableViewCell: UITableViewCell {

    static var reuseId: String = "HZ"
    
    var titleLabel  = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleLabel)
        
        configureLabel()
        setLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(data: DataNames?) {
        titleLabel.text = data?.text
    }
    
    func configureLabel() {
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints                                              = false
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive                              = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive                = true
        titleLabel.heightAnchor.constraint(equalToConstant: 80).isActive                                  = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive             = true
    }
}

