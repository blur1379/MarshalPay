//
//  Photo.swift
//  Marshal
//
//  Created by Blur on 10/14/1400 AP.
//

import SwiftUI

class Photo : Identifiable ,ObservableObject{
    @Published var fileName : String = ""
    @Published var id: String = ""
    var localId : Int = 0
    @Published var image : Image = Image("")
    @Published var uiImage : UIImage = UIImage()
    @Published var uploadStatus : Status = .none
    
    
    //MARK: - FUNCTION
    func upload(){
        let callApi = CallApi()
        callApi.uploadImage(image: uiImage) { photo in
            self.id = photo.id
            self.fileName = photo.fileName
        } status: { status in
            self.uploadStatus = status
        }
//        DispatchQueue.main.async {
//            callApi.apiForUploadImagePostman(image: self.uiImage) { Status in
//            self.uploadStatus = Status
//        } fileName: { fileName in
//            self.fileName = fileName
//        }
//
//
//        }

    }
    
}
