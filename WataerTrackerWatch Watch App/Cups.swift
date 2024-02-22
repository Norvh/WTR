//
//  ProgressTrack2.swift
//  WataerTrackerWatch Watch App
//

import SwiftUI

class ResultStore: ObservableObject {
    @Published var clickCount: Int = 0
    var result: Double {
        Double(clickCount)
    }
}


struct Cups: View {
    @State private var filledStates = Array(repeating: false, count: 20)
    @StateObject var resultStore = ResultStore()
    
    var body: some View {
        ScrollView{
        VStack(spacing: 10) {
            
            Text("\(Int(resultStore.result)) cups / 20 cups")
                .font(.custom("headline", size: 20))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.bottom, 25.0)
               
            
            ForEach(0..<20) { row in
                HStack {
                    ForEach(0..<1) { column in
                        DropZoneView(filledState: $filledStates[row * 1 + column], clickCount: $resultStore.clickCount)
                    }
                }
            }
        }
        .padding()
    }
        .environmentObject(resultStore)
    }
}

struct DropZoneView: View {
    @Binding var filledState: Bool
    @Binding var clickCount: Int

    var body: some View {
        VStack {
            Button(action: {
                filledState.toggle()
                if filledState {
                    incrementClickCount()
                } else {
                    decrementClickCount()
                }
            }) {
                
                Image(filledState ? "Drop1" : "Drop2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                   .foregroundColor(filledState ? .blue : .white)
            }
            .buttonStyle(PlainButtonStyle())
            Text("1 cup")
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
    
    private func incrementClickCount() {
        clickCount += 1
    }
    
    private func decrementClickCount() {
        clickCount -= 1
    }
}

struct Cups_Previews: PreviewProvider {
    static var previews: some View {
        Cups()
    }
}
