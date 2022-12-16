//
//  UserDetail.swift
//  PruebaTecnicaIOS
//
//  Created by Jeison Galeano on 16/12/22.
//

import Foundation

import SwiftUI

struct UserDetail: View {
    @State var postsDataJson = [PostsData]()
    var userData: UserData

    var body: some View {
        ScrollView {
            MapView(coordinate: userData.address.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage(image: userData.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(userData.name)
                    .font(.title)
                
                HStack {
                    Text(userData.email)
                    Spacer()
                    Text(userData.phone)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                Divider()
                
                ForEach(postsDataJson) { data in
                    Text(data.title)
                        .font(.title2)
                    Text(data.body)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        Divider()
                }
                
            }
            .padding()
            
        }
        .navigationTitle(userData.name)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear() {
            ApiConsumer().loadDataPosts(id: userData.id, completion: {
                    (postsData) in
                        self.postsDataJson = postsData
            })
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        UserDetail(userData: userDataJson[0])
    }
}
