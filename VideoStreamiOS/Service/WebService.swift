//
//  WebService.swift
//  VideoStream
//
//  Created by Blake Loizides on 9/14/20.
//

import Foundation
import Combine

class WebService {
    
    var baseUrl = URL(string: "https://thefa-cm.streamamg.com/api/v1/a7abf1f6-b3d5-4dea-89f4-5141ff264bfa/6ln63lARRtIkiJF0LiyvQTBiKBtLmHscrT71Or3Mmc4wb85l8J/en/feed/d040fcda-0a39-4c25-b50e-2808f3308bde/sections/")
    
    private var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    private var session: URLSession = {
        let config = URLSessionConfiguration.default
        config.urlCache = URLCache.shared
        config.waitsForConnectivity = true
        config.requestCachePolicy = .returnCacheDataElseLoad
        return URLSession(configuration: config, delegate: nil, delegateQueue: nil)
    }()
    
    private func createPublisher(for url: URL) -> AnyPublisher<VideoStream, Error> {
        return session.dataTaskPublisher(for: url)
            .map({$0.data})
            .decode(type: VideoStream.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
    func getSectionsPublisher() -> AnyPublisher<(VideoStream), Error>? {
        guard let baseUrl = baseUrl else {
            return nil
        }
        return createPublisher(for: baseUrl)
    }
}
