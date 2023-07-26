//
//  CreateContact.swift
//  ListaDeContactos
//
//  Created by Jhosel Badillo Cortes on 25/07/23.
//

import SwiftUI

struct CreateContact: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Environment(\.modelContext) var context
    
    @State private var contact = Contact()
    
    var body: some View {
        List{
            TextField("First Name", text: $contact.firstName )
            TextField("Last Name", text: $contact.lastName )
            TextField("Phone Number", text: $contact.phoneNumber)
            TextField("Email", text: $contact.email)
            DatePicker("Birthday", selection: $contact.birthday, displayedComponents: .date)
                .datePickerStyle(.compact)
            
            
            Button("Register"){
                withAnimation{
                    context.insert(contact)
                }
                dismiss()
            }
        }
        .navigationTitle("Register Contact")
    }
}	

#Preview {
    CreateContact()
}
