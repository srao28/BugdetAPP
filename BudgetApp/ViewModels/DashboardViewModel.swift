import Foundation

@MainActor
final class DashboardViewModel: ObservableObject {
	@Published var totalIncome: Double = 0
	@Published var totalExpenses: Double = 0
	@Published var balance: Double = 0
	@Published var idealMonthlySavings: Double = 0
	@Published var actualSavings: Double = 0
	@Published var savingsDelta: Double = 0
	
	func compute(incomes: [Income], expenses: [Expense], settings: AppSettings?) {
		totalIncome = incomes.reduce(0) { $0 + $1.amount }
		totalExpenses = expenses.reduce(0) { $0 + $1.amount }
		balance = totalIncome - totalExpenses
		
		let fraction = settings?.savingsFraction ?? 0.2
		idealMonthlySavings = totalIncome * fraction
		actualSavings = max(0, balance)
		savingsDelta = actualSavings - idealMonthlySavings
	}
}


