//
//  ImageCropper.swift
//  Marshal
//
//  Created by Blur on 10/14/1400 AP.
//

import SwiftUI
import Mantis

struct ImageCropper: UIViewControllerRepresentable {
    
    @Binding var image: UIImage
    @Binding var cropShapeType: Mantis.CropShapeType
    @Binding var presetFixedRatioType: Mantis.PresetFixedRatioType
    @StateObject var photo : Photo
    @Environment(\.presentationMode) var presentationMode
    
    class Coordinator: CropViewControllerDelegate {
        var parent: ImageCropper
        
        
        init(_ parent: ImageCropper) {
            self.parent = parent
        }
        
        func cropViewControllerDidCrop(_ cropViewController: CropViewController, cropped: UIImage, transformation: Transformation) {
            
                parent.photo.uiImage = cropped
                parent.photo.image = Image(uiImage: cropped)
                parent.photo.localId = 0
                parent.image = cropped
                print("transformation is \(transformation)")
                parent.photo.upload()
           
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func cropViewControllerDidCancel(_ cropViewController: CropViewController, original: UIImage) {
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func cropViewControllerDidFailToCrop(_ cropViewController: CropViewController, original: UIImage) {
        }
        
        func cropViewControllerDidBeginResize(_ cropViewController: CropViewController) {
        }
        
        func cropViewControllerDidEndResize(_ cropViewController: CropViewController, original: UIImage, cropInfo: CropInfo) {
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> CropViewController {
        var config = Mantis.Config()
        config.cropShapeType = cropShapeType
        config.presetFixedRatioType = presetFixedRatioType
        config.presetFixedRatioType = .alwaysUsingOnePresetFixedRatio(ratio: 3 / 2)
        
        let cropViewController = Mantis.cropViewController(image: image,
                                                           config: config)
        cropViewController.delegate = context.coordinator
        return cropViewController
    }
    
    func updateUIViewController(_ uiViewController: CropViewController, context: Context) {
        
    }
}

