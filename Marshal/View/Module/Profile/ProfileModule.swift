//
//  ProfileModule.swift
//  Marshal
//
//  Created by Blur on 2/9/22.
//

import SwiftUI

struct ProfileModule: View {
    @StateObject var pages = UserLevelPages()
    @State var user = User()
    var userCard : some View{
        VStack{
            HStack(alignment: .top){
                Image("icon_badge_24dp")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    
                
                Spacer()
                VStack{
                    Text("پوریا معتمد آریا")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                        .padding(.horizontal, 16.0)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_White"))
                    
                    Text("ویرایش")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                        .padding(.horizontal, 16.0)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_red"))
                }
                .padding(.top)
                
                
                DownloadImage(imageName: user.information.profileImage)
                    .frame(width: 70, height: 70, alignment: .center)
                    .offset(y: -28)
            }
            .padding(.horizontal, 30)
            HStack{
                Rectangle()
                    .frame(height: 2, alignment: .center)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity)
                Text("سطح کاربری ")
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                    .padding(.horizontal, 16.0)
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(Color("marshal_White"))
                
                Rectangle()
                    .frame(height: 2, alignment: .center)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity)

            }
            
            HStack{
                Spacer()
                Text("ارتقا سیلور")
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                    .padding(.horizontal, 16.0)
                    .padding()
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(Color("marshal_White"))
                Spacer()
            }.background(Image("backforupgrate").resizable())
                        
        }.background(Color("marshal_darkGrey").cornerRadius(12))
    }
    
    var harvestRow : some View {
        HStack{
            Image(systemName: "arrowtriangle.down.fill")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 8, height: 6)
                .padding(.horizontal, 16.0)
            
            Spacer()
            
            Text("لیست برداشت ها")
                .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                .padding(.horizontal, 16.0)
                .padding()
                .multilineTextAlignment(.trailing)
                .foregroundColor(Color("marshal_White"))
            
        } .frame(height: 50, alignment: .center)
            .background(Color("marshal_surfGrey"))
            .cornerRadius(12)
            .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("marshal_red"), lineWidth: 0.5)
                     
            )
            .padding(.horizontal , 16)
            .padding(.vertical , 8)
        

    }
    
    
    var depositRow : some View {
        HStack{
            Image(systemName: "arrowtriangle.down.fill")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 8, height: 6)
                .padding(.horizontal, 16.0)
            
            Spacer()
            
            Text("لیست واریز ها")
                .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                .padding(.horizontal, 16.0)
                .padding()
                .multilineTextAlignment(.trailing)
                .foregroundColor(Color("marshal_White"))
            
        } .frame(height: 50, alignment: .center)
            .background(Color("marshal_surfGrey"))
            .cornerRadius(12)
            .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("marshal_red"), lineWidth: 0.5)
                     
            )
            .padding(.horizontal , 16)
            .padding(.vertical , 8)
        

    }
    
    
    var stepBar : some View {
        HStack(alignment: .center, spacing: 0.0) {
            Group{
                Spacer()
                Image(pages.imagesLevel ? "upload_Image_selected_ic": "upload_image_ic" )
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .shadow(color: .black, radius: 4, y: pages.imagesLevel  ? 0 : 4)
                    .onTapGesture {
                        pages.clearData()
                        pages.imagesLevel = true
                    }
//                    .padding(.leading , 2)
                
            Spacer()
            
                Image(pages.englishLevel ? "english_information_selected_ic": "english_information_ic" )
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .shadow(color: .black, radius: 4, y: pages.englishLevel  ? 0 : 4)
                    .onTapGesture {
                        pages.clearData()
                        
                        pages.englishLevel = true
                    }
            
            Spacer()
            }
         
                Image(pages.persianLevel  ? "pertian_information_selected_ic": "pertian_information_ic" )
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .shadow(color: .black, radius: 4, y: pages.persianLevel ? 0 : 4)
                    .onTapGesture {
                        pages.clearData()
                        pages.persianLevel = true
                    }
            

        
            
            Spacer()
                
                Image(pages.jobLevel  ? "work_information_selected_ic": "work_information_ic" )
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .shadow(color: .black, radius: 4, y: pages.jobLevel  ? 0 : 4)
                    .onTapGesture {
                        pages.clearData()
                        pages.jobLevel = true
                    }
            Spacer()
                Image(pages.educationLevel ? "education_information_selected_ic": "education_information_ic" )
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .shadow(color: .black, radius: 4, y: pages.educationLevel  ? 0 : 4)
                    .onTapGesture {
                        pages.clearData()
                        pages.educationLevel = true
                    }
            Spacer()
    
        }
        .padding(16.0)
        //.padding(.bottom, 16.0)
        .frame(maxWidth: .infinity)
        
        //.background(Color("marshal_darkGrey"))
    }
    
    
    
    var body: some View {
        VStack(spacing : 0){
            HStack{
                userCard
                    .padding(.top,44)
                    .padding(.horizontal, 24)
            }
            .background(Image("backforprofile").resizable())
            
            harvestRow
            
            depositRow
            
            HStack{
                Spacer()
                Text("مشخصات کاربری")
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    .padding(.horizontal, 16.0)
                    .padding(.bottom)
                    .padding()
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(Color("marshal_White"))
                Spacer()
            }
            .background(Image("backforinformation").resizable())
            
            stepBar
            
            DownloadImage(imageName: user.information.identificationCardImage)
            
            
            
            
           Spacer()
               
        }
        .background(Color("marshal_darkGrey"))
           

    }
    
    
    
}

struct ProfileModule_Previews: PreviewProvider {
    static var previews: some View {
        ProfileModule()
    }
}
