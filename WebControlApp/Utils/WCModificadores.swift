//
//  WCModificadores.swift
//  WebControlApp
//
//  Created by Elver Mayta Hernández on 11/12/23.
//

import Foundation
import SwiftUI

struct WCModificadores: ViewModifier{
    
    var backgroundColor: Color?
    var cornerRadius: CGFloat?
    var textColor: Color?
    var width: CGFloat?
    var height: CGFloat?
    
    func body(content: Content) -> some View{
        content
            .frame(width: width ?? 320,height: height ?? 50)
            .background(backgroundColor)
            .cornerRadius(cornerRadius ?? 50)
            .foregroundColor(textColor)
            //.padding(.top,10)
    }
}

