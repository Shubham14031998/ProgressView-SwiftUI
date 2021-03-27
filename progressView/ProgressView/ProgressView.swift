//
//  ProgressView.swift
//  ProgressView
//
//  Created by Shubham Kaliyar on 27/03/21.
//

import SwiftUI

struct ProgressView: View {
    var progressValue: CGFloat

    var body: some View {
        GeometryReader { geometry in
            let sliderHeight = geometry.size.height
            let sliderWidth = geometry.size.width
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.blue.opacity(0.2))
                    .frame(width: sliderWidth,
                           height: sliderHeight)
                    .cornerRadius(sliderHeight / 2.0)
                Rectangle()
                    .foregroundColor(Color.blue)
                    .frame(width: sliderWidth * self.progressValue,
                           height: sliderHeight)
                    .cornerRadius(sliderHeight / 2.0)
            }
        }.frame(height: 18).padding(.top , -100)
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(progressValue: 0)
    }
}
