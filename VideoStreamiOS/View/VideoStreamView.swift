//
//  VideoStreamView.swift
//  VideoStream
//
//  Created by Blake Loizides on 9/14/20.
//

import SwiftUI
import Combine

struct VideoStreamView : View {
    @ObservedObject var viewModel = VideoStreamViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical , showsIndicators: false) {
                VStack {
                    VStack {
                        ForEach(viewModel.videoStreams?.sections ?? [Sections](), id: \.id) { section in
                            VideoRow(sectionName: section.name, itemData:section.itemData)
                                .frame(height: 250)
                                .padding(EdgeInsets(top: 20,
                                                    leading: 20,
                                                    bottom: 0,
                                                    trailing: 20))
                        }
                    }
                }
                .navigationBarTitle(Text("Video streams"))
            }
        }.onAppear() {
            viewModel.getVideoStreams()
        }
    }
}

struct VideoStreamView_Preview: PreviewProvider {
    static var previews: some View {
        VideoStreamView()
    }
}
