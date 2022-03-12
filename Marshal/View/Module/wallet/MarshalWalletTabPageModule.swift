//
//  MarshalWalletTabPageModule.swift
//  Marshal
//
//  Created by Blur on 10/21/1400 AP.
//

import SwiftUI

struct MarshalWalletTabPageModule: View {
  
    @State var code : String = ""
    @StateObject var wallet = WalletModel()
    @State var statusOfPage : Status = .none
    @State var selectedPage : WalletPages = .wallet
    @AppStorage("showTabBar") var showTabBar = true
    let callApi = CallApi()
    
    var tabsOnTop: some View {
        
        HStack(alignment: .center, spacing: 8.0) {
            
            Button(action: {
                selectedPage = .transfer
            }) {
                    Text("انتقال")
                        .foregroundColor(Color("marshal_White"))
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 18))
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 48)
                        .background(Color("marshal_darkGrey"))
                        .cornerRadius(12.0)
                        .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color("marshal_White"), lineWidth:0.5)
                        )
            }
            
            Button(action: {
                selectedPage = .deposit
            }) {
                    Text("واریز")
                        .foregroundColor(Color("marshal_White"))
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 18))
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 48)
                        .background(Color("marshal_darkGrey"))
                        .cornerRadius(12.0)
                        .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color("marshal_White"), lineWidth:0.5)
                        )
            }
            
            Button(action: {
                selectedPage = .withdraw
            }) {
                    Text("برداشت")
                        .foregroundColor(Color("marshal_White"))
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 18))
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 48)
                        .background(Color("marshal_darkGrey"))
                        .cornerRadius(12.0)
                        .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color("marshal_White"), lineWidth:0.5)
                        )
            }
            
        }
        
    }
    
    var balaceBlock: some View {
        
        VStack (spacing: 16){
            HStack (alignment: .center, spacing: 0.0){
                
                HStack (spacing: 8){
                    Text("مارشال")
                        .foregroundColor(Color("marshal_darkGrey"))
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 18))
                        .padding(.leading, 16.0)
                        .frame(height: 56)
                        
                    Image("marshal_M")
                        .resizable()
                        .frame(width: 24, height: 24, alignment: .center)
                        .foregroundColor(Color("marshal_darkGrey"))
                        .padding(.trailing, 14.0)
                }
                .frame(width: 120)
                .background(RoundedCorners(color: Color("marshal_White"), tl: 12, tr: 0, bl: 12, br: 0))

                Text(wallet.getCurrentCredit())
                    .foregroundColor(Color("marshal_White"))
                    .font(Font.custom("IRANSansMobileFaNum Bold", size: 24))
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    //.padding(.horizontal, 24.0)
                    .frame(height: 56)
                    .background(RoundedCorners(color: Color("marshal_red"), tl: 0, tr: 12, bl: 0, br: 12))

            }
            .frame(minWidth: 0.0, maxWidth: .infinity)
            .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color("marshal_red"), lineWidth: 1.0)
            )
            .padding(.horizontal, 32.0)
            
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
       
            }
            .padding(.horizontal, 32.0)
            .padding(.bottom, 16)
            //.padding(.horizontal, 16.0)
            
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color("marshal_darkGrey"),Color("marshal_Grey")]), startPoint: .top, endPoint: .bottom))
        
    }

    
    
    var body: some View {
        
        ZStack{
            Spacer()
            if statusOfPage == .Successful {
                VStack (alignment: .center, spacing: 0){
                    if !showTabBar {
                        MarshalWalletTabBar(page: $selectedPage){
                            selectedPage = .wallet
                        }
                            
                        Divider()
                            .frame(height: 1.0).background(Color("marshal_red"))
                            .padding(.bottom)
                    }
                    if selectedPage == .wallet {
                        tabsOnTop
                            .padding([.top, .horizontal])
                            .padding(.bottom , 16)
                    }
                    
                    balaceBlock
                    switch selectedPage {
                    case .wallet:
                        WalletPriceList(waletCorencies: wallet.walletCurencies)
                            .onAppear{
                                showTabBar = true
                            }
                    case.deposit:
                        WalletDeposit()
                            .padding(.top, 16.0)
                            .padding(.horizontal , 16)
                            .onAppear{
                                showTabBar = false
                            }
                    case.transfer:
                        WalletTransfer()
                            .padding(.top, 16.0)
                            .padding(.horizontal , 16)
                            .onAppear{
                                showTabBar = false
                            }
                    case.withdraw:
                        WalletWithdraw()
                            .padding(.top, 16.0)
                            .padding(.horizontal , 16)
                            .onAppear{
                                showTabBar = false
                            }
                    }

                    Spacer()
         
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
               
             
                .animation(
                    .easeIn
                    , value: selectedPage
                )
                
            }else if statusOfPage == .InProgress {
                ZStack(alignment: .center) {
                    
                    ProgressViewMarshal()
                }
            }else if statusOfPage == .Failure {
                
                ZStack(alignment: .center) {
                    Spacer()
                    FailedMarshal {
                        onCreate()
                    }
                }
            }
          
        }
        .onAppear {
           onCreate()
        }
        
    }
    func onCreate(){
        statusOfPage = .InProgress
        callApi.getWallet { wallet in
            self.wallet.validityCredit = wallet.validityCredit
            self.wallet.walletCurencies = wallet.walletCurencies
            self.wallet.currentCredit = wallet.currentCredit
            self.wallet.debtCredit = wallet.debtCredit
        } status: { status in
            
            self.statusOfPage = status
        }

    }
}


struct MarshalWalletTabPageModule_Previews: PreviewProvider {
    static var previews: some View {
        MarshalWalletTabPageModule()
    }
}
