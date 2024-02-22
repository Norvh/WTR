import SwiftUI

struct Notification_Preferences_: View {
    @State private var startHour = Date()
    @State private var endHour = Date()
    @EnvironmentObject var user: User

    @State private var selectedInterval: String?
    let intervals = [("15", "Mins"), ("30", "Mins"),
                     ("60", "Mins"), ("90", "Mins"),
                     ("2", "Hours"), ("3", "Hours"),
                     ("4", "Hours"), ("5", "Hours")]
    let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 10), count: 4)
    @State private var navigateToProgressTrack = false

    var body: some View {
//        NavigationView{
            VStack {
                Text("Notification Preferences")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .padding(.bottom, 40)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("The start and End hour")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Specify the start and end date to receive the notifications")
                    .font(.system(size: 12))
                    .padding(.bottom, 20)
                    .foregroundColor(Color("grey2"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    DatePicker("Start hour", selection: $startHour, displayedComponents: .hourAndMinute)
                    Divider()
                    DatePicker("End hour", selection: $endHour, displayedComponents: .hourAndMinute)
                }
                .padding()
                .background(Color("grey1"))
                .cornerRadius(10)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Notification interval ")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    .padding(.bottom, 4)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("How often would you like to receive notifications within the specified time interval")
                    .font(.system(size: 12))
                    .padding(.bottom, 23)
                    .foregroundColor(Color("grey2"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(intervals, id: \.0) { interval in
                        Button(action: {
                            self.selectedInterval = interval.0
                        }) {
                            VStack {
                                Text(interval.0)
                                    .font(.system(size: 20))
                                    .foregroundColor(self.selectedInterval == interval.0 ? .white : Color("lightBlue"))
                                    .fontWeight(.bold)
                                
                                Text(interval.1)
                                    .foregroundColor(self.selectedInterval == interval.0 ? .white : .black)
                                    .font(.system(size: 13))
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 80)
                            .background(self.selectedInterval == interval.0 ? Color("lightBlue") : Color("grey1"))
                            .cornerRadius(10)
                        }
                    }
                }
                .padding(.horizontal)
                
                Button(action: {
                    navigateToProgressTrack = true
                }) {
                    Text("Start")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("lightBlue"))
                        .cornerRadius(10)
                }
                .padding(.top, 20)
                .padding([.leading, .trailing])
                
                // Corrected Usage of NavigationLink for Conditional Navigation
                NavigationLink(destination: 
                                Tapview()                               ,
                               isActive: $navigateToProgressTrack) {
//                    EmptyView()
                }
            }
            .padding()
.navigationBarBackButtonHidden(true)
    }
}

struct Notification_Preferences_Previews: PreviewProvider {
    static var previews: some View {
        Notification_Preferences_().environmentObject(User(weight: 70)) // Example user for preview
    }
}
