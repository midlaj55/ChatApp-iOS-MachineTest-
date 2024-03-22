//
//  ImageView.swift
//  iOSMachineTest
//
//  Created by Mc on 21/03/24.
//


import SwiftUI
import Kingfisher

struct ImageView: View {
    var imageURL: String?
    var width: CGFloat
    var height: CGFloat

    var body: some View {
        KFImage(URL(string: imageURL ?? ""))
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .frame(width: width, height: height)
    }
}
