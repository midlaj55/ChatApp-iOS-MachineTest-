//
//  CancelButtonView.swift
//  iOSMachineTest
//
//  Created by Mc on 21/03/24.
//

import SwiftUI

struct CancelButtonView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss() // Dismiss the current view
        } label: {
            Text("Cancel")
                .foregroundColor(.lightRed)
                .padding()
                .frame(width: 100, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 10) // Apply corner radius
                        .stroke(Color.lightRed, lineWidth: 2) // Apply border
                )
        }
    }
}

#Preview {
    CancelButtonView()
}
