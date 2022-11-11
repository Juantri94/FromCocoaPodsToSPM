import SwiftUI

public struct CommonButton: View {
    
    private let action: () -> Void
    private let text: String

    public init(
        action: @escaping () -> Void,
        text: String
    ) {
        self.action = action
        self.text = text
    }

    public var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .font(.title3)
        }
        .foregroundColor(Color.mint)

    }
}

#if DEBUG
struct CommonButton_Previews: PreviewProvider {
    static var previews: some View {
        CommonButton(action: {}, text: "Button")
    }
}
#endif
