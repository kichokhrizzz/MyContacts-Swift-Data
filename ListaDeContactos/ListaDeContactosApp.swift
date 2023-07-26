//
//  ListaDeContactosApp.swift
//  ListaDeContactos
//
//  Created by Jhosel Badillo Cortes on 25/07/23.
//

import SwiftUI
import SwiftData

/// Punto de entrada de la aplicación "ListaDeContactosApp".
@main
struct ListaDeContactosApp: App {
    
    var body: some Scene {
        WindowGroup {
            // Vista principal de la aplicación "ListaDeContactos".
            ContentView()
                .modelContainer(for: Contact.self) // Asigna el modelo de datos Contact a la vista principal.
        }
    }
}

