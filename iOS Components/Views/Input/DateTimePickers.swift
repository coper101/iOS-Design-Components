//
//  DateTimePickers.swift
//  iOS Components
//
//  Created by Wind Versi on 11/9/22.
//

import SwiftUI

enum DatePickerStyles: String, Identifiable, CaseIterable {
    case automatic = "Automatic"
    case compact = "Compact"
    case graphical = "Graphical"
    case wheel = "Wheel"
    var id: String {
        self.rawValue
    }
}

enum DateComponents: String, Identifiable, CaseIterable {
    case date = "Date"
    case time = "Time"
    case dateTime = "Date & Time"
    var id: String {
        self.rawValue
    }
}

struct DateTimePickers: View {
    // MARK: - Props
    @State private var selectedDate: Date = .init()
    var datePickerStyle: DatePickerStyles = .automatic
    var dateComp: DateComponents = .dateTime
    
    // MARK: - UI
    var body: some View {
        
        // MARK: - Date & Time Picker
        // Modifier:
        
        // * .datePickerStyle(DatePickerStyle)
        // .automatic
        // .compact (default) - tap to reveal calendar
        // .graphical - calendar
        // .wheel - scroll to select date
        
        VStack(spacing: 0) {
            
            switch dateComp {
            case .date:
                DatePicker(
                    "Title",
                    selection: $selectedDate,
                    displayedComponents: .date
                )
            case .time:
                DatePicker(
                    "Title",
                    selection: $selectedDate,
                    displayedComponents: .hourAndMinute
                )
            case .dateTime:
                DatePicker(
                    "Title",
                    selection: $selectedDate
                )
            }
            
        } //: VStack
        .if(datePickerStyle == .automatic) { view in
            view.datePickerStyle(.automatic)
        }
        .if(datePickerStyle == .graphical) { view in
            view.datePickerStyle(.graphical)
        }
        .if(datePickerStyle == .wheel) { view in
            view.datePickerStyle(.wheel)
        }
        .if(datePickerStyle == .compact) { view in
            view.datePickerStyle(.compact)
        }
    }
}

// MARK: - Preview
// Display Name: color scheme / date component(s) / date picker style
struct DateTimePickers_Previews: PreviewProvider {
    static var scheme: ColorScheme = .light

    static var previews: some View {
        
        ForEach(DatePickerStyles.allCases) { style in
            
            ForEach(DateComponents.allCases) { comp in
                
                DateTimePickers(
                    datePickerStyle: style,
                    dateComp: comp
                )
                    .previewLayout(.sizeThatFits)
                    .padding()
                    .previewDisplayName(
                        displayName(
                            "\(scheme)".firstCap(),
                            "\(comp.id)",
                            "\(style.id)"
                        )
                    )
                
            } //: ForEach
            
        } //: ForEach
    }
}
