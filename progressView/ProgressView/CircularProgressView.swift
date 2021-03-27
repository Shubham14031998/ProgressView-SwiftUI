//
//  CircularProgressView.swift
//  ProgressView
//
//  Created by Shubham Kaliyar on 27/03/21.

import SwiftUI


struct CircularProgressView: View {
    @State var progressValue: CGFloat = 0.0
    @State var angleValue: CGFloat = 0.0
    var progressChange : (CGFloat) -> ()

    let config = CircularData()
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: config.radius * 2, height: config.radius * 2)
                .scaleEffect(1.2)
            Circle()
                .stroke(Color.gray,lineWidth: 5)
                .frame(width: config.radius * 2, height: config.radius * 2)
            Circle()
                .trim(from: 0.0, to: progressValue/config.totalValue)
                .stroke(Color.blue, lineWidth: 4)
                .frame(width: config.radius * 2, height: config.radius * 2)
                .rotationEffect(.degrees(-90))
            
            Circle()
                .fill(Color.blue)
                .frame(width: config.knobRadius * 2, height: config.knobRadius * 2)
                .padding(10)
                .offset(y: -config.radius)
                .rotationEffect(Angle.degrees(Double(angleValue)))
                .gesture(DragGesture(minimumDistance: 0.0)
                            .onChanged({ value in
                                change(location: value.location)
                            }))
            
            Text("\(Int(progressValue))")
                            .font(.system(size: 60))
                .foregroundColor(.white)
        }
    }
    
    private func change(location: CGPoint) {
        let vector = CGVector(dx: location.x, dy: location.y)
        let angle = atan2(vector.dy - (config.knobRadius + 10), vector.dx - (config.knobRadius + 10)) + .pi/2.0
        let fixedAngle = angle < 0.0 ? angle + 2.0 * .pi : angle
        let value = fixedAngle / (2.0 * .pi) * config.totalValue
        if value >= config.minimumValue && value <= config.maximumValue {
            progressValue = value
            angleValue = fixedAngle * 180 / .pi
            self.progressChange(progressValue)
        }
    }
}

struct CircularData {
    let minimumValue: CGFloat = 0.0
    let maximumValue: CGFloat = 100.0
    let totalValue: CGFloat = 100.0
    let knobRadius: CGFloat = 15.0
    let radius: CGFloat = 125.0
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView { (value) in
            print(value)
        }
    }
}
