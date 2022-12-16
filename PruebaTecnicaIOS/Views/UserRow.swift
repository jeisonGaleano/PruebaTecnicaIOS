//
//  UserRow.swift
//  PruebaTecnicaIOS
//
//  Created by Jeison Galeano on 16/12/22.
//

import Foundation
import SwiftUI

struct UserRow: View {
    var userData: UserData

    var body: some View {
        HStack {
            userData.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(userData.name)

            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserRow(userData: userDataJson[0])
            UserRow(userData: userDataJson[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
