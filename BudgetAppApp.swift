import SwiftUI
import SwiftData

@main
struct BudgetAppApp: App {
	var body: some Scene {
		WindowGroup {
			// Placeholder root until views are added in the next steps
			Text("BudgetApp")
				.padding()
		}
		.modelContainer(for: [
			Income.self,
			Expense.self,
			AppSettings.self
		])
	}
}


