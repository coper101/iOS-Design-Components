//
//  Toggles.swift
//  iOS Components
//
//  Created by Wind Versi on 10/9/22.
//

import SwiftUI

enum ToggleStyles: String, Identifiable, CaseIterable {
    case automatic = "Automatic"
    case `switch` = "Switch"
    case button = "Button"
    case custom = "Custom"
    var id: String {
        self.rawValue
    }
}

struct Toggles: View {
    // MARK: - Props
    @State private var isOn = true
    var toggleStyle: ToggleStyles = .automatic
    
    var title: String {
        isOn ? "Active" : "Inactive"
    }
    
    // MARK: - UI
    var body: some View {
        
        // MARK: - Toggle
        // Modifier:
        
        // * .toggleStyle(ToggleStyle)
        
        VStack(spacing: 0) {
           
            // Toggle("Toggle", isOn: $isOn)
            
            Toggle(isOn: $isOn) {
                Label(title, systemImage: "")
                    .labelStyle(.titleOnly)
            }
            .tint(.green)
            .if(toggleStyle == .automatic) { view in
                view.toggleStyle(.automatic)
            }
            .if(toggleStyle == .switch) { view in
                view.toggleStyle(.switch)
            }
            .if(toggleStyle == .button) { view in
                view.toggleStyle(.button)
            }
            .if(toggleStyle == .custom) { view in
                view.toggleStyle(MyToggleStyle())
            }
        }
    }
    
}

// MARK: - Preview
// Display Name: color scheme / toggle style
struct Toggle_Previews: PreviewProvider {
    static var scheme: ColorScheme = .light
    
    static var previews: some View {
        ForEach(ToggleStyles.allCases) { style in
            
            Toggles(toggleStyle: style)
                .previewLayout(.sizeThatFits)
                .padding()
                .preferredColorScheme(scheme)
                .previewDisplayName(
                    displayName(
                        "\(scheme)".firstCap(),
                        "\(style.id)"
                    )
                )
            
        } //: ForEach
    }
}

// MARK: - Styles
struct MyToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {}) {
            configuration.label
                .frame(width: 80, height: 50)
                .padding()
                .background(configuration.isOn ? .green : .white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
                .foregroundColor(configuration.isOn ? .white : .green)
        }
    }
}
