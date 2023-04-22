//
//  CertificateViewModel.swift
//  SwiftUICombineAndData
//
//  Created by Daniel Yeboah on 22.4.2023.
//

import Foundation
import Firebase

// final adds retriction means this class cannot be mutated
// observableObject means all published variables will be alerted of any changes
final class CertificateViewModel: ObservableObject {
    @Published var certificates: [Certificate] = [] // this will deliver certificates to it's subscribers on any changes to it
    
    init() {
        fetchCertificates()
    }
    
    func fetchCertificates() {
        let db = Firestore.firestore()
        
        db.collection("certificates").getDocuments() { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                if let querySnapshot = querySnapshot {
                    for document in querySnapshot.documents {
                        let data = document.data() // data is a dictionary
                        
                        // convert firebase data to swift values
                        let id = data["id"] as? String ?? ""
                        let course = data["course"] as? String ?? ""
                        let dateValue = (data["date"] as AnyObject).dateValue() // turn firebase date to Swift DateValue
                        let date = dateValue.formatDate()
                        let logo = data["logo"] as? String ?? ""
                        let instructor = data["instructor"] as? String ?? ""
                        
                        // convert swift values to a data model we can use in our application UI
                        let certificate = Certificate(id: id, course: course, date: date, logo: logo, instructor: instructor)
                        
                        self.certificates.append(certificate)
                    }
                }
            }
        }
    }
}
