//
//  UpdateContact.swift
//  ListaDeContactos
//
//  Created by Jhosel Badillo Cortes on 26/07/23.
//

import SwiftUI
import SwiftData

struct UpdateContact: View {
    
    
    @Environment(\.dismiss) var dismiss
    
    @Bindable var contact: Contact
    
    
    var body: some View {
        List{
            TextField("First Name", text: $contact.firstName )
            TextField("Last Name", text: $contact.lastName )
            TextField("Phone Number", text: $contact.phoneNumber)
            TextField("Email", text: $contact.email)
            DatePicker("Birthday", selection: $contact.birthday, displayedComponents: .date)
                .datePickerStyle(.compact)
            
            
            Button("Update"){
                
                
                
                dismiss()
                
            }
            .navigationTitle("Update Contact")
        }
    }
}

