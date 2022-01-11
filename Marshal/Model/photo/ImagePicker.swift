//
//  ImagePicker.swift
//  Marshal
//
//  Created by Blur on 10/14/1400 AP.
//

import Foundation
import SwiftUI



extension View {
    public func asUIImage() -> UIImage {
        let controller = UIHostingController(rootView: self)
        
        controller.view.frame = CGRect(x: 0, y: CGFloat(Int.max), width: 1, height: 1)
        UIApplication.shared.windows.first!.rootViewController?.view.addSubview(controller.view)
        
        let size = controller.sizeThatFits(in: UIScreen.main.bounds.size)
        controller.view.bounds = CGRect(origin: .zero, size: size)
        controller.view.sizeToFit()
        
        // here is the call to the function that converts UIView to UIImage: `.asImage()`
        let image = controller.view.asUIImage()
        controller.view.removeFromSuperview()
        return image
    }
}

extension UIView {
// This is the function to convert UIView to UIImage
    public func asUIImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var sourceType: UIImagePickerController.SourceType
    @Binding var uiImage : UIImage
    @Environment(\.presentationMode) var presentationMode
    @Binding var showimageCropper : Bool


    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding var sourceType: UIImagePickerController.SourceType
        @Binding var uiImage : UIImage
        @Binding var presentationMode: PresentationMode
        @Binding var showimageCropper : Bool

        init(sourceType : Binding<UIImagePickerController.SourceType> , uiImage : Binding<UIImage>,presentationMode: Binding<PresentationMode>,showimageCropper : Binding<Bool>) {
            _sourceType = sourceType
            _uiImage = uiImage
            _presentationMode = presentationMode
            _showimageCropper = showimageCropper
        }

        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
//            photo.image = Image(uiImage: uiImage)
            self.uiImage = uiImage
            showimageCropper = true
            sourceType = picker.sourceType
            presentationMode.dismiss()
            
            
        }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            presentationMode.dismiss()
        }
    }

    func makeCoordinator() -> Coordinator {
//        return Coordinator(imageui: $imageui, presentationMode: presentationMode, image: $image, parent: parent, from: from, isPrimaryImage: isPrimaryImage)
        return Coordinator(sourceType: $sourceType, uiImage : $uiImage, presentationMode: presentationMode, showimageCropper: $showimageCropper)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<ImagePicker>) {
        
        
    }

}
