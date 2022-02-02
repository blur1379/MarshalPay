//
//  ExchangePage.swift
//  Marshal
//
//  Created by Blur on 11/9/1400 AP.
//

import SwiftUI

struct ExchangePage: View {
    //MARK: -PROPERTIES
    @State var wallet = WalletModel()
    @State var currency = Currency()
    @State var amountForSell = ""
    @State var amountForBuy = ""
    @State var status : Status = .none
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .red
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.white
    }
    var walletTitle : some View {
        HStack{
            Rectangle()
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 1)
                .foregroundColor(Color.white)
            Text("موجودی کیف پول")
                .foregroundColor(Color.white)
                .font(Font.custom("IRANSansMobileFaNum Bold", size: 14))
                .fixedSize(horizontal: true, vertical: false)
            Rectangle()
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 1)
                .foregroundColor(Color.white)
        }//:HSTACK
    }
    var walletBalence : some View {
        
        VStack {
            TabView{
                
                VStack {
                    HStack{
                        Image("walletBalenceIcone")
                            .scaledToFit()
                            .frame(width: 20, height: 20, alignment: .center)
                        Rectangle()
                            .frame(width: 1)
                            .frame(minHeight: 0, maxHeight: .infinity)
                            .foregroundColor(Color.white)
                        Text("36,000.000")
                            .foregroundColor(Color.white)
                            .font(Font.custom("IRANSansMobileFaNum Bold", size: 14))
                    }//:HSTACK
                    .padding(.horizontal)
                    .padding(.vertical , 4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.white, lineWidth:0.5)
                    )
                    .frame( height: 40)
                .background(Color("marshal_Grey"))
                    
                    Spacer()
                }
                VStack {
                    HStack{
                        Image("walletBalenceIcone")
                            .scaledToFit()
                            .frame(width: 20, height: 20, alignment: .center)
                        Rectangle()
                            .frame(width: 1)
                            .frame(minHeight: 0, maxHeight: .infinity)
                            .foregroundColor(Color.white)
                        Text("36,000.000")
                            .foregroundColor(Color.white)
                            .font(Font.custom("IRANSansMobileFaNum Bold", size: 14))
                    }//:HSTACK
                    .padding(.horizontal)
                    .padding(.vertical , 4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.white, lineWidth:0.5)
                    )
                    .frame( height: 40)
                .background(Color("marshal_Grey"))
                    
                    Spacer()
                }
                
            }.frame(width: 150 , height:70)
            
                .tabViewStyle(PageTabViewStyle())
            
            
           
            
            HStack (spacing: 8){
                
                HStack(spacing: 8) {
                    Text(wallet.getDebtCredit())
                        .foregroundColor(Color("marshal_White"))
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 14))
                        .padding(.leading)
                    Spacer()
                    Text("بدهی")
                        .foregroundColor(Color("marshal_red"))
                        .font(Font.custom("IRANSansMobileFaNum Bold", size: 14))
                        .padding(.trailing)
                    
                }
                .cornerRadius(12.0)
                .frame(minWidth: 0.0, maxWidth: .infinity)
                .frame(height: 48.0)
                .background(Color("marshal_surfGrey"))
                .cornerRadius(12.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("marshal_White"), lineWidth:0.5)
                )
                
                HStack(spacing: 8) {
                    Text(wallet.getValidityCredit())
                        .foregroundColor(Color("marshal_White"))
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 14))
                        .padding(.leading)
                    Spacer()
                    
                    Text("اعتبار")
                        .foregroundColor(Color("marshal_red"))
                        .font(Font.custom("IRANSansMobileFaNum Bold", size: 14))
                        .padding(.trailing)
                    
                    
                }
                .cornerRadius(12.0)
                .frame(minWidth: 0.0, maxWidth: .infinity)
                .frame(height: 48.0)
                .background(Color("marshal_surfGrey"))
                .cornerRadius(12.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("marshal_White"), lineWidth:0.5)
                )
                
            }//:HSTACK
            .padding(.horizontal, 32.0)
            .padding(.bottom, 16)
            
            
        }//:VSTACK
        
        
    }
    
    var exchangeToMarshal : some View{
        VStack{
            HStack{
                Spacer()
                VStack(spacing: 0){
                    Text("1")
                        .foregroundColor(Color.white)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 14))
                    Image("arow")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 60, alignment: .center)
                    Text("36")
                        .foregroundColor(Color.white)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 14))
                }//:VSTACK
                
                Spacer()
                
                VStack(alignment: .trailing){
                    
                    HStack {
                        Text("مارشال")
                            .foregroundColor(Color("marshal_red"))
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 12))
                        Text("marshal")
                            .foregroundColor(Color.white)
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 14))
                        Image("marshalTest")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 42, height: 42, alignment: .center)
                        
                        
                    }//:HSTACK
                    
                    HStack {
                        Text("دلار")
                            .foregroundColor(Color("marshal_red"))
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 12))
                        Text("dollar")
                            .foregroundColor(Color.white)
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 14))
                        Image("marshalTest")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 42, height: 42, alignment: .center)
                        
                        
                    }//:HSTACK
                }
                
            }//:HSTACK
            GeometryReader{geometry in
                HStack{
                    HStack (spacing: 0) {
                        Text("دلار")
                            .font(Font.custom("IRANSansMobileFaNum Bold", size: 16.0))
                            .padding(.horizontal, 16.0)
                            .foregroundColor(Color("marshal_red"))
                            .frame(height: 40, alignment: .center)
                        
                        
                        Text("36.698")
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 16.0))
                            .padding(.horizontal, 16.0)
                            .foregroundColor(Color("marshal_red"))
                            .frame(height: 40, alignment: .center)
                            .frame(minWidth: 0 , maxWidth: .infinity)
                            .background(Color.white)
                        
                        
                        
                    }//:HSTACK
                    .frame(width: geometry.size.width * 0.48)
                    .background(Color("marshal_surfGrey"))
                    .cornerRadius(12)
                    .overlay(RoundedRectangle(cornerRadius: 12)
                                .stroke(Color("marshal_red"), lineWidth: 0.5)
                    )
                    
                    
                    
                    Spacer()
                    MarshalTextField(text: $amountForSell, title: "مقدار مارشال" , keyboardType: .numberPad ,heightOfBox: 40 )
                        .frame(width: geometry.size.width * 0.48)
                    
                }//:HSTACK
                
            }
            .frame(height: 45)
            
            HStack(alignment: .top, spacing: 0){
                Text("کارمزد : 36 دلار")
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    .padding(.horizontal, 16.0)
                    .foregroundColor(Color("marshal_White"))
                Spacer()
            }
            
            Submit(status: $status, title: "تایید") {
                
            }
        }//:VSTACK
        .padding(8)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color("marshal_red") , lineWidth: 1))
    }
    
    
    var marshalToCurrency : some View{
        VStack{
            HStack{
                Spacer()
                VStack(spacing: 0){
                    Text("1")
                        .foregroundColor(Color.white)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 14))
                    Image("arow")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 60, alignment: .center)
                    Text("36")
                        .foregroundColor(Color.white)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 14))
                }//:VSTACK
                
                Spacer()
                
                VStack(alignment: .trailing){
                    
                    HStack {
                        Text("مارشال")
                            .foregroundColor(Color("marshal_red"))
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 12))
                        Text("marshal")
                            .foregroundColor(Color.white)
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 14))
                        Image("marshalTest")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 42, height: 42, alignment: .center)
                        
                        
                    }//:HSTACK
                    
                    HStack {
                        Text("دلار")
                            .foregroundColor(Color("marshal_red"))
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 12))
                        Text("dollar")
                            .foregroundColor(Color.white)
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 14))
                        Image("marshalTest")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 42, height: 42, alignment: .center)
                        
                        
                    }//:HSTACK
                }
                
            }//:HSTACK
            GeometryReader{geometry in
                HStack{
                    HStack (spacing: 0) {
                        Text("دلار")
                            .font(Font.custom("IRANSansMobileFaNum Bold", size: 16.0))
                            .padding(.horizontal, 16.0)
                            .foregroundColor(Color("marshal_red"))
                            .frame(height: 40, alignment: .center)
                        
                        
                        Text("36.698")
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 16.0))
                            .padding(.horizontal, 16.0)
                            .foregroundColor(Color("marshal_red"))
                            .frame(height: 40, alignment: .center)
                            .frame(minWidth: 0 , maxWidth: .infinity)
                            .background(Color.white)
                        
                        
                        
                    }//:HSTACK
                    .frame(width: geometry.size.width * 0.48)
                    .background(Color("marshal_surfGrey"))
                    .cornerRadius(12)
                    .overlay(RoundedRectangle(cornerRadius: 12)
                                .stroke(Color("marshal_red"), lineWidth: 0.5)
                    )
                    
                    
                    
                    Spacer()
                    MarshalTextField(text: $amountForBuy, title: "مقدار مارشال" , keyboardType: .numberPad ,heightOfBox: 40 )
                        .frame(width: geometry.size.width * 0.48)
                    
                }//:HSTACK
                
            }
            .frame(height: 45)
            
            HStack(alignment: .top, spacing: 0){
                Text("کارمزد : 36 دلار")
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    .padding(.horizontal, 16.0)
                    .foregroundColor(Color("marshal_White"))
                Spacer()
            }
            
            Submit(status: $status, title: "تایید") {
                
            }
        }//:VSTACK
        .padding(8)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color("marshal_red") , lineWidth: 1))
    }
    
    var body: some View {
        VStack{
            walletTitle
            walletBalence
            exchangeToMarshal
            marshalToCurrency
          
            Spacer()
        }//:VSTACK
        .padding()
        .background(Color("marshal_Grey"))
    }
}

struct ExchangePage_Previews: PreviewProvider {
    static var previews: some View {
        ExchangePage()
    }
}
