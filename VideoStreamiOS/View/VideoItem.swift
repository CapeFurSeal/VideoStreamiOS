//
//  VideoItem.swift
//  VideoStream
//
//  Created by Blake Loizides on 9/14/20.
//

import SwiftUI
import KingfisherSwiftUI

struct VideoItem : View {
    
    var mediaData: MediaData?
    var metaData: MetaData?
    
    var body: some View {
        guard let mediaData = mediaData, let metaData = metaData else {
            return AnyView(EmptyView())
        }
        guard let thumbnailUrlString = mediaData.thumbnailUrl, let title = metaData.title else {
            return AnyView(EmptyView())
        }
        guard let thumbnailUrl = URL(string: thumbnailUrlString) else {
            return AnyView(EmptyView())
        }
        guard let coreCategories = metaData.coreCategories else {
            return AnyView(EmptyView())
        }
        return AnyView(VStack(alignment: .leading, spacing: 10) {
            KFImage(thumbnailUrl)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 150)
                .clipped()
            VStack(alignment: .leading, spacing: 5) {
                Text(coreCategories.joined(separator: ", "))
                    .font(.system(size: 15))
                    .fontWeight(.regular)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.gray)
                Text(title)
                    .font(.system(size: 15))
                    .fontWeight(.regular)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black)
                    .lineLimit(2)
                    .frame(height: 40)
            }
        })
    }
}
