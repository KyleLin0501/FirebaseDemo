//
//  Song.swift
//  FireBaseDemo
//
//  Created by 林楷祐 on 2024/4/30.
//

import FirebaseFirestoreSwift
struct Song : Codable, Identifiable {
    @DocumentID var id: String?
    let name: String
    let singer: String
    let rate: Int
}


