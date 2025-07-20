//
//  ContactsView.swift
//  ContactApp
//
//  Created by Rachit Sharma on 20/07/2025.
//

import SwiftUI

struct ContactsView: View {
    @State var ViewMODEL = ContactViewModel()
    @State var isPresented: Bool = false
    @State var searchableText: String = ""
    var searchresult : [ContactsModel]{
    return ViewMODEL.searchContacts(for: searchableText)
    }
    var body: some View {
        NavigationStack {
            VStack{
                List{
                    ForEach(searchresult){contact in
                        NavigationLink(value: contact) {
                            ContactRowView(contact: contact)
                                .swipeActions {
                                    Button {
                                        ViewMODEL.deletecontact(contact)
                                    } label: {
                                        Image(systemName: "trash")
                                    }
                                    .tint(.red)

                                    }
                                
                        }
                        
                    }
                }
                .sheet(isPresented: $isPresented) {
                    AddContactView()
                        .environment(ViewMODEL)
                        .presentationDetents([.medium])
                }
            }
            .searchable(text: $searchableText, prompt: "search")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {isPresented.toggle()}) {
                      Image(systemName: "plus")
                    }
                }
            }
            .navigationDestination(for: ContactsModel.self){contact in
                EditContactView(contact: contact)
                    .navigationBarBackButtonHidden(true)
                .environment(ViewMODEL)}
        }
    }
}

#Preview {
    ContactsView()
}
