//
//  Track.swift
//  WaterTracker
//
//

import SwiftUI
import WatchConnectivity

struct SwiftUIView: View {


@State private var totalLitersDrank: Double = 0.0
private let goalLiters: Double = 2.7 // Set your daily goal here
@State private var incrementValue: Double = 0.10

var body: some View {
    VStack {
       
        CircleProgressBar(progress: CGFloat(totalLitersDrank / goalLiters), totalLiters: totalLitersDrank)
            .frame(width: 300, height: 300)
            .padding()

        // Display total liters drank
        Text(String(format: "%.2f / %.2f Liters", totalLitersDrank, goalLiters))
            .padding()

        // Button to add water
        Button(action: {
            // Function to add water
           addWater(amount: incrementValue)
        }) {
            Text("Add \(incrementValue, specifier: "%.1f") Liters")
                .padding()
        }

        
        Button(action: {
            
            subtractWater(amount: incrementValue)
        }) {
            Text("Subtract \(incrementValue, specifier: "%.1f") Liters")
                .padding()
        }
    }
}

private func addWater(amount: Double) {
    withAnimation {
       totalLitersDrank += amount
    }
}

private func subtractWater(amount: Double) {
    withAnimation {
        totalLitersDrank -= amount
        if totalLitersDrank < 0 {
            totalLitersDrank = 0
        }
    }
}
}

struct CircleProgressBar: View {
var progress: CGFloat
var totalLiters: Double

private var emoji: String {
    let progressPercentage = Int(progress * 100)

    switch progressPercentage {
    case 0..<25:
        return "😴"
    case 25..<50:
        return "😃"
    case 50..<75:
        return "😁"
    case 75..<100:
        return "😍"
    default:
        return "🥳"
    }
}

var body: some View {
    ZStack {
        Circle()
            .stroke(lineWidth: 50.0)
            .opacity(0.3)
            .foregroundColor(Color.gray)

        Circle()
            .trim(from: 0.0, to: min(progress, 1.0))
            .stroke(style: StrokeStyle(lineWidth: 50.0, lineCap: .round, lineJoin: .round))
            .foregroundColor(Color.blue)
            .rotationEffect(Angle(degrees: 270.0))
            .overlay(
                emojiOverlay
            )
    }
}

private var emojiOverlay: some View {
    GeometryReader { geometry in
        let angle = 360 * progress - 90 // Starting angle of the progress bar

        // Check if progress is complete and adjust the position accordingly
        let xPosition: CGFloat
        let yPosition: CGFloat

        if progress >= 1.0 {
            // If progress is complete, position emoji in the center
            xPosition = geometry.size.width / 2
            yPosition = geometry.size.height / 2
        } else {
            // If progress is not complete, position emoji based on angle
            xPosition = geometry.size.width / 2 + (geometry.size.width / 2) * cos(angle * .pi / 180)
            yPosition = geometry.size.height / 2 + (geometry.size.height / 2) * sin(angle * .pi / 180)
        }

        return Text(emoji)
            .font(.system(size: 50))
            .position(x: xPosition, y: yPosition)
    }
}
}

struct SwiftUIView_Previews: PreviewProvider {
static var previews: some View {
SwiftUIView()
}
}
