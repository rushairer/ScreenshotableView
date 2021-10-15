//
//  ContentView.swift
//  Example
//
//  Created by Abenx on 2020/7/15.
//

import SwiftUI
import ScreenshotableView

struct ContentView: View {
    
    @State private var screenImage: ScreenImage?
    @State private var shotting = false
    @State private var showSheet = false
    
    struct ScreenImage: Identifiable {
        let id = UUID()
        let image: UIImage
    }
    
    var content: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(LinearGradient(colors: [.red, .orange, .yellow, .green, .blue, .purple],
                                 startPoint: UnitPoint(x: 1.00, y: 0.00),
                                 endPoint: UnitPoint(x: 1.00, y: 1.00)))
            .overlay(Text("github.com/rushairer"))
            .frame(width: 200, height: 2000, alignment: .center)
    }
    
    var body: some View {
        ZStack {
            
            ScreenshotableView(shotting: self.$shotting,
                               completed: { screenshot in
                screenImage = ScreenImage(image: screenshot)
                shotting = false
                showSheet = true
            }) {
                content
                    .accessibility(identifier: "contentView")
            }
            Button {
                shotting = true
            } label: {
                Text("Click me to Snapshoot")
                    .padding(80)
            }
            .background(Color.white)
            .cornerRadius(14)
        }
        // Fix for XCode 12.x +. https://github.com/rushairer/ScreenshotableView/issues/1
        .sheet(item: $screenImage) { screenImage in
            Image(uiImage: screenImage.image)
                .resizable()
                .scaledToFit()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
