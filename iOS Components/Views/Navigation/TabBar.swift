//
//  TabBar.swift
//  iOS Components
//
//  Created by Wind Versi on 10/9/22.
//

import SwiftUI

enum Tabs: String, Identifiable, CaseIterable {
    case house = "house"
    case leaf = "leaf.fill"
    case person = "person.crop.circle.fill"
    case scribble = "scribble.variable"
    case gear = "gearshape.fill"
    case list = "list.bullet.rectangle.portrait.fill"
    var id: String {
        self.rawValue
    }
}

enum TabViewStyles: String, Identifiable, CaseIterable {
    case automatic
    case page
    var id: String {
        self.rawValue
    }
}

struct TabBar: View {
    // MARK: - Props
    @State private var selectedTab: Tabs = .house
    var tabViewStyle: TabViewStyles = .automatic
    
    // MARK: - UI
    var body: some View {
        
        // MARK: Tab View
        // Modifier
        
        // * .tabViewStyle(DefaultTabViewStyle / PageTabViewStyle)
        // .automatic - tab items
        // .page - pager
        
        // * .indexViewStyle(BackgroundDisplayMode) (for Page Style)
        // .automatic - default
        // .interactive (default) - no page indicators
        // .always - has page indicators
        // .never - no page indicators
        
        TabView(selection: $selectedTab) {
            
            if (tabViewStyle == .automatic) {
                
                ForEach(Tabs.allCases) { tab in
                    
                    Spacer()
                        .tabItem {
                            Label("Title", systemImage: tab.id)
                        }
                        .tag(tab)
                                            
                } //: ForEach
                
            } else {
                
                ForEach(Tabs.allCases) { tab in
                    
                    Label("Title", systemImage: tab.id)
                    
                } //:  //: ForEach
                
            } //: if-else
            
        } //: TabView
        .if(tabViewStyle == .automatic) { view in
            view.tabViewStyle(.automatic)
        }
        .if(tabViewStyle == .page) { view in
            view.tabViewStyle(.page)
                .indexViewStyle(
                    .page(backgroundDisplayMode: .always)
                )
        }
    }
    
}

// MARK: - Preview
// Display Name: color scheme / tab view style
struct TabBar_Previews: PreviewProvider {
    static var scheme: ColorScheme = .light

    static var previews: some View {
        
        ForEach(TabViewStyles.allCases) { style in
            
            TabBar(tabViewStyle: style)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(scheme)
                .previewDisplayName(
                    displayName(
                        "\(scheme)".firstCap(),
                        "\(style)".firstCap()
                    )
                )
            
        } //: ForEach
        
    }
}
