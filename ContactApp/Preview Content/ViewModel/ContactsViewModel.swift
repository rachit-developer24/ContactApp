//
//  ContactsViewModel.swift
//  ContactApp
//
//  Created by Rachit Sharma on 20/07/2025.
//

import Foundation
import Observation
@Observable
class ContactViewModel{
    var contacts = [ContactsModel]()
    init(){
        fetchContacts()
    }
    func fetchContacts(){
        self.contacts = [
            ContactsModel(id: UUID(), name: "Rachit", lastName: "Sharma", email: "rachit@gmail.com)"),
            ContactsModel(id: UUID(), name: "Amit", lastName: "Singh", email: "amit@gmail.com"),
            ContactsModel(id: UUID(), name: "Rohit", lastName: "Gupta", email: "rohit@gmail.com"),
        ]
    }
    
    func addcontacts(_ newContact: ContactsModel){
        contacts.append(newContact)
    }
    func deletecontact(_ contact :ContactsModel){
        guard let index = contacts.firstIndex(where: {$0.id == contact.id}) else {return}
        contacts.remove(at: index)
    }
    func editcontact (_ contact :ContactsModel){
        guard let index = contacts.firstIndex(where: {$0.id == contact.id}) else {return}
        contacts[index] = contact
    }
    
    func searchContacts(for query: String) -> [ContactsModel] {
        guard !query.isEmpty else {
            return contacts
        }
        return contacts.filter {
            $0.name.localizedCaseInsensitiveContains(query)
            || $0.lastName.localizedCaseInsensitiveContains(query)
            || $0.email.localizedCaseInsensitiveContains(query)
        }
    }
    
}

