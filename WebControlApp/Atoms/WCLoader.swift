//
//  WCLoader.swift
//  WebControlApp
//
//  Created by Elver Mayta Hernández on 27/11/23.
//

import SwiftUI

struct WCLoader: View {
    
    var text:String
    
    var body: some View {
        ProgressView(text)
            .scaleEffect(2)
    }
}

struct WCLoader_Previews: PreviewProvider {
    static var previews: some View {
        WCLoader(text: "Cargando datos...")
    }
}
