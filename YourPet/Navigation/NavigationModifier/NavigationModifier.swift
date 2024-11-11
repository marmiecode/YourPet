import SwiftUI

struct NavigationModifier: ViewModifier {
  let navDestination: Binding<NavigationDestination?>
  
  private var navDestinationBinding: Binding<Bool> {
    Binding<Bool>(
      get: { navDestination.wrappedValue != nil },
      set: { newValue in
        if !newValue {
          navDestination.wrappedValue = nil
        }
      }
    )
  }
  
  func body(content: Content) -> some View {
    if #available(iOS 16.0, *) {
      content
        .navigationDestination(isPresented: navDestinationBinding) {
          navDestination.wrappedValue?.buildNavDestinationView
        }
    } else {
      content
        .background(
          EmptyView()
        )
    }
  }
}

extension View {
  func navigationListener(_ navDestination: Binding<NavigationDestination?>) -> some View {
    modifier(NavigationModifier(navDestination: navDestination))
  }
}
