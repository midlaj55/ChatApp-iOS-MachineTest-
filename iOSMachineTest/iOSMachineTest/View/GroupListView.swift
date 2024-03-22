//
//  GroupListView.swift
//  iOSMachineTest
//
//  Created by Mc on 20/03/24.
//

import SwiftUI
import Kingfisher

struct GroupListView: View {
    @StateObject var viewModel = GroupViewModel()
    @State private var isFirstTime = true // Track if it's the first time view appears

    var body: some View {
        NavigationView {
            VStack {
                GroupTitleView()
                List {
                    Spacer()
                    if let groups = viewModel.groupItems?.groups {
                        ForEach(groups, id: \.self) { item in
                            NavigationLink(
                                destination: GroupView(data: item),
                                label: {
                                    GroupDetailView(data: item)
                                }
                            )
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .padding(.horizontal, 8)
                .background(Color.white)
                .cornerRadius(50)
            }
            .environmentObject(viewModel)
            .onAppear {
                if isFirstTime {
                    viewModel.getItemListValues()
                    isFirstTime = false
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .background(Color.appThemeColor)
        }
    }
}

struct GroupTitleView: View {
    var body: some View {
        HStack {
            Spacer()
            HStack {
                Text("GROUP")
                    .font(.system(size: 24, weight: .bold))
                Spacer()
                Image(systemName: "magnifyingglass")
                    .frame(width: 24, height: 24)
                Image("option_button")
                    .frame(width: 24, height: 24)
            }
            Spacer()
        }
        .frame(height: 70)
        .foregroundColor(.white)
        .padding(.horizontal)
        .background(Color.appThemeColor)
    }
}
