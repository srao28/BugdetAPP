import Foundation
import SwiftData

@MainActor
final class SettingsViewModel: ObservableObject {
	@Published var savingsPercentage: Double = 20
	
	func bind(settings: AppSettings?) {
		savingsPercentage = settings?.savingsPercentage ?? 20
	}
	
	func save(using context: ModelContext, settings: AppSettings?) {
		let clamped = max(0, min(100, savingsPercentage))
		if let settings {
			settings.savingsPercentage = clamped
		} else {
			let newSettings = AppSettings(savingsPercentage: clamped)
			context.insert(newSettings)
		}
	}
}


