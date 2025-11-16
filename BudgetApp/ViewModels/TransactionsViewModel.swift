import Foundation

@MainActor
final class TransactionsViewModel: ObservableObject {
	@Published var incomes: [Income] = []
	@Published var expenses: [Expense] = []
	
	func load(incomes: [Income], expenses: [Expense]) {
		self.incomes = incomes.sorted { $0.date > $1.date }
		self.expenses = expenses.sorted { $0.date > $1.date }
	}
}


