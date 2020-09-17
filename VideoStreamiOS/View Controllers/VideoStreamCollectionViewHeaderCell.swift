//
//  VideoStreamCollectionViewHeaderCell.swift
//  VideoStreamiOS
//
//  Created by Blake Loizides on 9/17/20.
//

import UIKit

class VideoStreamCollectionViewHeaderCell: UICollectionReusableView {
    
    @IBOutlet fileprivate weak var sectionNameLabel: UILabel?
    
    internal func bindVideoStreamCollectionViewHeaderCell(section: Sections) {
        guard let sectionName = section.name else {
            return
        }
        sectionNameLabel?.text = sectionName
        sectionNameLabel?.textColor =  UIColor.black
        sectionNameLabel?.font = UIFont.systemFont(ofSize: 15, weight:.bold)
        sectionNameLabel?.numberOfLines = 0
        sectionNameLabel?.textAlignment = .left
        sectionNameLabel?.lineBreakMode = .byTruncatingTail
    }
}
