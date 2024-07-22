//
//  NoteViewModel.swift
//  NoteApp
//
//  Created by 김혜림 on 7/22/24.
//

import Foundation
import FirebaseFirestore

class NoteViewModel: ObservableObject {
    @Published var notes = [Note]()
    
    private var databaseReference = Firestore.firestore().collection("Notes")
}
