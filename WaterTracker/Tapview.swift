import SwiftUI

struct Tapview: View {
    @EnvironmentObject var user: User

    var body: some View {
        TabView {
            
//            Text("page 1")
//            Text("page 2")
                 
                        ProgressTrack()
                .environmentObject(user)
//                            .navigationBarTitle("Progress Track")
                  
//                    .tabItem {
//                        Label("Progress", systemImage: "list.dash")
//                    }
                    
                
                        Cups()
//                            .navigationBarTitle("Cups")
                    
//                    .tabItem {
//                        Label("Cups", systemImage: "list.dash")
//                    }
                }
        .tabViewStyle(.page)
       // .indexViewStyle(.page(backgroundDisplayMode: .always))




      //  .tabViewStyle(PageTabViewStyle())
       // .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct OnboardingPage: View {
    let title: String
    let image: String

    var body: some View {
        VStack {
            Spacer()
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Image(image)
                .resizable()
                .scaledToFit()
                .padding()
            Spacer()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
      Tapview()
    }
}
