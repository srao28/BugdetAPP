import Foundation
import SwiftData

@Model
final class Income {
	var amount: Double
	var date: Date
	var notes: String?
	
	init(amount: Double, date: Date = .now, notes: String? = nil) {
		self.amount = amount
		self.date = date
		self.notes = notes
	}
}


