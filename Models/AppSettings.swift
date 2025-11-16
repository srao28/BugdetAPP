import Foundation
import SwiftData

@Model
final class AppSettings {
	// Stored as 0...100 (percentage value). Default 20%.
	var savingsPercentage: Double
	
	init(savingsPercentage: Double = 20.0) {
		self.savingsPercentage = savingsPercentage
	}
	
	// Convenience: 0.0...1.0 fraction
	var savingsFraction: Double {
		max(0.0, min(1.0, savingsPercentage / 100.0))
	}
}


