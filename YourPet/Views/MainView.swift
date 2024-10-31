import SwiftUI

struct MainView: View {
  var body: some View {
    VStack {
      Spacer()
      
      Text("apk")
        .font(.largeTitle)
        .padding()
      
      Spacer()
      
      HStack {
        Spacer()
        Button(action: {
        }) {
          Image(systemName: "house.fill")
            .font(.system(size: 30))
            .padding()
        }
        
        Spacer()
        
        Button(action: {
        }) {
          Image(systemName:  "pawprint.circle.fill")
            .font(.system(size: 30))
            .padding()
        }
        
        Spacer()
        
        Button(action: {
        }) {
          Image(systemName: "ellipsis.circle")
            .font(.system(size: 30))
            .padding()
        }
       
        
        Spacer()
      }
      .background(Color.gray.opacity(0.1))
    }
  }
}

#if DEBUG
struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
#endif

