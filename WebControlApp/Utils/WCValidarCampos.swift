//
//  WCValidarCampos.swift
//  WebControlApp
//
//  Created by Elver Mayta Hernández on 11/12/23.
//

import Foundation
import SwiftUI

enum ValidationType {
    case email
    case none
}

class WCCampoValidacion: ObservableObject {
    @Published var text: String = ""
    @Published var isValid: Bool = true
    var validationType: ValidationType = .none

    func validate() {
        switch validationType {
        case .email:
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            isValid = emailPredicate.evaluate(with: text)
        case .none:
            isValid = true
        }
    }
}
