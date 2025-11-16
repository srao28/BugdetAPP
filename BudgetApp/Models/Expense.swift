import Foundation
import SwiftData

@Model
final class Expense {
	var amount: Double
	var category: String
	var date: Date
	var notes: String?
	
	init(amount: Double, category: String, date: Date = .now, notes: String? = nil) {
		self.amount = amount
		self.category = category
		self.date = date
		self.notes = notes
	}
}


