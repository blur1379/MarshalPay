//
//  MarshalWalletTabPageModule.swift
//  Marshal
//
//  Created by Blur on 10/21/1400 AP.
//

import SwiftUI

struct MarshalWalletTabPageModule: View {
    enum pageOfWallet{
        case wallet
        case withdraw
        case deposit
        case transfer
    }
    @State var code : String = ""
    @State var wallet = WalletModel()
    @State var statusOfPage : Status = .none
    @State var selectedPage : pageOfWallet = .wallet
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
        //.padding(.horizontal, 16.0)
        
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
                .stroke(Color("marshal_red"), lineWidth: 2.0)
            )
            .padding(.horizontal, 32.0)
            
            HStack (spacing: 8){
                
                HStack(spacing: 8) {
                    Text(wallet.getDebtCredit())
                        .foregroundColor(Color("marshal_White"))
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 14))

                    Text("بدهی")
                        .foregroundColor(Color("marshal_red"))
                        .font(Font.custom("IRANSansMobileFaNum Bold", size: 14))
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
                        
                    
                    Text("اعتبار")
                        .foregroundColor(Color("marshal_red"))
                        .font(Font.custom("IRANSansMobileFaNum Bold", size: 14))

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
            if statusOfPage == .Successful {
                VStack (alignment: .center, spacing: 32.0){
                    if selectedPage == .wallet {
                        tabsOnTop
                    }
                    balaceBlock
                    switch selectedPage {
                    case .wallet:
                        WalletPriceList(waletCorencies: wallet.walletCurencies)
                    case.deposit:
                        WalletDeposit()
                    case.transfer:
                        WalletTransfer()
                    case.withdraw:
                        WalletWithdraw()
                    }

                    Spacer()
         
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .padding(.horizontal, 16.0)
                .padding(.top, 16.0)
            }else if statusOfPage == .InProgress {
                ZStack(alignment: .center) {
                    ProgressViewMarshal()
                }
            }else if statusOfPage == .Failure {
                ZStack(alignment: .center) {
                    FailedMarshal {
                        onCreate()
                    }
                }
            }
          
        }
        .onAppear {
            callApi.getWallet { wallet in
                self.wallet = wallet
            } status: { status in
                self.statusOfPage = status
            }

        }
        
    }
    func onCreate(){
        
    }
}


struct MarshalWalletTabPageModule_Previews: PreviewProvider {
    static var previews: some View {
        MarshalWalletTabPageModule()
    }
}
