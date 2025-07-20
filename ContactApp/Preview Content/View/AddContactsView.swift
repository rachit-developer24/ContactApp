//
//  AddContactsView.swift
//  ContactApp
//
//  Created by Rachit Sharma on 20/07/2025.
//

import SwiftUI

struct AddContactView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(ContactViewModel.self) var ViewMODEL
    @State var name: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    var body: some View {
        NavigationStack{
            Form {
                TextField("Name", text: $name)
                TextField("Last Name", text: $lastName)
                TextField("Email", text: $email)
            }
            .navigationTitle(Text("Add Contact"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement:.topBarLeading ){Text("Cancel")
                    .foregroundStyle(.blue)}
                ToolbarItem(placement:.topBarTrailing ){Button("Save"){
                    saveContact()
                    dismiss()
                }
                .fontWeight(.bold)
                    .foregroundStyle(.blue
                    )}
                
                    
                
            }
        }
       
        
    }
}
extension AddContactView {
    func saveContact(){
        let newcontact = ContactsModel(id: UUID(), name: name, lastName: lastName, email: email)
        ViewMODEL.addcontacts(newcontact)
    }
}

#Preview {
    AddContactView()
        .environment(ContactViewModel())
}
