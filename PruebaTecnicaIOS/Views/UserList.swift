//
//  UserList.swift
//  PruebaTecnicaIOS
//
//  Created by Jeison Galeano on 16/12/22.
//

import Foundation
import SwiftUI

struct UserList: View {
    
    @State var userDataJson = [UserData]()
    
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(filteredResorts) { data in
                    NavigationLink {
                        UserDetail(userData: data)
                    } label: {
                        UserRow(userData: data)
                    }
                }
            }.onAppear() {
                ApiConsumer().loadData { (userDataJson) in
                    self.userDataJson = userDataJson
                }
            }.searchable(text: $searchText, prompt: "Buscar en lista de usuarios")
            .navigationTitle("Usuarios")
            
        }
    }
    
    var filteredResorts: [UserData] {
        if searchText.isEmpty {
            return userDataJson
        } else {
            return userDataJson.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            UserList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
