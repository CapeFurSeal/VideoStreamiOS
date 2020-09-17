//
//  TabbedView.swift
//  VideoStream
//
//  Created by Blake Loizides on 9/14/20.
//

import SwiftUI

struct TabbedView: View {
    var body: some View {
        TabView {
            VideoStreamView()
                .tabItem {
                    Image(systemName: "square.grid.2x2.fill")
                    Text("Home")
            } .tag(0)
        }
    }
}

struct DashboardView_Preview: PreviewProvider {
    static var previews: some View {
        TabbedView()
    }
}
