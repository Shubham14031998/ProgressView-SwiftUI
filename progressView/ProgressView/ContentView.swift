//
//  ContentView.swift
//  ProgressView
//
//  Created by Shubham Kaliyar on 27/03/21.
//

import SwiftUI

struct ContentView: View {
    @State private var progressvalue: Double = 0
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Custom progressBar").font(.title).padding(.top,50)
            Text("Slider Value : \(Int(progressvalue))")
            Spacer()
            ProgressView(progressValue: CGFloat(progressvalue/100))
            Slider(value: $progressvalue, in: 10...100)
            Spacer()
            CircularProgressView(progressChange: self.progressChange).padding(.top,-150)
        }.padding(.all, 16)
    }
    
    func progressChange(value:CGFloat) {
        self.progressvalue = Double(value)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
