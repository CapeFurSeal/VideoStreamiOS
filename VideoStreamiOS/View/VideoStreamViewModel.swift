//
//  VideoStreamViewModel.swift
//  VideoStream
//
//  Created by Blake Loizides on 9/14/20.
//

import SwiftUI
import Combine

class VideoStreamViewModel: ObservableObject {
    private var webService = WebService()
    private var cancellableSet: Set<AnyCancellable> = []
    @Published var videoStreams: VideoStream?
    
    func getVideoStreams()  {
        webService
            .getSectionsPublisher()?
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { status in
                print(status)
            }) { [self] (streams) in
                videoStreams = streams
            }.store(in: &self.cancellableSet)
    }
}
