//
//  ContentView.swift
//  ListaDeContactos
//
//  Created by Jhosel Badillo Cortes on 25/07/23.
//

import SwiftUI
import SwiftData

/// Vista principal que muestra una lista de contactos.
struct ContentView: View {
    
    @Environment(\.modelContext) var context
    
    // State variable para controlar la presentación de la vista de creación de contacto.
    @State private var showCreateView = false
    
    // State variable para mantener el contacto que se está editando actualmente.
    @State private var editContact: Contact?
    
    // Lista de contactos obtenida a través de un @Query.
    @Query private var contacts: [Contact]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(contacts) { contact in
                    HStack(spacing: 16) {
                        Text("👤")
                            .font(.largeTitle)
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text(contact.firstName)
                                    .font(.headline)
                                Text(contact.lastName)
                                    .font(.headline)
                            }
                            Text(contact.phoneNumber)
                                .foregroundColor(.secondary)
                            Text(contact.email)
                                .foregroundColor(.secondary)
                            Text(contact.birthday, format: Date.FormatStyle(date: .abbreviated))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Button(action: {
                            editContact = contact
                        }, label: {
                            Label("Edit", systemImage: "pencil")
                                .font(.headline)
                                .foregroundColor(.blue)
                        })
                    }
                    .padding(8)
                    .background(Color.white) // Fondo claro para el HStack
                    .cornerRadius(10)
                    .shadow(color: Color(.gray).opacity(0.3), radius: 4, x: 0, y: 2)
                    
                    .swipeActions {
                        Button(role: .destructive) {
                            withAnimation {
                                context.delete(contact)
                            }
                        } label: {
                            Label("Delete", systemImage: "trash.fill")
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("My Contacts 👤")
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        showCreateView.toggle()
                    }, label: {
                        Label("Add Contact", systemImage: "plus")
                    })
                }
            } //:TOOLBAR
            .sheet(isPresented: $showCreateView) {
                NavigationStack {
                    CreateContact()
                }
                .presentationDetents([.medium])
            }
            .sheet(item: $editContact) {
                editContact = nil
            } content: { contact in
                UpdateContact(contact: contact)

            }
        } //:NAVIGATION STACK
    }
}
