//
//  Logo.swift
//  WebControlApp
//
//  Created by Elver Mayta Hernández on 24/11/23.
//

import SwiftUI

struct WCLogo: View {
    
    var name: String
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        VStack{
            Image(name)
                .resizable()
                .frame(width: width, height: height)
                .aspectRatio(contentMode: .fit)
                .padding(.top,-5)
            
        }
    }
}

struct Logo_Previews: PreviewProvider {
    static var previews: some View {
        WCLogo(name: "logoWebControl",width: 230,height: 90)
    }
}
