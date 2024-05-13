//
//  ViewExtension.swift
//  Skeelo
//
//  Created by Maxwell Farias on 13/05/24.
//

import SwiftUI

extension View {
    func toastView(toast: Binding<Toast?>) -> some View {
        self.modifier(ToastModifier(toast: toast))
    }
}
