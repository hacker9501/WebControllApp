//
//  WCCardView.swift
//  WebControlApp
//
//  Created by Elver Mayta Hernández on 27/11/23.
//

import SwiftUI

struct WCCardView: View {
    
    var body: some View {
        VStack{
            WCImage(imageType: .named(""))
            WCImage(imageType: .system(""))
        }
        .padding(15)
        .frame(width: 360,height: 420)
        .background(.white)
        .cornerRadius(25)
        .shadow(radius: 3)
        .padding(.top,40)
        
    }
}

struct WCCardView_Previews: PreviewProvider {
    static var previews: some View {
        WCCardView()
        
    }
}
