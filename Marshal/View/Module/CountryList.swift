//
//  CountryList.swift
//  Marshal
//
//  Created by Blur on 12/24/21.
//

import SwiftUI

struct CountryList: View {
    //MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    @Binding var flag : String
    @Binding var code : String
    
    //MARK: - BODY
    var body: some View {
        
        VStack (spacing: 0){
            Text("انتخاب نام یا پیش‌شماره کشور")
            .font(.custom("IRANSansMobileNoEn Bold", size: 18))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 56, alignment: .trailing)
            .foregroundColor(Color("marshal_White"))
            .padding(.horizontal, 16.0)
            //.padding(.bottom, 8)

            Divider()
                .frame(height: 0.5).background(Color("marshal_red"))
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0){
                    ForEach(CountryCodes().countryDictionary.sorted(by: <), id: \.key){ key , value in
                        HStack{
                            Text("\(self.flag(country: key))")
                            
                            Text("\(self.countryName(countryCode: key) ?? key)")
                                .foregroundColor(Color("marshal_White"))
                                .font(Font.custom("IRANSansMobileFaNum Medium", size: 14))
                            Spacer()
                            Text("+ \(value)")
                                .foregroundColor(Color("marshal_White"))
                                .font(Font.custom("IRANSansMobileFaNum Medium", size: 14))
                        }//: HSTACK
                        .padding(16.0)
                        .onTapGesture {
                            flag = self.flag(country: key)
                            code = value
                            presentationMode.wrappedValue.dismiss()
                        }
//                        Divider()
//                            .frame(width: .infinity,height: 0.5)
//                            .background(Color("marshal_red"))
//                            .padding(.horizontal, 16.0)
                    }//: LOOP
                }//:VSTACK
                
            }//:SCROLLVIEW
            //.background(Color("marshal_darkGrey"))
        }
        .background(Color("marshal_surfGrey"))
        //.ignoresSafeArea()
            

            

        

        
    }
    //MARK: - FUNCTION
    func flag(country:String) -> String {
        let base : UInt32 = 127397
        var flag = ""
        for v in country.unicodeScalars {
            flag.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return flag
    }
    func countryName(countryCode: String) -> String? {
            let current = Locale(identifier: "en_US")
            return current.localizedString(forRegionCode: countryCode)
        }
}
//MARK: - PREVIEW
struct CountryList_Previews: PreviewProvider {
    static var previews: some View {
        CountryList(flag: .constant(""), code: .constant(""))
    }
}
