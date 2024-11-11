extension View {
  func navigationListener(_ navDestination: Binding<NavigationDestination?>) -> some View {
    modifier(NavigationModifier(navDestination: navDestination))
  }
}
