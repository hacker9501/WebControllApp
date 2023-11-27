//
//  HeaderBackgroud.swift
//  WebControlApp
//
//  Created by Elver Mayta Hernández on 24/11/23.
//

import Foundation
import SwiftUI

struct CustomForma: Shape{
    func path(in rect: CGRect) -> Path{
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        let c1 = CGPoint(x: rect.midX+50, y: rect.maxY+20)
        let c2 = CGPoint(x: rect.midX-50, y: rect.maxY+20)
        
        path.addCurve(
            to: CGPoint(x: rect.minX, y: rect.maxY), control1: c1, control2: c2
        )
        path.closeSubpath()
        return path
    }
}
var headerBackgroud : some View{
    Rectangle()
        .fill(Color.ui.colorWebControl)
        .frame(maxWidth: .infinity)
        .frame(height: 250)
        .mask(
            (CustomForma())
        )
        .edgesIgnoringSafeArea(.top)
}
