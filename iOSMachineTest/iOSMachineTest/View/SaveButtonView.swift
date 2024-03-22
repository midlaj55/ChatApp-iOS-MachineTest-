//
//  SaveButtonView.swift
//  iOSMachineTest
//
//  Created by Mc on 21/03/24.
//

import SwiftUI

struct SaveButtonView: View {
    @Binding var groupName: String // Group name value
      @Binding var groupBio: String // Group bio value
    @StateObject var viewModel = GroupViewModel()

    var body: some View {
        Button {
            viewModel.saveToCoreData(groupName: $groupName, groupBio: $groupBio)
        } label: {
            Text("Save")
                .foregroundColor(.white)
                .padding()
                .frame(width: 100, height: 50)
                .background(Color.appThemeColor)
                .cornerRadius(10)
        }
    }
}
