import Foundation
import SwiftData

@MainActor
final class AddIncomeViewModel: ObservableObject {
	@Published var amount: String = ""
	@Published var date: Date = .now
	@Published var notes: String = ""
	
	func save(using context: ModelContext) {
		guard let value = Double(amount) else { return }
		let income = Income(amount: value, date: date, notes: notes.isEmpty ? nil : notes)
		context.insert(income)
	}
}


