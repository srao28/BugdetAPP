import SwiftUI
import SwiftData

struct SettingsView: View {
	@Environment(\.modelContext) private var context
	@Query private var settingsList: [AppSettings]
	@StateObject private var viewModel = SettingsViewModel()
	
	var body: some View {
		NavigationStack {
			Form {
				Section("Savings Percentage") {
					HStack {
						Slider(value: $viewModel.savingsPercentage, in: 0...100, step: 1)
						Text("\(Int(viewModel.savingsPercentage))%")
							.monospacedDigit()
							.frame(width: 56, alignment: .trailing)
					}
				}
			}
			.navigationTitle("Settings")
			.toolbar {
				ToolbarItem(placement: .confirmationAction) {
					Button("Save") {
						viewModel.save(using: context, settings: settingsList.first)
					}
				}
			}
			.onAppear {
				if settingsList.isEmpty {
					let initial = AppSettings(savingsPercentage: 20)
					context.insert(initial)
				}
				viewModel.bind(settings: settingsList.first)
			}
			.onChange(of: settingsList) { _, _ in
				viewModel.bind(settings: settingsList.first)
			}
		}
	}
}

#Preview
struct SettingsView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsView()
	}
}


