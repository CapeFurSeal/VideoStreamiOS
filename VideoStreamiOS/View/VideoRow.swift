//
//  VideoRow.swift
//  VideoStream
//
//  Created by Blake Loizides on 9/14/20.
//

import SwiftUI

struct VideoRow : View {
    var sectionName: String?
    var itemData: [ItemData]?
    
    var body: some View {
        guard let itemData = itemData else {
            return AnyView(EmptyView())
        }
        return AnyView(VStack(alignment: .leading) {
            sectionName.map ({Text($0)
                .font(.system(size: 15))
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .foregroundColor(.black)
            })
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top) {
                    ForEach(itemData,id: \.id) { item in
                        VideoItem(mediaData: item.mediaData, metaData: item.metaData)
                            .frame(width: 250)
                            .padding(.trailing, 10)
                            .clipped()
                    }
                }
            }
        })
    }
}

struct VideoRow_Preview: PreviewProvider {
    static var previews: some View {
        VideoRow(sectionName: "Latest", itemData: [ItemData]())
    }
}
