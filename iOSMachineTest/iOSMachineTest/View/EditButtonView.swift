//
//  EditButtonView.swift
//  iOSMachineTest
//
//  Created by Mc on 21/03/24.
//

import SwiftUI

struct EditButtonView: View {
    var body: some View {
        HStack {
            Text("Edit")
                .font(Font.system(size: 11,weight: .regular))
            Image("pencil")
                .frame(width: 10, height: 10)
        }
        .padding(5)
        .foregroundColor(.white)
        .background(Color.white.opacity(0.2))
        .cornerRadius(10)
    }
}

#Preview {
    EditButtonView()
}
