//
//  VideoStreamCollectionViewCell.swift
//  VideoStreamiOS
//
//  Created by Blake Loizides on 9/17/20.
//

import UIKit
import Kingfisher

class VideoStreamCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet fileprivate weak var categoriesLabel: UILabel?
    @IBOutlet fileprivate weak var titleLabel: UILabel?
    @IBOutlet fileprivate weak var videoImageView: UIImageView?
    
    override func awakeFromNib() {
      super.awakeFromNib()
      self.setupVideoStreamCollectionViewCell()
    }
    
    internal func setupVideoStreamCollectionViewCell() {
        categoriesLabel?.textColor =  UIColor.lightGray
        categoriesLabel?.font = UIFont.systemFont(ofSize: 15, weight:.regular)
        categoriesLabel?.numberOfLines = 0
        categoriesLabel?.textAlignment = .left
        categoriesLabel?.lineBreakMode = .byTruncatingTail
        
        titleLabel?.textColor =  UIColor.black
        titleLabel?.font = UIFont.systemFont(ofSize: 15, weight:.regular)
        titleLabel?.numberOfLines = 0
        titleLabel?.textAlignment = .left
        titleLabel?.lineBreakMode = .byTruncatingTail
        
        videoImageView?.contentMode = .scaleAspectFill
    }
    
    internal func bindVideoStreamCollectionViewCell(itemData: ItemData?) {
        if let coreCategories = itemData?.metaData?.coreCategories?.joined(separator: ", ") {
            categoriesLabel?.text = coreCategories
        }
        if let title = itemData?.metaData?.title {
            titleLabel?.text = title
        }
        guard let thumbnailUrlString = itemData?.mediaData?.thumbnailUrl else {
            return
        }
        guard let thumbnailUrl = URL(string: thumbnailUrlString) else {
            return
        }
        videoImageView?.kf.setImage(with: ImageResource(downloadURL: thumbnailUrl))
    }
    
    fileprivate func setCategoriesLabel(itemData: ItemData?) {
        guard let coreCategories = itemData?.metaData?.coreCategories?.joined(separator: ", ") else {
            return
        }
        categoriesLabel?.text = coreCategories
    }
}
