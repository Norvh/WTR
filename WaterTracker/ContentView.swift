

import SwiftUI

struct ContentView: View {
    @AppStorage("isOnboardingCompleted") private var isOnboardingCompleted: Bool = false
    @State private var userInput: String = ""
    @State private var showResults = false
    @State private var litersOfWaterNeeded: Double = 0
    @State private var cupsOfWaterNeeded: Int = 0
    @EnvironmentObject var user: User
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 8) {
                Image(systemName: "drop.fill")
                    .resizable()
                    .foregroundColor(Color("lightBlue"))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 70)
                    .padding(.leading)
                    .offset(y: 30)
                
                Text("iHydrate")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading)
                    .offset(y: 30)
                
                Text("Start with iHydrate to record and track your water intake daily based on your needs and stay hydrated")
                    .foregroundColor(Color("grey2"))
                    .offset(y: 30)
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 2) {
                    ZStack(alignment: .leading) {
                        HStack {
                            TextField("weight", text: $userInput)
                                .keyboardType(.decimalPad)
                                .padding(.leading, 110)
                                .foregroundColor(userInput.isEmpty ? .gray : Color("Black1"))
                            
                            Text("Kg")
                                .foregroundColor(.primary)
                                .padding(.trailing, 130)
                        }
                        Text("Body weight")
                            .foregroundColor(.primary)
                            .padding(.trailing, 8)
                    }
                    .padding(.leading, 8)
                }
                .padding()
                .background(Color("grey1"))
                .cornerRadius(8)
                .padding(.bottom, 8)
                .offset(y: 70)
                
                Spacer()
                
                Button(action: calculateWaterIntake) {
                    Text("Calculate Now")
                        .foregroundColor(Color("grey1"))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(userInput.isEmpty ? Color("ColorButton").opacity(0.5) : Color("lightBlue"))
                        .cornerRadius(10)
                }
                .disabled(userInput.isEmpty)
                .padding(.leading)
                .padding(.trailing)
                .offset(y: -60)
                
                NavigationLink("", destination: OnboardingScreen02(litersOfWaterNeeded: litersOfWaterNeeded, cupsOfWaterNeeded: cupsOfWaterNeeded), isActive: $showResults).hidden()
            }
            .padding()
        }
    }
    
    func calculateWaterIntake() {
        if let userWeight = Double(userInput) {
            user.weight = userWeight // تحديث وزن المستخدم
            litersOfWaterNeeded = userWeight * 0.03
            cupsOfWaterNeeded = Int(litersOfWaterNeeded * 33.814 / 8)
            showResults = true
            user.dailyWaterIntakeGoal = litersOfWaterNeeded
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
