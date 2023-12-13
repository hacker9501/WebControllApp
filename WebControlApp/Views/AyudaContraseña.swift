//
//  AyudaContraseña.swift
//  WebControlApp
//
//  Created by Elver Mayta Hernández on 22/11/23.
//

import SwiftUI
import Combine
@available(iOS 16.0, *)
struct AyudaContrasen_a: View {
    
    let limitId = 15
    @State private var id: String = ""
    @State private var iniciar: Bool = false
    @State private var atras: Bool = false
    @State private var isPresent = false
    @Environment(\.presentationMode) var presentationMode
    
    //    private var alert: WCAlert {
    //        return WCAlert(title: "Campo Vacío", message: "Por favor, ingresa tu ID.", pButton: "Entendido", sbutton: "")
    //    }
    
    
    var body: some View {
        ZStack{
            Group{
                NavigationLink(destination: CambiarContrasen_a(),isActive: $iniciar, label: {EmptyView()})
            }
            Color.ui.colorWebControl
                .ignoresSafeArea()
            ZStack(alignment: .top){
                VStack{
                    headerBackgroud
                    Spacer()
                }
                WCLogo(name: "logoWebControl",width: 230,height: 90)
                
            }
            VStack{
                    WCText(titleType: .title("Necesita ayuda con su contraseña?"),color: .white)
                    .padding(.top,80)
                    WCText(titleType: .subtitle("Ingrese el Id que utiliza WebControl App y le ayudaremos a crear una nueva contraseña"),color: .white)
                    TextFieldImageNot(TxtFieldType: .named("ID"), text:"", bindingVar: $id)
                        .keyboardType(.alphabet)
                        .onReceive(Just(id)) { _ in limitText(limitId) }
                        .onChange(of: id) { newValue in
                            if contieneCaracteresEspeciales(newValue) {
                                id = String(newValue.filter { $0.isLetter || $0.isNumber })
                            }
                        }
                    WCButton(action: {
                        if id.isEmpty{
                            //                        WCAlert(title: "Hola", message: "Como estas", pButton: "1", sbutton: "2")
                        }else{
                            iniciar = true
                        }
                    }, name: "INGRESAR",backgroundColor: .black,textColor: .white)
                    .onChange(of: id) { newValue in
                        if contieneCaracteresEspeciales(newValue) {
                            id = String(newValue.filter { $0.isLetter || $0.isNumber })
                        }
                    }
                    WCButton(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, name: "VOLVER",textColor: .white)
                    
            }
            
            
        }
    }
    func  limitText(_ upper: Int) {
        if id.count > upper {
            id = String(id.prefix(upper))
        }
    }
}

struct AyudaContrasen_a_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 16.0, *) {
            AyudaContrasen_a()
        } else {
            // Fallback on earlier versions
        }
    }
}
