import SwiftUI
import SwiftData

struct AddIncomeView: View {
	@Environment(\.dismiss) private var dismiss
	@Environment(\.modelContext) private var context
	@StateObject private var viewModel = AddIncomeViewModel()
	
	var body: some View {
		NavigationStack {
			Form {
				Section("Amount") {
					TextField("Amount", text: $viewModel.amount)
						.keyboardType(.decimalPad)
				}
				Section("Date") {
					DatePicker("Date", selection: $viewModel.date, displayedComponents: .date)
				}
				Section("Notes") {
					TextField("Optional notes", text: $viewModel.notes)
				}
			}
			.navigationTitle("Add Income")
			.toolbar {
				ToolbarItem(placement: .cancellationAction) {
					Button("Cancel") { dismiss() }
				}
				ToolbarItem(placement: .confirmationAction) {
					Button("Save") {
						viewModel.save(using: context)
						dismiss()
					}
					.disabled(Double(viewModel.amount) == nil)
				}
			}
		}
	}
}

#Preview
struct AddIncomeView_Previews: PreviewProvider {
	static var previews: some View {
		AddIncomeView()
	}
}


