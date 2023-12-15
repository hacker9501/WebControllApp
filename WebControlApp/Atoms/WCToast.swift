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
    var backgroundColor: Color?
    
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
                        .foregroundColor(.white)
                        .transition(.move(edge: .trailing))
                        .frame(width: 300,height: 50)
                        .background(backgroundColor)
                        .cornerRadius(50)
                        .padding(50)
                        
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
        WCToast(text: "Exito",backgroundColor: .gray)
            
    }
}
