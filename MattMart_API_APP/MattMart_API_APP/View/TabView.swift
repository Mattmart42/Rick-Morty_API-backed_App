import SwiftUI

struct APITabs: View {
    @State var selection = 2
    init() {
        UITabBar.appearance().backgroundColor = UIColor.black
      }
    var body: some View {
        TabView(selection: $selection) {
            CharView()
                .tabItem {
                    Label("Characters", systemImage: "person.2")
                }.tag(1)
            HomeTab()
                .tabItem {
                    Label("Home", systemImage: "house")
                }.tag(2)
            LocationView()
                .tabItem {
                    Label("Locations", systemImage: "mappin.and.ellipse")
                        
                }.tag(3)
        }.accentColor(.green)
    }
}

struct APITabs_Previews: PreviewProvider {
    static var previews: some View {
        APITabs()
    }
}
