//
//  ViewController.swift
//  VideoStreamiOS
//
//  Created by Blake Loizides on 9/17/20.
//

import UIKit

class VideoStreamViewController: UIViewController {
    
    @IBOutlet fileprivate weak var videoStreamCollectionView: UICollectionView?
    fileprivate lazy var dataSource = VideoStreamCollectionViewDataSource()
    fileprivate var viewModel: VideoStreamViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    fileprivate func setupCollectionView() {
        
        if let videoStreamCollectionView = videoStreamCollectionView {
            videoStreamCollectionView.delegate = self
            videoStreamCollectionView.dataSource = dataSource
            videoStreamCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
            videoStreamCollectionView.collectionViewLayout = createLayout()
        }
        
        viewModel = VideoStreamViewModel(dataSource: dataSource)
        viewModel?.getVideoStreams(reload: {
            self.videoStreamCollectionView?.reloadData()
        })
    }
}

extension VideoStreamViewController: UICollectionViewDelegate {
    func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { (index, env) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .estimated(100))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
                                                   heightDimension: .estimated(100))
            let spacing = CGFloat(20)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                           subitems: [item])
            group.interItemSpacing = .fixed(spacing)
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = spacing
            section.orthogonalScrollingBehavior = .groupPagingCentered
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                    heightDimension: .absolute(30))
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                     elementKind: UICollectionView.elementKindSectionHeader,
                                                                     alignment: .top)
            section.boundarySupplementaryItems = [header]
            return section
        }
    }
}


