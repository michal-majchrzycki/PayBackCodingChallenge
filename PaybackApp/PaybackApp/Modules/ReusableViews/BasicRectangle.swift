import SwiftUI

struct BasicRectangle: View {
    let color: Color
    let shadow: Bool
    var body: some View {
        setupUI()
    }
}

// MARK: - Setup UI
extension BasicRectangle {
    private func setupUI() -> some View {
        Rectangle()
            .frame(width: StyleConstants.BasicRectangle.size.width, height: StyleConstants.BasicRectangle.size.height)
            .cornerRadius(StyleConstants.BasicRectangle.cornerRadius)
            .foregroundColor(color)
            .shadow(
                color: shadow ? .black : .clear,
                radius: shadow ? StyleConstants.BasicRectangle.shadowRadius : .zero,
                x: shadow ? StyleConstants.BasicRectangle.shadowAxis.x : .zero,
                y: shadow ? StyleConstants.BasicRectangle.shadowAxis.y : .zero)
    }
}

//MARK: - Preview
struct BasicRectangle_Previews: PreviewProvider {
    static var previews: some View {
        BasicRectangle(color: .red, shadow: false)
    }
}
