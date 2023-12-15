//
//  WCTextField.swift
//  WebControlApp
//
//  Created by Elver Mayta Hernández on 24/11/23.
//

import SwiftUI
import Combine

struct WCTextFieldTelefono: View {
    var image: String?
    var width: CGFloat?
    var height: CGFloat?
    var text: String
    @State private var password: String = ""
    var bindingVar: Binding<String>
    var showError: Bool
    
    var body: some View {
        HStack{
            Image(systemName: image ?? "")
                .foregroundColor(.gray)
                .padding(.leading, 8)
            
            TextField(text, text: bindingVar)
                .padding(.leading,60)
        }.padding()
            .background(Color.white)
            .cornerRadius(50)
            //.overlay(RoundedRectangle(cornerRadius: 50).stroke(showError ? Color.red : Color.blue , lineWidth: 1))
            .frame(width: width ?? 320,height: height ?? 50)
            //.padding(.bottom)
    }
}

struct WCTextFieldCampo: View {
    var image: String?
    var width: CGFloat?
    var height: CGFloat?
    var text: String
    @State private var password: String = ""
    var bindingVar: Binding<String>
    var showError: Bool
    
    var body: some View {
        HStack{
            Image(systemName: image ?? "")
                .foregroundColor(.gray)
                .padding(.leading, 8)
            
            TextField(text, text: bindingVar)
        }.padding()
            .background(Color.white)
            .cornerRadius(50)
            //.overlay(RoundedRectangle(cornerRadius: 50).stroke(showError ? Color.red : Color.blue , lineWidth: 1))
            .frame(width: width ?? 320,height: height ?? 50)
            //.padding(.bottom)
    }
}

struct WCTextField: View {
    var image: String?
    var text: String
    @State private var password: String = ""
    @Binding var bindingVar: String
    //@Binding var value :String
    @State private var showPassword: Bool = true
    var showError: Bool
    
    var body: some View {
        HStack{
            Image(systemName: image ?? "")
                .foregroundColor(.gray)
                .padding(.leading, 8)
            if showPassword{
                SecureField(text, text: $bindingVar)
            }else{
                TextField(text, text: $bindingVar)
                    .frame(height: 20)
            }
        }.padding()
            .background(Color.white)
            .cornerRadius(50)
            //.overlay(RoundedRectangle(cornerRadius: 50).stroke(showError ? Color.red : Color.blue, lineWidth: 1))
            .frame(width: 320,height: 50)
            //.padding(.bottom)
            .overlay(alignment:.trailing){
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                    .onTapGesture {
                        showPassword.toggle()
                    }
                    .foregroundColor(.gray)
                            .padding()
                            .padding(.top,0)
                            //.contentShape()
                }
            }
}



/*struct TextField_Previews: PreviewProvider {
    static var previews: some View {
        WCTextField(image: "lock", text: "Contraseña", bindingVar: $password)
    }
}*/

struct WCTextFieldText: View {
    let limitId = 15
    var image: String?
    var width: CGFloat?
    var height: CGFloat?
    var text: String
    var bindingVar: Binding<String>
    var showError: Bool
    
    var body: some View {
        HStack{
            Image(systemName: image ?? "")
                .foregroundColor(.gray)
                .padding(.leading, 8)
            TextField(text, text: bindingVar)
        }.padding()
            .background(Color.white)
            .cornerRadius(50)
            //.overlay(RoundedRectangle(cornerRadius: 50).stroke(showError ? Color.red : Color.blue, lineWidth: 1))
            .frame(width: width ?? 320,height: height ?? 50)
            //.padding(.bottom)
    }
}



func contieneCaracteresEspeciales(_ texto: String) -> Bool {
    let caracteresEspeciales = CharacterSet.alphanumerics.inverted
    return texto.rangeOfCharacter(from: caracteresEspeciales) != nil
}


struct TextFieldImageNot: View {
    
    enum TextFieldType {
        case password(String)
        case named(String)
    }
    
    var TxtFieldType: TextFieldType
    @State private var showPassword: Bool = true
    var text: String?
    @Binding var bindingVar: String
    @State private var confirmar: String = ""
    
    var body: some View {
        VStack{
            switch TxtFieldType {
            case .password(let text):
                HStack{
                    if showPassword{
                        SecureField(text, text: $bindingVar)
                    }else{
                        TextField(text, text: $bindingVar)
                            .frame(height: 20)
                    }
                }.padding()
                    .background(Color.white)
                    .cornerRadius(50)
                    .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.blue, lineWidth: 1))
                    .padding()
                    .overlay(alignment:.trailing){
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                            .onTapGesture {
                                showPassword.toggle()
                            }
                            .foregroundColor(.gray)
                            .padding()
                            .padding(.top,0)
                            .padding(.trailing,10)
                        //.contentShape()
                    }
                //SecureField(text, text: $bindingVar)
                    
            case .named(let text):
                TextField(text, text: $bindingVar)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(50)
                    .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.blue, lineWidth: 1))
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
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.blue, lineWidth: 1))
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
}
