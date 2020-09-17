//
//  VideoStreamViewModel.swift
//  VideoStream
//
//  Created by Blake Loizides on 9/14/20.
//

import Foundation
import Combine

class VideoStreamViewModel: ObservableObject {
    private var webService = WebService()
    private var cancellableSet: Set<AnyCancellable> = []
    @Published var videoStreams: VideoStream?
    internal weak var dataSource: VideoStreamCollectionViewDataSource?
    
    init(dataSource: VideoStreamCollectionViewDataSource?) {
      self.dataSource = dataSource
    }
    
    func getVideoStreams(reload: @escaping () -> ())  {
        webService
            .getSectionsPublisher()?
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { status in
                print(status)
            }) { [self] (streams) in
                videoStreams = streams
                if let sections = videoStreams?.sections {
                    self.dataSource?.sections = sections
                    reload()
                }
            }.store(in: &self.cancellableSet)
    }
}
