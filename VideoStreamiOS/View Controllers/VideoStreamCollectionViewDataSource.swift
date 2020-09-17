//
//  VideoStreamCollectionViewDataSource.swift
//  VideoStreamiOS
//
//  Created by Blake Loizides on 9/17/20.
//

import Foundation
import UIKit

class VideoStreamCollectionViewDataSource: NSObject {
    internal var sections = [Sections]()
}

extension VideoStreamCollectionViewDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].itemData?.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoStreamCollectionViewCell", for: indexPath) as? VideoStreamCollectionViewCell {
            cell.bindVideoStreamCollectionViewCell(itemData: sections[indexPath.section].itemData?[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "VideoStreamCollectionViewHeaderCell", for: indexPath) as? VideoStreamCollectionViewHeaderCell {
                sectionHeader.bindVideoStreamCollectionViewHeaderCell(section: sections[indexPath.section])
                return sectionHeader
            }
        } else {
            return UICollectionReusableView()
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width:collectionView.frame.size.width, height:30.0)
    }
}
