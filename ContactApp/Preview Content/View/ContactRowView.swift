//
//  ContactRowView.swift
//  ContactApp
//
//  Created by Rachit Sharma on 20/07/2025.
//

import SwiftUI

struct ContactRowView: View {
    let contact : ContactsModel
    var body: some View {
        VStack{
            HStack{
                Text(contact.initials)
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(width: 50, height: 50)
                    .background(Color(.systemGray6))
                    .clipShape(Circle())
                    
                    
                VStack(alignment:.leading , spacing:5){
                    Text("\(contact.name) \(contact.lastName) ")
                        .fontWeight(.semibold)
                    Text(contact.email)
                        .foregroundStyle(.gray)
                    
                }
            }
        }
    }
}

#Preview {
    ContactRowView(contact: ContactsModel(id: UUID(), name: "Rachit", lastName: "Sharma", email: "srachit841@gmail.com"))
}
