//
//  UpdateContact.swift
//  ListaDeContactos
//
//  Created by Jhosel Badillo Cortes on 26/07/23.
//

import SwiftUI
import SwiftData

/// Vista para actualizar un contacto existente.
struct UpdateContact: View {
    
    @Environment(\.dismiss) var dismiss
    
    // State variable para mantener los datos del contacto que se está actualizando.
    @Bindable var contact: Contact
    
    
    var body: some View {
        List {
            TextField("First Name", text: $contact.firstName) // Campo de entrada para el nombre del contacto.
            TextField("Last Name", text: $contact.lastName) // Campo de entrada para el apellido del contacto.
            TextField("Phone Number", text: $contact.phoneNumber) // Campo de entrada para el número de teléfono del contacto.
            TextField("Email", text: $contact.email) // Campo de entrada para el correo electrónico del contacto.
            
            // Selector de fecha de cumpleaños del contacto.
            DatePicker("Birthday", selection: $contact.birthday, displayedComponents: .date)
                .datePickerStyle(.compact)
            
            // Botón para actualizar los datos del contacto.
            Button("Update") {
                // Implementar aquí la lógica para actualizar el contacto en el contexto de datos.
                // Por ejemplo, puedes utilizar el atributo @Environment(\.modelContext)
                // para acceder al contexto de datos y guardar los cambios en el contacto.
                
                dismiss() // Cierra la vista de actualización de contacto.
            }
            .navigationTitle("Update Contact") // Título de la navegación.
        }
    }
}

