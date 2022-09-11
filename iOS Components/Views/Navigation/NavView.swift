//
//  NavView.swift
//  iOS Components
//
//  Created by Wind Versi on 5/7/22.
//

import SwiftUI

enum ListStyles: String, Identifiable, CaseIterable {
    case automatic
    case plain
    case grouped
    case insetGrouped = "Inset Grouped"
    case sideBar = "Side Bar"
    var id: String {
        self.rawValue
    }
}

struct NavView: View {
    // MARK: - Properties
    @State private var searchText: String = ""
    var listStyle: ListStyles = .automatic

    // MARK: - UI
    var body: some View {
        NavigationView {
            
            // Style
            // Use Fixed Style or Custom Style that conforms to its Protocol
            // e.g ListStyle.plain & struct MyPlainListStyle: PlainListStyle {}
            
            // MARK: List
            // Style Modifier:
            // * .listStyle(ListStyle)
            // .automatic
            // .plain (default) - flat
            // .grouped - content has container
            // .insetGrouped - content has rounded container
            // .sideBar - collapsible group content
            
            // List Row Separator Modifier:
            // * .listRowSeparator(Visibility)
            // .automatic
            // .visible (default)
            // .hidden
            // * .listRowSeparatorTint(Color?)
                        
            // MARK: Section
            // groups contents such as items
            // has a header label
            // has a footer label
            // List Section Modifier:
            // * .listSectionSeparator(Visibility)
            // .automatic
            // .visible (default)
            // .hidden - top and bottom separators are hidden
            // * .listSectionSeparatorTint(Color?)
            // applies only to bottom separator
            
            // MARK: Label
            // has icon and title
            // Style Modifier:
            // * .labelStyle(LabelStyle)
            
            // MARK: Search
            // Modifier:
            // * .searchable(StringProtocol, placement, prompt, suggestion)
            // for seaching items, place at top of navigation
            
            
            List {
                
                Section {
                    ForEach(1...3, id: \.self) { _ in
                        NavigationLink(destination: {}) {
                            Label(
                                "Label",
                                systemImage: "speaker.wave.2.fill"
                            )
                                // .labelStyle(.titleOnly)
                                // .labelStyle(.titleAndIcon)
                                // .labelStyle(.iconOnly)
                                // .listItemTint(.fixed(.red))
                                // .labelStyle(BorderedLabelStyle())
                        } //: NavigationLink
                    } //: ForEach
                } header: {
                    Text("Header")
                } footer: {
                    Text("Footer")
                        .font(.caption)
                } //: Section
                .listRowSeparator(.visible)
                .listRowSeparatorTint(nil)
                // .listRowSeparator(.visible, edges: VerticalEdge.Set.top)
                // .listRowSeparatorTint(.red, edges: SwiftUI.VerticalEdge.Set.bottom)
                .listSectionSeparator(.visible)
                .listSectionSeparatorTint(nil)
                // .listSectionSeparator(.visible, edges: [.top])
                // .listSectionSeparatorTint(.red, edges: [.top])
                
                Section {
                    ForEach(1...3, id: \.self) { _ in
                        NavigationLink(destination: {}) {
                            Label {
                                Text("Label")
                            } icon: {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.blue)
                                        .frame(
                                            width: 28,
                                            height: 28,
                                            alignment: .center
                                        )
                                        .overlay(
                                            Image(systemName: "speaker.wave.2.fill")
                                                .font(.system(size: 12))
                                                .accentColor(.white)
                                        )
                            } //: Label
                        } //: NavigationLink
                    } //: ForEach
                } header: {
                    Text("Header")
                } footer: {
                    Text("Footer")
                        .font(.caption)
                } //: Section
                
            } //: List
            .searchable(
                text: $searchText,
                placement: SearchFieldPlacement.automatic,
                prompt: "Placeholder"
            ) {
                Text("🍎").searchCompletion("apple")
                Text("🍐").searchCompletion("pear")
                Text("🍌").searchCompletion("banana")
            }
            .onSubmit(of: .search) {
                
            }
            .if(listStyle == .automatic) { view in
                view.listStyle(.automatic)
            }
            .if(listStyle == .plain) { view in
                view.listStyle(.plain)
            }
            .if(listStyle == .insetGrouped) { view in
                view.listStyle(.insetGrouped)
            }
            .if(listStyle == .grouped) { view in
                view.listStyle(.grouped)
            }
            .if(listStyle == .sideBar) { view in
                view.listStyle(.sidebar)
            }
            .navigationTitle("Title")
            
        } //: NavigationView
    }
}

// MARK: - Preview
// Display Name: color scheme / list style
struct NavView_Previews: PreviewProvider {
    static var scheme: ColorScheme = .light

    static var previews: some View {
        
        ForEach(ListStyles.allCases) { style in
            
            NavView()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(scheme)
                .previewDisplayName(
                    displayName(
                        "\(scheme)".firstCap(),
                        "\(style.id)".firstCap()
                    )
                )
            
        } //: ForEach
    }
}

// MARK: - Styles
struct BorderedLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        Label(configuration)
            .containerShape(RoundedRectangle(cornerRadius: 20))
    }
}
