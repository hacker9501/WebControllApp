//
//  WCPageSheep.swift
//  WebControlApp
//
//  Created by Elver Mayta Hernández on 28/11/23.
//

import SwiftUI
@available(iOS 16.0, *)
struct WCPageSheet: View {
    
    @State var showSheet = false
    
    var body: some View {
        VStack{
            Button("Tap Me!"){
                showSheet.toggle()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .sheet(isPresented: $showSheet) {
            SheetView()
                //.presentationDetents([.medium,.large])
                //.presentationDetents([.height(100)])
                .presentationDetents([.fraction(0.2),.medium,.large])
                .presentationDragIndicator(.visible)
        }
    }
}

struct WCPageSheep_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 16.0, *) {
            WCPageSheet()
        } else {
            // Fallback on earlier versions
        }
    }
}

struct SheetView:View{
    var body: some View{
        Text("Select")
            .font(.title)
        HStack{
            Image(systemName: "star")
                .padding()
            Image(systemName: "bell")
                .padding()
            Image(systemName: "globe")
                .padding()
            Image(systemName: "house")
                .padding()
        }
    }
}
