//
//  WCTextField.swift
//  WebControlApp
//
//  Created by Elver Mayta Hernández on 24/11/23.
//

import SwiftUI

struct WCTextField: View {
    
    var image: String?
    var text: String
    @State private var password: String = ""
    
    var body: some View {
        HStack{
            Image(systemName: image ?? "")
                .foregroundColor(.gray)
                .padding(.leading, 8)
            SecureField(text, text: $password)
        }.padding()
            .background(Color.white)
            .cornerRadius(50)
            .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.blue, lineWidth: 2))
            .frame(width: 320,height: 40)
            .padding(.bottom)
        
        
    }
}

struct TextField_Previews: PreviewProvider {
    static var previews: some View {
        WCTextField(image: "lock", text: "Contraseña")
    }
}

struct WCTextFieldText: View {
    
    var image: String?
    var width: CGFloat?
    var height: CGFloat?
    var text: String
    @State private var password: String = ""
    
    var body: some View {
        HStack{
            Image(systemName: image ?? "")
                .foregroundColor(.gray)
                .padding(.leading, 8)
            TextField(text, text: $password)
        }.padding()
            .background(Color.white)
            .cornerRadius(50)
            .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.blue, lineWidth: 2))
            .frame(width: width ?? 320,height: height ?? 40)
            .padding(.bottom)
    }
}

struct TextFieldImageNot: View {
    var text: String
    @State private var confirmar: String = ""
    
    var body: some View {
        VStack{
            SecureField(text, text: $confirmar)
                .padding()
                .background(Color.white)
                .cornerRadius(50)
                .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.blue, lineWidth: 2))
                .padding()
        }
    }
}

struct FloatingTitleTextField: View {
    
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField("", text: $text)
            .foregroundColor(.gray)
            .font(.system(size: 20))
            .padding(EdgeInsets(top: 20, leading: 65, bottom: 30, trailing: 50))
            .background
        {
            Image(systemName: "person.text.rectangle")
                .foregroundColor(.gray)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 240))
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 50)
                    .stroke(.black, lineWidth: 0)
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(50)
                    .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.blue, lineWidth: 2))
                    .frame(width: 300,height: 53)
                    .padding(.bottom)
                Text(placeholder)
                    .foregroundColor(.gray)
                    .padding(2)
                    .background()
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity,
                           alignment: .topLeading)
                
                    .offset(x: 20, y: -10)
            }
        }
    }
}
