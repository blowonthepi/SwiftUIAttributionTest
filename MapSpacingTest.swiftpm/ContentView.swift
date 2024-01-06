import SwiftUI
import MapKit

@available(iOS 17.0, *)
struct ContentView: View {
    static var defaultSheetHeight = 250.0
    @State private var userSheetHeight = defaultSheetHeight
    private var sheetHeight: Double { userSheetHeight }
    
    var body: some View {
        GeometryReader { proxy in
            Map()
                .safeAreaPadding(.bottom, 250)
                .ignoresSafeArea()
                .overlay(alignment: .bottom) {
                    ScrollView {
                        VStack(alignment: .leading) {
                            Text("Home")
                                .font(.title.bold())
                            
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.red)
                                .frame(height: 250)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: sheetHeight)
                    .background(.background)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 25,
                            topTrailingRadius: 25
                        )
                    )
                    .gesture(
                        DragGesture()
                                .onChanged { gesture in
                                    userSheetHeight = (userSheetHeight - gesture.translation.height).clamped(to: 245...(proxy.size.height + 5))
                                }
                                .onEnded { _ in
                                    withAnimation(.bouncy) {
                                        userSheetHeight = userSheetHeight.clamped(to: 245...(proxy.size.height + 5))
                                    }
                                }
                    )
                }
                .ignoresSafeArea()
        }
    }
}
