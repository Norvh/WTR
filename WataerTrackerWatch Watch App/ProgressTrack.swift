//
//  ProgressTrack.swift
//  WataerTrackerWatch Watch App
//

import SwiftUI
import WatchConnectivity

struct SwiftUIView: View {
    
   
    @ObservedObject var watchmodel = Watchmodel()
    
    @State private var totalLitersDrank: Double = 0.0
    private let goalLiters: Double = 2.7 // Set your daily goal here
    @State private var incrementValue: Double = 0.10

    var body: some View {
        VStack {
            // to show our emoji
            CircleProgressBar(progress: CGFloat(totalLitersDrank / goalLiters), totalLiters: totalLitersDrank)
                .frame(width: 120, height: 120)
                .padding()

          // to show total litter that the user drink it
            Text(String(format: "%.2f / %.2f Liters", totalLitersDrank, goalLiters))
                .font(.caption)

          
            HStack {
                Button(action: {
                   
                    subtractWater(amount: incrementValue)
                
                }) {
                    
                    Image(systemName: "minus")
                    
                        .font(.system(size: 25))
                        .foregroundColor(totalLitersDrank > 0 ? Color.lightblue : Color.gray)
                        .padding()
                     .buttonStyle(PlainButtonStyle())
                        
                }

                Button(action: {
                   
                    addWater(amount: incrementValue)
                
                }) {
                    
                    Image(systemName: "plus")
                        .font(.system(size: 25))
                        .foregroundColor(Color.lightblue)
                        .padding()
                        .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .padding()
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

struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.blue)
            .accentColor(.blue)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.easeOut(duration: 0.2))
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
                .stroke(lineWidth: 20.0) // Adjusted line width
                .opacity(0.3)
                .foregroundColor(Color.gray)

            Circle()
                .trim(from: 0.0, to: min(progress, 1.0))
                .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round)) // Adjusted line width
                .foregroundColor(Color.lightblue)
                .rotationEffect(Angle(degrees: 270.0))
                .overlay(
                    emojiOverlay
                )
        }
    }

    private var emojiOverlay: some View {
        GeometryReader { geometry in
            let angle = 360 * progress - 90

            
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
                .font(.system(size: 25))
                .position(x: xPosition, y: yPosition)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
