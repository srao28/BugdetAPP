import SwiftUI
import SwiftData

@main
struct BudgetAppApp: App {
	var body: some Scene {
		WindowGroup {
			ContentView()
		}
		.modelContainer(for: [
			Income.self,
			Expense.self,
			AppSettings.self
		])
	}
}


