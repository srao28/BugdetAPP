import Foundation
import SwiftData

@MainActor
final class AddExpenseViewModel: ObservableObject {
	@Published var amount: String = ""
	@Published var category: String = ""
	@Published var date: Date = .now
	@Published var notes: String = ""
	
	func save(using context: ModelContext) {
		guard let value = Double(amount), !category.isEmpty else { return }
		let expense = Expense(amount: value, category: category, date: date, notes: notes.isEmpty ? nil : notes)
		context.insert(expense)
	}
}


