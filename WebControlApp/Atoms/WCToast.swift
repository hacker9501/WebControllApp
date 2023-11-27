//
//  WCToast.swift
//  WebControlApp
//
//  Created by Elver Mayta Hernández on 27/11/23.
//

import SwiftUI

struct WCToast: View {
    
    @State private var showToast = false
    var text:String
    
    var body: some View {
        ZStack{
            VStack{
                Button(action:{
                    withAnimation{
                        showToast.toggle()
                    }
                }){
                    Text("Toast")
                }
            }
            VStack{
                Spacer()
                if showToast{
                    Text(text)
//                        .frame(width: 200,height: 200)
                        .background(Color.ui.colorWebControl)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .transition(.move(edge: .bottom))
                }
            }
        }
        .onChange(of: showToast) { newValue in
            if newValue{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                    withAnimation(.easeInOut){
                        showToast.toggle()
                    }
                }
            }
        }
    }
}

struct WCToast_Previews: PreviewProvider {
    static var previews: some View {
        WCToast(text: "WebControl")
    }
}
