//
//  Buttons.swift
//  iOS Components
//
//  Created by Wind Versi on 4/7/22.
//

import SwiftUI

enum ButtonStyles: String, Identifiable, CaseIterable {
    case automatic = "Automatic"
    case plain = "Plain"
    case bordered = "Bordered"
    case borderedProminent = "Bordered Prominent"
    case borderless = "Borderless"
    case custom = "Custom"
    var id: String {
        self.rawValue
    }
}

struct Buttons: View {
    // MARK: - Properties
    var style: ButtonStyles = .automatic
    var size: ControlSize = .regular

    // MARK: - UI
    var body: some View {
        
        // MARK: - Button
        // Modifiers:
        
        // * .buttonStyle(ButtonStyle)
        // .automatic
        // .plain - black or white tint of label
        // .bordered (default) - gray background with default accent of label
        // .borderedProminent - background uses default accent of button, white for label
        // .borderless - default accent of label
        
        // * .controlSize(ControlSize)
        // .mini
        // .small
        // .regular
        // .large
        
        // MARK: - Label (Content)
        // has icon
        // has icon and title
        // color is according to style
        // background is according to style
        
        VStack(spacing: 14) {

            // Button with Icon
            Button(action: {}) {
                Label(
                    "Label",
                    systemImage: "paperplane.fill"
                )
                // .labelStyle(.icon)
                .labelStyle(.titleAndIcon)
                .accentColor(.blue)
            }
            .if(style == .automatic) { view in
                view.buttonStyle(.automatic)
            }
            .if(style == .plain) { view in
                view.buttonStyle(.plain)
            }
            .if(style == .bordered) { view in
                view.buttonStyle(.bordered)
            }
            .if(style == .borderedProminent) { view in
                view.buttonStyle(.borderedProminent)
            }
            .if(style == .borderless) { view in
                view.buttonStyle(.borderless)
            }
            .if (style == .custom) { view in
                view.buttonStyle(MyButtonStyle())
            }
            .accentColor(.blue)
            .controlSize(size)
            
        } //: VStack
    }
}

// MARK: - Preview
// Display Name: color scheme / style / size
struct Button_Previews: PreviewProvider {
    static var scheme: ColorScheme = .light
    static var size: ControlSize = .regular
    
    static var previews: some View {
        
        ForEach(ButtonStyles.allCases) { style in
            
            Buttons(
                style: style,
                size: size
            )
                .previewLayout(.sizeThatFits)
                .padding()
                .preferredColorScheme(scheme)
                .previewDisplayName(
                   displayName(
                    "\(scheme)".firstCap(),
                    "\(style.id)",
                    "\(size)".firstCap()
                   )
                )
            
        } //: ForEach
    }
}

// MARK: - Styles
struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding(10)
            .background(.blue.opacity(configuration.isPressed ? 0.5 : 1))
            .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

// * use PrimitiveButtonStyle for custom behaviour
