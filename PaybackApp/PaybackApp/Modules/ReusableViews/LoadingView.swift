import SwiftUI

struct LoadingView: View {
    private enum Constants {
        static let rectangleSize: CGSize = CGSize(width: 200, height: 200)
        static let cornerRadius: CGFloat = 20
        static let textPadding: CGFloat = 10
    }

    var body: some View {
        setupUI()
    }
}

// MARK: - Setup UI
extension LoadingView {
    private func setupUI() -> some View {
        ZStack {
            BasicRectangle(color: .orange, shadow: false)
            VStack {
                ProgressView()
                Text("LoadingView.LoadingTitle".localized)
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding(Constants.textPadding)
            }
        }
    }
}

//MARK: - Preview
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
