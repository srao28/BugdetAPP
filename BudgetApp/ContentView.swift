import SwiftUI

struct ContentView: View {
	var body: some View {
		TabView {
			DashboardView()
				.tabItem {
					Label("Dashboard", systemImage: "chart.pie.fill")
				}
			TransactionListView()
				.tabItem {
					Label("Transactions", systemImage: "list.bullet.rectangle.portrait")
				}
			SettingsView()
				.tabItem {
					Label("Settings", systemImage: "gearshape.fill")
				}
		}
	}
}

#Preview
struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}


