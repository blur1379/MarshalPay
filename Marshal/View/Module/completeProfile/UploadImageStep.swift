//
//  MarshalCompleteProfileStep1Module.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/11/1400 AP.
//

import SwiftUI
import Mantis

struct UploadImageStep: View {
    @EnvironmentObject var user : User
    @State var statusOfSubmitBottom : Status = .none
    @State var showImagePickerSheet : Bool = false
    @State var showImagePicker : Bool = false
    @State var sourceType : UIImagePickerController.SourceType = .camera
    @State var selectedImage : UIImage = UIImage()
    @State var showImageCropper = false
    @State private var cropShapeType: Mantis.CropShapeType = .rect
    @State private var presetFixedRatioType: Mantis.PresetFixedRatioType = .canUseMultiplePresetFixedRatio()
    @StateObject var personalImage : Photo = Photo()
    @StateObject var nationalcard : Photo = Photo()
    @State var isFirstImage : Bool = true
    let pageSet : () -> Void
    var body: some View {
        VStack(alignment: .center, spacing: 16.0) {
            ZStack{
                if personalImage.fileName == "" {
                    if personalImage.uploadStatus == .Failure || personalImage.uploadStatus == .none {
                        VStack(alignment: .center, spacing: 24.0) {
                            Image("icon_add_a_photo_24dp")
                                .resizable()
                                .frame(width: 56.0, height: 56.0, alignment: .center)
                                .scaledToFit()
                                .foregroundColor(Color("marshal_White"))
                            
                            Text("عکس  خود را وارد کنید")
                                .font(Font.custom("IRANSansMobileFaNum Medium", size: 16.0))
                                .foregroundColor(Color("marshal_White"))
                            
                            
                        }
                    }else {
                        ProgressViewMarshal()
                    }
                    
                }else{
                    DownloadImage(imageName: $personalImage.fileName)
                        .onAppear{
                            print(ConstantData().stringToURLForImage(url: personalImage.fileName))
                        }
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width - 36 , height: (UIScreen.main.bounds.width - 36) * 2/3)
                        .cornerRadius(12)
                    
                }
            }
            .onTapGesture {
                showImagePicker = true
                isFirstImage = true
                
            }
            .frame(width: UIScreen.main.bounds.width - 36 , height: (UIScreen.main.bounds.width - 36) * 2/3)
            .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("marshal_White"), lineWidth:0.5))
            .actionSheet(isPresented: $showImagePicker) {
                ActionSheet(title: Text("تنظیم عکس پروفایل"), message: Text("عکس پروفایل خود را تنظیم کنید"), buttons: [
                    .default(Text("دوربین")) {
                        showImagePickerSheet = true
                        sourceType = .camera
                    },
                    .default(Text("گالری")) {
                        showImagePickerSheet = true
                        sourceType = .photoLibrary
                    },
                    .cancel(Text("انصراف"))
                ])
            }
            .sheet(isPresented: $showImagePickerSheet, content: {
                ImagePicker(sourceType : $sourceType,uiImage: $selectedImage, showimageCropper: $showImageCropper )
            })
            .fullScreenCover(isPresented: $showImageCropper, content: {
                
                ImageCropper(image: $selectedImage,
                             cropShapeType: $cropShapeType,
                             presetFixedRatioType: $presetFixedRatioType
                             ,photo: isFirstImage ? personalImage : nationalcard)
                    .ignoresSafeArea()
            })
            ZStack {
                if nationalcard.fileName == "" {
                    if nationalcard.uploadStatus == .Failure || nationalcard.uploadStatus == .none {
                        VStack(alignment: .center, spacing: 24.0) {
                            Image("icon_add_a_photo_24dp")
                                .resizable()
                                .frame(width: 56.0, height: 56.0, alignment: .center)
                                .scaledToFit()
                                .foregroundColor(Color("marshal_White"))
                            
                            Text("عکس کارت ملی خود را وارد کنید")
                                .font(Font.custom("IRANSansMobileFaNum Medium", size: 16.0))
                                .foregroundColor(Color("marshal_White"))
                            
                        }
                    }else{
                        ProgressViewMarshal()
                    }
                }else{
                    DownloadImage(imageName: $nationalcard.fileName)
                        .onAppear{
                            print(ConstantData().stringToURLForImage(url: personalImage.fileName))
                        }
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width - 36 , height: (UIScreen.main.bounds.width - 36) * 2/3)
                        .cornerRadius(12)
                    
                    
                }
                
                
            }
            
            .frame(width: UIScreen.main.bounds.width - 36 , height: (UIScreen.main.bounds.width - 36) * 2/3)
            .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("marshal_White"), lineWidth:0.5))
            .onTapGesture {
                showImagePicker = true
                isFirstImage = false
                
            }
            Submit(status: $statusOfSubmitBottom, title: "مرحله بعد") {
                if personalImage.fileName != "" && nationalcard.fileName != "" &&  personalImage.uploadStatus == .Successful && nationalcard.uploadStatus == .Successful {
                    user.information.identificationCardImage = nationalcard.fileName
                    
                    user.information.profileImage = personalImage.fileName
                    pageSet()
                }
                
            }
            
            Spacer().frame(height: 4.0)
            
        }
        //.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        
    }
}

struct UploadImageStep_Previews: PreviewProvider {
    static var previews: some View {
        UploadImageStep(pageSet: {})
            .previewLayout(.sizeThatFits)
            .background(Color("marshal_darkGrey"))
    }
}
