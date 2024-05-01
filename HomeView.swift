//
//  HomeView.swift
//  FireBaseDemo
//
//  Created by 林楷祐 on 2024/4/30.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
struct HomeView: View {
    @State var songName: String = ""
    @State var songSinger: String = ""
    @State var songRateStr: String = ""
    
    @FirestoreQuery(collectionPath: "songs") var songs: [Song]
    var body: some View {
        
        VStack {
            VStack {
                HStack {
                    Text("歌曲名稱：")
                    TextField("", text: $songName)
                }
                HStack {
                    Text("歌手：")
                    TextField("", text: $songSinger)
                }
            }
            .padding()
            Button(action: {
                let song = Song(name: songName, singer: songSinger, rate: 100)
                let db = Firestore.firestore()
                do {
                    let reference = try db.collection("songs").addDocument(from: song)
                    print(reference.documentID)

                }catch {
                    print(error)
                }


            }, label: {
                Text("create Song")
            })

            List {
                ForEach(songs) { song in
                    HStack {
                        Text(song.name)
                        Spacer()
                        Text(song.singer)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
