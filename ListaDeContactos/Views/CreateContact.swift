//
//  CreateContact.swift
//  ListaDeContactos
//
//  Created by Jhosel Badillo Cortes on 25/07/23.
//

import SwiftUI

/// Vista para crear un nuevo contacto.
struct CreateContact: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Environment(\.modelContext) var context
    
    // State variable para mantener los datos del nuevo contacto que se está creando.
    @State private var contact = Contact()
    
    var body: some View {
        List {
            TextField("First Name", text: $contact.firstName) // Campo de entrada para el nombre del contacto.
            TextField("Last Name", text: $contact.lastName) // Campo de entrada para el apellido del contacto.
            TextField("Phone Number", text: $contact.phoneNumber) // Campo de entrada para el número de teléfono del contacto.
            TextField("Email", text: $contact.email) // Campo de entrada para el correo electrónico del contacto.
            
            // Selector de fecha de cumpleaños del contacto.
            DatePicker("Birthday", selection: $contact.birthday, displayedComponents: .date)
                .datePickerStyle(.compact)
            
            // Botón para registrar el nuevo contacto.
            Button("Register") {
                withAnimation {
                    context.insert(contact) // Inserta el nuevo contacto en el contexto de datos.
                }
                dismiss() // Cierra la vista de creación de contacto.
            }
        }
        .navigationTitle("Register Contact") // Título de la navegación.
    }
}

