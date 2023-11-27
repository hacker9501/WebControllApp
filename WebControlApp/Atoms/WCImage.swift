//
//  WCImage.swift
//  WebControlApp
//
//  Created by Elver Mayta Hernández on 24/11/23.
//

import SwiftUI

struct WCImage: View {
    enum ImageType {
        case system(String)
        case named(String)
    }

    var imageType: ImageType
    var width: CGFloat?
    var height: CGFloat?

    var body: some View {
        VStack {
            switch imageType {
            case .system(let systemName):
                Image(systemName: systemName)
                    .resizable()
                    .frame(width: width ?? 100, height: height ?? 100)
                    .aspectRatio(contentMode: .fit)
                    .padding()
            case .named(let imageName):
                Image(imageName)
                    .resizable()
                    .frame(width: width ?? 100, height: height ?? 100)
                    .aspectRatio(contentMode: .fit)
                    //.padding()
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        WCImage(imageType: .named("icons8-touch_id"), width: 100, height: 100)
    }
}
