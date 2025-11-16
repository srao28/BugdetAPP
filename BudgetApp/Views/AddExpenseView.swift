import SwiftUI
import SwiftData

struct AddExpenseView: View {
	@Environment(\.dismiss) private var dismiss
	@Environment(\.modelContext) private var context
	@StateObject private var viewModel = AddExpenseViewModel()
	
	var body: some View {
		NavigationStack {
			Form {
				Section("Amount") {
					TextField("Amount", text: $viewModel.amount)
						.keyboardType(.decimalPad)
				}
				Section("Category") {
					TextField("Category", text: $viewModel.category)
				}
				Section("Date") {
					DatePicker("Date", selection: $viewModel.date, displayedComponents: .date)
				}
				Section("Notes") {
					TextField("Optional notes", text: $viewModel.notes)
				}
			}
			.navigationTitle("Add Expense")
			.toolbar {
				ToolbarItem(placement: .cancellationAction) {
					Button("Cancel") { dismiss() }
				}
				ToolbarItem(placement: .confirmationAction) {
					Button("Save") {
						viewModel.save(using: context)
						dismiss()
					}
					.disabled(Double(viewModel.amount) == nil || viewModel.category.isEmpty)
				}
			}
		}
	}
}

#Preview
struct AddExpenseView_Previews: PreviewProvider {
	static var previews: some View {
		AddExpenseView()
	}
}


