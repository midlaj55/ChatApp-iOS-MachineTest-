//
//  EditGroupView.swift
//  iOSMachineTest
//
//  Created by Mc on 20/03/24.
//

import SwiftUI
import Kingfisher

struct EditGroupView: View {
    var data: GroupModel?
    @State private var groupName: String = ""
    @State private var groupBio: String = ""
    var groupPhotoURL: String?
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: GroupViewModel

    var body: some View {
        VStack {
            ZStack {
                Spacer()
                ImageView(imageURL: groupPhotoURL ?? "", width: 80, height: 80)
            }
            .frame(height: 150)
            ZStack {
                Color.white
                VStack {
                    nameTextFieldView
                    aboutTextFieldView
                    HStack(spacing: 20) {
                        Spacer()
                        CancelButtonView()
                        SaveButtonView(groupName: $groupName, groupBio: $groupBio)
                        Spacer()
                    }
                }
                .padding(.horizontal, 32)
            }
            .cornerRadius(60)
        }
        .background(Color.appThemeColor)
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems( leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss() // Dismiss the current view
        }) {
            Image(systemName: "arrow.left")
                .foregroundColor(.white)
        }, trailing: Button(action: {}, label: {
            Image("option_button")
                .frame(width: 24, height: 24)
        }))
    }
    
    var aboutTextFieldView: some View {
        VStack(alignment: .leading) {
            Text("About Group")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.appThemeColor)
            TextField("Enter Owner Name", text: $groupBio)
                .frame(width: 332, height: 115)
                .background(Color.lightGray)
                .cornerRadius(8)
            HStack {
                Spacer()
                Text("0/500")
                    .font(.system(size: 12, weight: .regular))
            }
        }
    }
    
    var nameTextFieldView: some View {
        VStack(alignment: .leading) {
            Text("Name")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.appThemeColor)
            TextField("Enter Company Name", text: $groupName)
                .overlay(Rectangle().frame(height: 1).padding(.top, 35), alignment: .top)
            HStack {
                Spacer()
                Text("0/50")
                    .font(.system(size: 12, weight: .regular))
                    .padding(.top, 5)
            }
        }
    }
}

#Preview {
    EditGroupView()
}
