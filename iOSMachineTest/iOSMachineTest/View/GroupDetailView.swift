//
//  GroupDetailView.swift
//  iOSMachineTest
//
//  Created by Mc on 20/03/24.
//

import SwiftUI
import Kingfisher

struct GroupDetailView: View {
    var data: GroupModel?

    var body: some View {
        HStack {
            ImageView(imageURL: data?.groupPhoto ?? "", width: 60, height: 60)
            VStack(alignment: .leading) {
                HStack {
                    Text(data?.name ?? "")
                        .lineLimit(1)
                        .font(Font.system(size: 16,weight: .semibold))
                    Text(data?.userStatus ?? "")
                        .font(Font.system(size: 10, weight: .regular))
                        .foregroundColor(.white)
                        .padding(.horizontal, 5)
                        .background(Color.appThemeColor)
                        .cornerRadius(8)
                }
                Text("Timothy: Hi are you there")
                    .font(Font.system(size: 12, weight: .medium))
            }
            Spacer()
            VStack {
                HStack {
                    Image("vector")
                    if let participantCount = data?.participantCount {
                        Text("\(participantCount)")
                    }
                }
                if let unreadCount = data?.participantCount {
                    ZStack {
                        Color.appThemeColor
                        Text("\(unreadCount)")
                            .font(Font.system(size: 11, weight: .regular))
                            .foregroundColor(.white)
                    }
                    .frame(width: 22, height: 22)
                    .clipShape(Circle())
                }
            }
        }
        .foregroundColor(.black)
        .background(Color.white)
    }
}

#Preview {
    GroupDetailView()
}
