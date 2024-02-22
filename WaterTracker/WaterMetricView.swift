import SwiftUI

struct WaterMetricView: View {
    let metricValue: String
    let metricUnit: String
    let imageName: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 45, height: 45)
                .foregroundColor(Color("lightBlue"))
            HStack(spacing: 0){
                Text(metricValue)
                    .font(.title)
                
                Text(metricUnit)
                    .font(.system(size: 16))
                    .foregroundColor(Color("grey2"))
            }
        }
        .padding()
        .frame(width: 171, height: 159.94)        .background(Color("grey1"))
        .cornerRadius(10)
    }
}

struct WaterMetricView_Previews: PreviewProvider {
    static var previews: some View {
        WaterMetricView(metricValue: "10", metricUnit: "cups", imageName: "cup.fill")
    }
}
