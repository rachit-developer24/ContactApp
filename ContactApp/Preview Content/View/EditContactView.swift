//
//  EditContactView.swift
//  ContactApp
//
//  Created by Rachit Sharma on 20/07/2025.
//

import SwiftUI

struct EditContactView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(ContactViewModel.self) var Viewmodel
    @State var showdeleteconfirmation: Bool = false
    @State  var contact: ContactsModel
    @State var contactdidChange: Bool = false
    @State var showexitconfirmation: Bool = false
    let originalcontact:ContactsModel
    init(contact:ContactsModel){
        _contact = State(initialValue: contact)
        self.originalcontact = contact
    }
    var body: some View {
       // NavigationStack{
            Form{
                TextField("Name", text: $contact.name)
                TextField("Lastname", text: $contact.lastName)
                TextField("Email", text: $contact.email)
            }
            .navigationBarTitle("Edit Contact")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        oncancel()
                    } label: {
                        Text("Cancel")
                            .foregroundStyle(.blue)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        Viewmodel.editcontact(contact)
                        dismiss()
                    } label: {
                        Text("Save")
                            .fontWeight(.bold)
                            .foregroundStyle(.blue)
                    }
                    .disabled(!contactdidChange)
                    .opacity(contactdidChange ? 1 : 0.5)
                    .font(.headline)
                    

               // }
            }
        }
        Button(action: {
            showdeleteconfirmation = true
        }, label: {
            Text("Delete")
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .frame(width: 360, height: 50)
                .background(Color.red)
                .clipShape(.rect(cornerRadius: 10))
        })
    
        .alert("Delete Contact", isPresented: $showdeleteconfirmation, actions: {
            Button("stay", role: .cancel){}
            Button("delete",role: .destructive){
                Viewmodel.deletecontact(contact)
                dismiss()
            }
        })
        .alert("discard Changes", isPresented: $showexitconfirmation, actions: {
            Button("stay",role: .cancel){}
            Button("discard",role: .destructive){
                dismiss()
            }
        })
        .onChange(of: contact) { oldValue, newValue in
            contactdidChange = newValue != originalcontact
        }
    }
}
private extension EditContactView {
    func oncancel() {
        if contactdidChange{
            showexitconfirmation = true
        }else{
            dismiss()
        }
    }
}

#Preview {
    EditContactView(contact: ContactsModel(id: UUID(), name: "Rachit", lastName: "Sharma", email: "srachit841@gmail.com"))
        .environment(ContactViewModel())
}
