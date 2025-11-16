# BudgetApp

SwiftUI + SwiftData personal budget tracker (MVVM).

Open and run:
- Open `BudgetApp.xcodeproj` in Xcode 15+.
- Select an iOS 17+ simulator.
- Build & Run.

Project layout:
- `BudgetApp/` app sources
  - `Models/` SwiftData `@Model` types (`Income`, `Expense`, `AppSettings`)
  - `ViewModels/` screen view models
  - `Views/` SwiftUI screens
  - `Assets.xcassets/` app assets
  - `Info.plist`
- `BudgetApp.xcodeproj/` Xcode project

Notes:
- Bundle ID defaults to `com.example.BudgetApp`. Change if deploying to device.
- App icon is placeholder; drop an image into `Assets.xcassets/AppIcon.appiconset` when ready.