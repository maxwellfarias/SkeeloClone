//
//  Toast.swift
//  Skeelo
//
//  Created by Maxwell Farias on 13/05/24.
//

import SwiftUI

enum ToastStyle {
    case error
    case warning
    case success
    case info
}

struct Toast: Equatable {
    var type: ToastStyle
    var title: String
    var message: String
    var duration: Double = 5.0
}

extension ToastStyle {
    var themeColor: Color {
        switch self {
        case .error: return Color.red
        case .warning: return Color.orange
        case .info: return Color.blue
        case .success: return Color.green
        }
    }
    
    var iconFileName: String {
        switch self {
        case .info: return "info.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .success: return "checkmark.circle.fill"
        case .error: return "xmark.circle.fill"
        }
    }
}
