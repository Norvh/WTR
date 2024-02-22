//
//  Drops.swift
//  WaterTracker
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
        VStack(spacing: 30) {
            Text("Today's Water Intake")
                .font(.body)
                .foregroundColor(Color.gray)
            
                .padding(.trailing, 170.0)
                .padding(.bottom, -20.0)
               
            Text("\(Int(resultStore.result)) cups / 20 cups")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.trailing, 110.0)
                .padding(.bottom, 40.0)
            
             
              
               
              
            ForEach(0..<5) { row in
                HStack(spacing: 55) {
                    ForEach(0..<4) { column in
                        DropZoneView(filledState: $filledStates[row * 4 + column], clickCount: $resultStore.clickCount)                    }
                }
            }
            
        }
        .padding()
        .environmentObject(resultStore)
        .padding(.bottom, 30.0)
        .navigationBarBackButtonHidden(true)
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
            })  {
                   Image(filledState ? "drop" : "drop2")
                       .resizable()
                       .aspectRatio(contentMode: .fill)
                       .frame(width: 40, height: 40)
                    
               }
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
