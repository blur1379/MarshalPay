//
//  MarshalCompleteProfileStep6Module.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/12/1400 AP.
//

import SwiftUI
import Mantis
struct EducationInformationStep: View {
    @ObservedObject var user : User
    @State var statusOfSubmitBottom : Status = .none
    @State var code : String = ""
    
    @State var showImagePickerSheet : Bool = false
    @State var showImagePicker : Bool = false
    @State var sourceType : UIImagePickerController.SourceType = .camera
    @State var selectedImage : UIImage = UIImage()
    @State var showImageCropper = false
    @State private var cropShapeType: Mantis.CropShapeType = .rect
    @State private var presetFixedRatioType: Mantis.PresetFixedRatioType = .canUseMultiplePresetFixedRatio()
    @StateObject var educationImage : Photo = Photo()
    
    let pageSet : () -> Void
    var body: some View {
        VStack(alignment: .center, spacing: 16.0) {
            
            Spacer().frame(height: 0.0)

            VStack(alignment: .center, spacing: 16.0) {
                
                HStack {
                    
                    Spacer()
                    
                    Text("وضعیت تحصیلی :")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 20.0))
                        .foregroundColor(Color("marshal_White"))
                        .multilineTextAlignment(.trailing)
                    
                }
                
                .padding(.horizontal, 16.0)
                
                HStack(alignment: .center, spacing: 16.0) {

                    HStack(alignment: .center) {
                        
                        HStack {
                            Text("انصراف")
                                .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                                .foregroundColor(Color("marshal_White"))
                                .multilineTextAlignment(.trailing)
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(Color("marshal_White"))
                        }
                        .frame(maxWidth: .infinity)
                        
                        HStack {
                            Text("دانشجو")
                                .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                                .foregroundColor(Color("marshal_White"))
                                .multilineTextAlignment(.trailing)
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(Color("marshal_White"))
                        }
                        .frame(maxWidth: .infinity)
                        
                        HStack {
                            Text("فارغ تحصیل")
                                .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                                .foregroundColor(Color("marshal_White"))
                                .multilineTextAlignment(.trailing)
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(Color("marshal_White"))
                        }
                        .frame(maxWidth: .infinity)
                    }
 
                }
                
                .padding(.horizontal, 16.0)
                
            }

            MarshalTextField(text: $code, title: "آخرین مدرک تحصیلی", isEn: false, keyboardType: .default)
                .padding(.horizontal, 16.0)
            
            

            MarshalTextField(text: $user.information.fieldOfStudy.fa, title: "رشته تحصیلی", isEn: false, keyboardType: .numberPad)
                .padding(.horizontal, 16.0)
            
            MarshalTextField(text: $user.information.universityName.fa, title: "آخرین دانشگاه محل تحصیل", isEn: false, keyboardType: .numberPad)
                .padding(.horizontal, 16.0)
            
            ZStack{
                if educationImage.fileName == "" {
                    if educationImage.uploadStatus == .Failure || educationImage.uploadStatus == .none {
                        VStack(alignment: .center, spacing: 24.0) {
                            Image("icon_add_a_photo_24dp")
                                .resizable()
                                .frame(width: 56.0, height: 56.0, alignment: .center)
                                .scaledToFit()
                                .foregroundColor(Color("marshal_White"))
                                
                            Text("تصویر مدارک تحصیلی خود را وارد کنید")
                                .font(Font.custom("IRANSansMobileFaNum Medium", size: 16.0))
                                .foregroundColor(Color("marshal_White"))

                        }
                    }else {
                        ProgressViewMarshal()
                    }
                    
                }else{
                    DownloadImage(imageName: $educationImage.fileName)
                        .onAppear{
                            print(ConstantData().stringToURLForImage(url: educationImage.fileName))
                        }
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width - 36 , height: (UIScreen.main.bounds.width - 36) * 2/3)
                        .cornerRadius(12)
                }
            }
            .onTapGesture {
                showImagePicker = true                
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
                             ,photo: educationImage)
                    .ignoresSafeArea()
            })
            .frame(width: UIScreen.main.bounds.width - 36, height: (UIScreen.main.bounds.width - 36) * 2/3)
            .background(Color("marshal_surfGrey"))
            .cornerRadius(12.0)
            .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("marshal_White"), lineWidth:0.5))
 
            Submit(status: $statusOfSubmitBottom, title: "مرحله بعد") {
                if checkFields(){
                    user.information.degreeOfEducationImage = educationImage.fileName
                    
                }
            }
            
            Spacer().frame(height: 4.0)
 
        }
        //.background(Color("marshal_darkGrey"))

    }
    
    func checkFields() -> Bool{
        var isComplated = true
        if user.information.fieldOfStudy.fa == "" {
            isComplated = false
        }
        if user.information.universityName.fa == "" {
            isComplated = false
        }
        if user.information.universityName.fa == "" {
            isComplated = false
        }
        if educationImage.fileName == "" || educationImage.uploadStatus != .Successful {
            isComplated = false
        }
        
        return isComplated
    }
    
}

struct MarshalCompleteProfileStep6Module_Previews: PreviewProvider {
    static var previews: some View {
        EducationInformationStep(user: User(), pageSet: {})
            .previewLayout(.sizeThatFits)
    }
}
