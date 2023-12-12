//
//  CustonText.swift
//  WebControlApp
//
//  Created by Elver Mayta Hernández on 24/11/23.
//

import SwiftUI

struct WCText: View {
    enum TitleType {
        case title(String)
        case subtitle(String)
    }

    var titleType: TitleType
    var width: CGFloat?
    var height: CGFloat?
    var color: Color?
    
    var body: some View {
        VStack{
            switch titleType {
            case .title (let title):
                Text(title)
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                    .foregroundColor(color)
            case .subtitle(let subtitle):
                Text(subtitle)
                    .frame(width: 370)
                    .multilineTextAlignment(.center)
                    .foregroundColor(color)
                    .padding()
            }
        }
    }
}

struct CustonText_Previews: PreviewProvider {
    static var previews: some View {
        WCText(titleType: .title("Cambio de contraseña"))
    }
}
