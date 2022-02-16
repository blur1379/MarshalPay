//
//  MarshalDatePicker.swift
//  Marshal
//
//  Created by Blur on 11/26/1400 AP.
//

import SwiftUI
import Network

struct MarshalDatePicker: View {
//    @Binding var enterDate : String
    @Environment(\.dismiss) var dismiss

    let isEnglish : Bool
    @Binding var dateOfBirthEntered : String
    @State var status = Status.none
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .persian)
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
    let dateFormatterEn: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()

    @State var date = Date()

    var body: some View {
           VStack {
               if isEnglish{
                   DatePicker("Enter your birthday", selection: $date, in: ...Date(), displayedComponents: .date)
                       .datePickerStyle(GraphicalDatePickerStyle())
                       .frame(maxHeight: 400)
                   Spacer()
               }else{
                   DatePicker("Enter your birthday", selection: $date, in: ...Date(), displayedComponents: .date)
                       .datePickerStyle(GraphicalDatePickerStyle())
                       .frame(maxHeight: 400)
                       .environment(\.locale, Locale.init(identifier: "fa_IR"))
                       .environment(\.calendar,Calendar(identifier: .persian))
                   Spacer()
               }
              
               Submit(status: $status, title: "تایید") {
                   dismiss()
                   dateOfBirthEntered = isEnglish ? dateFormatterEn.string(from: date) : dateFormatter.string(from: date)
               }
               Spacer()
               
           }
           .environment(\.colorScheme, .dark)
           .background(Color("marshal_Grey"))
       }
}

struct MarshalDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        MarshalDatePicker(isEnglish: false, dateOfBirthEntered: .constant(""))
    }
}
