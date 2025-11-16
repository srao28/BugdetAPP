import SwiftUI
import SwiftData

struct DashboardView: View {
	@Environment(\.modelContext) private var context
	@Query(sort: \Income.date, order: .reverse) private var incomes: [Income]
	@Query(sort: \Expense.date, order: .reverse) private var expenses: [Expense]
	@Query private var settingsList: [AppSettings]
	
	@StateObject private var viewModel = DashboardViewModel()
	
	var body: some View {
		ScrollView {
			VStack(spacing: 16) {
				summaryCard
				savingsCard
			}
			.padding()
		}
		.onAppear {
			viewModel.compute(incomes: incomes, expenses: expenses, settings: settingsList.first)
		}
		.onChange(of: incomes) { _, _ in
			viewModel.compute(incomes: incomes, expenses: expenses, settings: settingsList.first)
		}
		.onChange(of: expenses) { _, _ in
			viewModel.compute(incomes: incomes, expenses: expenses, settings: settingsList.first)
		}
		.onChange(of: settingsList) { _, _ in
			viewModel.compute(incomes: incomes, expenses: expenses, settings: settingsList.first)
		}
		.navigationTitle("Dashboard")
	}
	
	private var summaryCard: some View {
		VStack(alignment: .leading, spacing: 8) {
			Text("Summary").font(.headline)
			HStack {
				stat("Income", viewModel.totalIncome, color: .green)
				Spacer()
				stat("Expenses", viewModel.totalExpenses, color: .red)
				Spacer()
				stat("Balance", viewModel.balance, color: .blue)
			}
		}
		.padding()
		.background(RoundedRectangle(cornerRadius: 12).fill(.ultraThinMaterial))
	}
	
	private var savingsCard: some View {
		VStack(alignment: .leading, spacing: 8) {
			Text("Savings").font(.headline)
			HStack {
				stat("Ideal", viewModel.idealMonthlySavings, color: .teal)
				Spacer()
				stat("Actual", viewModel.actualSavings, color: .purple)
				Spacer()
				stat("Delta", viewModel.savingsDelta, color: .orange)
			}
		}
		.padding()
		.background(RoundedRectangle(cornerRadius: 12).fill(.ultraThinMaterial))
	}
	
	private func stat(_ title: String, _ value: Double, color: Color) -> some View {
		VStack(alignment: .leading) {
			Text(title).font(.subheadline).foregroundStyle(.secondary)
			Text(value, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
				.font(.title3).bold().foregroundStyle(color)
		}
	}
}

#Preview
struct DashboardView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationStack {
			DashboardView()
		}
	}
}


