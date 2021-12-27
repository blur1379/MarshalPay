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
        
        ScrollView {
            VStack(alignment: .leading, spacing: 0){
                ForEach(CountryCodes().countryDictionary.sorted(by: <), id: \.key){ key , value in
                    HStack{
                        Text("\(self.flag(country: key))")
                        
                        Text("\(self.countryName(countryCode: key) ?? key)")
                            .foregroundColor(Color.white)
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 14))
                        Spacer()
                        Text("+\(value)")
                            .foregroundColor(Color.white)
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 14))
                    }//: HSTACK
                    .padding()
                    .onTapGesture {
                        flag = self.flag(country: key)
                        code = value
                        presentationMode.wrappedValue.dismiss()
                    }
                }//: LOOP
            }//:VSTACK
            .background(Color("marshal_darkGrey"))
            
        }//:SCROLLVIEW
        .ignoresSafeArea()
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
