import SwiftUI
import SwiftData

struct TransactionListView: View {
	@Environment(\.modelContext) private var context
	@Query(sort: \Income.date, order: .reverse) private var incomes: [Income]
	@Query(sort: \Expense.date, order: .reverse) private var expenses: [Expense]
	@StateObject private var viewModel = TransactionsViewModel()
	@State private var showAddIncome = false
	@State private var showAddExpense = false
	
	var body: some View {
		NavigationStack {
			List {
				Section("Incomes") {
					ForEach(viewModel.incomes, id: \.date) { income in
						VStack(alignment: .leading) {
							Text(income.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
								.font(.headline)
							Text(income.date, style: .date)
								.font(.caption).foregroundStyle(.secondary)
							if let notes = income.notes, !notes.isEmpty {
								Text(notes).font(.subheadline)
							}
						}
					}
				}
				Section("Expenses") {
					ForEach(viewModel.expenses, id: \.date) { expense in
						VStack(alignment: .leading) {
							HStack {
								Text(expense.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
									.font(.headline)
								Spacer()
								Text(expense.category).font(.subheadline).foregroundStyle(.secondary)
							}
							Text(expense.date, style: .date)
								.font(.caption).foregroundStyle(.secondary)
							if let notes = expense.notes, !notes.isEmpty {
								Text(notes).font(.subheadline)
							}
						}
					}
				}
			}
			.toolbar {
				ToolbarItemGroup(placement: .primaryAction) {
					Button {
						showAddIncome = true
					} label: {
						Label("Add Income", systemImage: "plus.circle")
					}
					Button {
						showAddExpense = true
					} label: {
						Label("Add Expense", systemImage: "minus.circle")
					}
				}
			}
			.navigationTitle("Transactions")
			.onAppear { viewModel.load(incomes: incomes, expenses: expenses) }
			.onChange(of: incomes) { _, _ in viewModel.load(incomes: incomes, expenses: expenses) }
			.onChange(of: expenses) { _, _ in viewModel.load(incomes: incomes, expenses: expenses) }
			.sheet(isPresented: $showAddIncome) { AddIncomeView() }
			.sheet(isPresented: $showAddExpense) { AddExpenseView() }
		}
	}
}

#Preview
struct TransactionListView_Previews: PreviewProvider {
	static var previews: some View {
		TransactionListView()
	}
}


