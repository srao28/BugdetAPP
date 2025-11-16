import Foundation
import SwiftData

@Model
final class AppSettings {
	var savingsPercentage: Double
	
	init(savingsPercentage: Double = 20.0) {
		self.savingsPercentage = savingsPercentage
	}
	
	var savingsFraction: Double {
		max(0.0, min(1.0, savingsPercentage / 100.0))
	}
}


