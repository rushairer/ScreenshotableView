//
//  ContentView.swift
//  Example
//
//  Created by Abenx on 2020/7/15.
//

import SwiftUI
import ScreenshotableView

struct ContentView: View {

    @State private var sharedImage: UIImage?
    @State private var shotting = false
    @State private var showSheet = false
    
    var content: some View {
        Color.red
            .overlay(Text("Hello"))
            .background(Color.red)
            .frame(width: 200, height: 200, alignment: .center)
    }
    
    
    var body: some View {
        VStack {
            ScreenshotableView(shotting: self.$shotting,
                               completed: { screenshot in
                                self.sharedImage = screenshot
                                self.shotting = false
                                self.showSheet = true
            }) {
                self.content
                    .accessibility(identifier: "contentView")
            }
            Button("Snapshoot") {
                self.shotting = true
            }.sheet(isPresented: $showSheet) {
                Image(uiImage: self.sharedImage!)
                    .shadow(radius: 10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
