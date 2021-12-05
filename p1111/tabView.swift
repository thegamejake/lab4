import SwiftUI

struct tabView: View {
    var body: some View {
    TabView {
      leftView()
      .tabItem {
      Image(systemName: "music.house.fill")
     Text("好感度")
      }
      ContentView()
      .tabItem {
      Image(systemName: "info.circle.fill")
     Text("年曆")
      }
      }
}
}

struct tabView_Previews: PreviewProvider {
    static var previews: some View {
        tabView()
    }
}
