import SwiftUI

struct ErrorView: View {
    private enum Constants {
        static let rectangleSize: CGSize = CGSize(width: 200, height: 200)
        static let cornerRadius: CGFloat = 20
    }
    
    let message: String
    
    var body: some View {
        ZStack {
            BasicRectangle(color: .orange, shadow: false)
            VStack {
                Text("ErrorView.Title".localized)
                    .font(.title)
                    .foregroundColor(.red)
                    .padding()
                Text(message)
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding()
            }
        }
    }
}

//MARK: - Preview
struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(message: "Preview message")
    }
}

