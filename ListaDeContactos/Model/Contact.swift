//
//  Contact.swift
//  ListaDeContactos
//
//  Created by Jhosel Badillo Cortes on 25/07/23.
//

import Foundation
import SwiftData

/// Modelo de datos para representar un contacto.
@Model
final class Contact {
    var firstName: String // Nombre del contacto.
    var lastName: String // Apellido del contacto.
    var phoneNumber: String // Número de teléfono del contacto.
    var email: String // Correo electrónico del contacto.
    var birthday: Date // Fecha de cumpleaños del contacto.
    
    /// Inicializador para crear un nuevo contacto.
    /// - Parameters:
    ///   - firstName: Nombre del contacto. Por defecto es una cadena vacía.
    ///   - lastName: Apellido del contacto. Por defecto es una cadena vacía.
    ///   - phoneNumber: Número de teléfono del contacto. Por defecto es una cadena vacía.
    ///   - email: Correo electrónico del contacto. Por defecto es una cadena vacía.
    ///   - birthday: Fecha de cumpleaños del contacto. Por defecto es la fecha actual.
    init(firstName: String = "", lastName: String = "", phoneNumber: String = "", email: String = "", birthday: Date = .now) {
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.email = email
        self.birthday = birthday
    }
}

