//
//  SelectorTableViewCell.swift
//  Pryanik
//
//  Created by Mishana on 08.08.2022.
//

import UIKit

class SelectorTableViewCell: UITableViewCell {
    
    static var reuseId: String = "Selector"
    
    let segment: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(segment)
        
        setSegmentConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(data: Variant?) {
        guard let title = data?.text else { return }
        guard let id = data?.id else { return }
        segment.insertSegment(withTitle: title, at: id, animated: true)
    }
    
    func setSegmentConstraints() {
        segment.translatesAutoresizingMaskIntoConstraints                                              = false
        segment.centerYAnchor.constraint(equalTo: centerYAnchor).isActive                            = true
        segment.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive              = true
        segment.heightAnchor.constraint(equalToConstant: 80).isActive                                  = true
        segment.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive             = true
    }
}
