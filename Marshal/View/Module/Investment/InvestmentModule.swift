//
//  InvestmentModule.swift
//  Marshal
//
//  Created by Blur on 2/8/22.
//

import SwiftUI
import SwiftUIGIF

struct InvestmentModule: View {
    @State var isShowAllInformation = false
    @State var amountForMarshal = ""
    @State var expirtionDate = ""
    @State var statusOfButton = Status.none
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(spacing: 18){
                // sarmaye gozari gif
                GIFImage(name: "giif2")
                    .frame(height: 200)
                    .overlay(RoundedRectangle(cornerRadius: 12)
                                .stroke(Color("marshal_red"), lineWidth: 0.5)
                    
                    )
                
                
                // text
                VStack{
                    Text("لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                        .padding(.horizontal, 16.0)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_White"))
                        .lineLimit( isShowAllInformation ? nil : 3)
                        .onTapGesture {
                            isShowAllInformation.toggle()
                        }
                }
                .padding(8)
                .padding(.vertical , 8)
                .background(Color("marshal_darkBlue"))
                .cornerRadius(12)
               
                MarshalTextField(text: $amountForMarshal, title: "میزان مارشال", keyboardType: .decimalPad,numberType: true)
                
                
                MarshalTextField(text: $expirtionDate, title: "مدت اعتبار مارشال", keyboardType: .numberPad, limitedItem: 3, numberType: true, hasPlasAndMinus: true)

                HStack{
                    Rectangle()
                        .frame(height: 1 , alignment: .center)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .foregroundColor(Color("marshal_White"))
                    Text("سود ماهیانه")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                        .padding(.horizontal, 16.0)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_White"))
                    
                    Rectangle()
                        .frame(height: 1 , alignment: .center)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .foregroundColor(Color("marshal_White"))
                }//:HSTACK
                
                Text("250000")
                    .font(Font.custom("IRANSansMobileFaNum Bold", size: 18.0))
                    .padding(.horizontal, 16.0)
                    .padding(.vertical, 4.0)
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(Color("marshal_red"))
                    .background(Color("marshal_White"))
                    .cornerRadius(12)
                
                HStack{
                    Rectangle()
                        .frame(height: 1 , alignment: .center)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .foregroundColor(Color("marshal_White"))
                    Text("کل سود")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                        .padding(.horizontal, 16.0)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_White"))
                    
                    Rectangle()
                        .frame(height: 1 , alignment: .center)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .foregroundColor(Color("marshal_White"))
                }//:HSTACK
                
                Text("250000000")
                    .font(Font.custom("IRANSansMobileFaNum Bold", size: 18.0))
                    .padding(.horizontal, 16.0)
                    .padding(.vertical, 4.0)
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(Color("marshal_red"))
                    .background(Color("marshal_White"))
                    .cornerRadius(12)
                
                
                Spacer()
                
                Submit(status: $statusOfButton, title: "تایید") {
                    print("press")
                }
                
            }//:VSTACK
            .padding(.vertical)
            .padding(.horizontal, 16)
            .onTapGesture {
                hideKeyboard()
            }

        }
    }
}

struct InvestmentModule_Previews: PreviewProvider {
    static var previews: some View {
        InvestmentModule()
    }
}
