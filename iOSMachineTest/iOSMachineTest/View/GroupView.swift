//
//  GroupView.swift
//  iOSMachineTest
//
//  Created by Mc on 20/03/24.
//

import SwiftUI
import Kingfisher

struct GroupView: View {
    var groupPhotoURL: String?
    var data: GroupModel?
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: GroupViewModel

    var body: some View {
        VStack {
            ZStack {
                VStack {
                    ImageView(imageURL: data?.groupPhoto ?? "", width: 80, height: 80)
                    Text(data?.name ?? "")
                        .font(Font.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                    Text("The Walt Disney Company")
                        .font(Font.system(size: 12, weight: .medium))
                        .foregroundColor(.white)
                    HStack {
                        Image("vector_white")
                            .foregroundColor(.white)
                        if let unreadCount = data?.participantCount {
                            Text("\(unreadCount)")
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            ZStack {
                Color.white
                groupAboutView
            }
            .cornerRadius(60)
        }
        .background(Color.appThemeColor)
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss() // Dismiss the current view
        }) {
            Image(systemName: "arrow.left")
                .foregroundColor(.white)
        }, trailing: HStack {
            if data?.userStatus == "Admin" {
                NavigationLink(
                    destination: EditGroupView(groupPhotoURL: data?.groupPhoto ?? ""),
                    label: {
                        EditButtonView()
                    }
                )
            }
            Button(action: {
                // Handle first button action here
            }) {
                Image("option_button")
                    .frame(width: 24, height: 24)
            }
        }
        )
    }
    
    var groupAboutView: some View {
        VStack(alignment: .leading) {
            Text("About Group")
                .font(Font.system(size: 18, weight: .semibold))
                .foregroundColor(.appThemeColor)
            VStack(alignment: .leading) {
                Text(data?.bio ?? "")
                    .foregroundColor(.black)
                    .font(Font.system(size: 14, weight: .regular))
                    .padding()
                    .cornerRadius(8)
                    .padding(.horizontal, 16)
            }
            .frame(width: 332, height: 115)
            .background(Color.lightGray)
            .cornerRadius(8)
        }
        .padding(.horizontal, 32)
    }
}
