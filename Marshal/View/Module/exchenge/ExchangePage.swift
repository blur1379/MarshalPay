//
//  ExchangePage.swift
//  Marshal
//
//  Created by Blur on 11/9/1400 AP.
//

import SwiftUI
import Alamofire
import SwiftyJSON
struct ExchangePage: View {
    //MARK: -PROPERTIES
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let currencyId : String
    @State var wallet = WalletModel()
    @State var currency = Currency()
    @State var amountForSell = ""
    @State var amountForBuy = ""
    @State var status : Status = .none
    @State var pageIndex = 0
    
    init(currencyId  : String) {
        self.currencyId = currencyId
        UIPageControl.appearance().currentPageIndicatorTintColor = .red
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.white
    }
    
    var topBar : some View {
        HStack(alignment: .center) {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image (systemName: "arrow.backward")
                    .frame(width: 40, height: 40, alignment: .leading)
                    .foregroundColor(Color("marshal_red"))
                    .imageScale(.large)
            }

  

            Spacer()
            
            Text("صرافی")
                
                .foregroundColor(Color("marshal_White"))
                .font(Font.custom("IRANSansMobileFaNum Bold", size: 18))
            
            
            
            
//            Image ("marshal_logo-wings")
//                .resizable()
//                .frame(width: 96, height: 22, alignment: .center)
//                .scaledToFit()
            
  
        }
        .padding(.horizontal, 16.0)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 56)

    }
    
    var walletTitle : some View {
        HStack{
            Rectangle()
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 1)
                .foregroundColor(Color.white)
            Text("موجودی کیف پول \(pageIndex == 0 ? "مارشال" : currency.name)")
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
            TabView(selection: $pageIndex){
                
                VStack {
                    HStack{
                        Image("walletBalenceIcone")
                            .scaledToFit()
                            .frame(width: 20, height: 20, alignment: .center)
                        Rectangle()
                            .frame(width: 1)
                            .frame(minHeight: 0, maxHeight: .infinity)
                            .foregroundColor(Color.white)
                        Text(wallet.getCurrentCredit())
                            .frame(width: 110, alignment: .center)
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
                }.tag(0)
                VStack {
                    HStack{
                        Image("walletBalenceIcone")
                            .scaledToFit()
                            .frame(width: 20, height: 20, alignment: .center)
                        Rectangle()
                            .frame(width: 1)
                            .frame(minHeight: 0, maxHeight: .infinity)
                            .foregroundColor(Color.white)
                        Text(getWalletInventory())
                            .frame(width: 110, alignment: .center)
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
                }.tag(1)
                
            }.frame(width: 200 , height:80)
            
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
            .padding(.top, -16)
            
        }//:VSTACK
        
        
    }
    
    var exchangeToMarshal : some View{
        VStack{
            HStack{
                Spacer()
                VStack(spacing: 0){
                    Text("\(currency.currentValue)")
                        .foregroundColor(Color.white)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 14))
                    Image("arow")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 60, alignment: .center)
                    Text("1")
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
                        Text("\(currency.name)")
                            .foregroundColor(Color("marshal_red"))
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 12))
                        Text("\(currency.key)")
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
                        
                        
                        Text(convertToLastPricesell(amountForSell , String(currency.currentValue)))
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
                Text("کارمزد : 36 \(currency.name)")
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
                    Text("\(currency.currentValue)")
                        .foregroundColor(Color.white)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 14))
                }//:VSTACK
                
                Spacer()
                
                VStack(alignment: .trailing){
                    
                    
                    
                    HStack {
                        Text("\(currency.name)")
                            .foregroundColor(Color("marshal_red"))
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 12))
                        Text("\(currency.key)")
                            .foregroundColor(Color.white)
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 14))
                        Image("marshalTest")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 42, height: 42, alignment: .center)
                        
                        
                    }//:HSTACK
                    
                    
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
                }
                
            }//:HSTACK
            GeometryReader{geometry in
                HStack{
                    HStack (spacing: 0) {
                        Text("مارشال")
                            .font(Font.custom("IRANSansMobileFaNum Bold", size: 16.0))
                            .padding(.horizontal, 16.0)
                            .foregroundColor(Color("marshal_red"))
                            .frame(height: 40, alignment: .center)
                        
                        
                        Text(convertToLastPriceBuy(amountForBuy, String(currency.currentValue)))
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
                    MarshalTextField(text: $amountForBuy, title: "مقدار \(currency.name)" , keyboardType: .numberPad ,heightOfBox: 40 )
                        .frame(width: geometry.size.width * 0.48)
                    
                }//:HSTACK
                
            }
            .frame(height: 45)
            
            HStack(alignment: .top, spacing: 0){
                Text("کارمزد : 36 مارشال")
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
        VStack(spacing: 0){
            topBar
            Divider()
                .frame(height: 1.0).background(Color("marshal_red"))
            VStack{
                if status == .Successful{
                    
                    walletTitle
                    walletBalence
                    exchangeToMarshal
                        .padding(.bottom , 8)
                    marshalToCurrency
                }else if status == . Failure {
                    FailedMarshal {
                        getWalletApi()
                    }
                }else {
                    ProgressViewMarshal()
                }
                Spacer()
            }//:VSTACK
            .padding()
           
            .onAppear{
                getWalletApi()
            }
            
        }
        .background(Color("marshal_Grey"))
    }
    
    //MARK: -FUNCTION
    func convertToLastPriceBuy(_ firstPrice : String ,_ secendPrice: String)-> String{
        let doubleFirstPrice : Double = Double(firstPrice) ?? 0.0
        let doubleSecendPrice : Double = Double(secendPrice) ?? 0.0
        let lastedPrice = String(doubleFirstPrice * doubleSecendPrice)
        return ConstantData().decimalFormat(text: lastedPrice)
    }
    func convertToLastPricesell(_ firstPrice : String ,_ secendPrice: String)-> String{
        let doubleFirstPrice : Double = Double(firstPrice) ?? 0.0
        let doubleSecendPrice : Double = Double(secendPrice) ?? 1.0
        let lastedPrice = String((doubleFirstPrice / doubleSecendPrice).isNaN ? 0 : (doubleFirstPrice / doubleSecendPrice))
        return ConstantData().decimalFormat(text: lastedPrice)
    }
    
    func getCurrencyInfo(){
            let url = "v1/currencies/get/\(currencyId)"
        AF.request(CallApi().baceUrl + url, method: .get, encoding: JSONEncoding.default){urlRequest in urlRequest.timeoutInterval = TimeInterval(CallApi().timeOut)}.responseJSON { response in
                do {
                    switch response.result {
                    case .success :
                        let json = try JSON(data: response.data!)
                        print("------ send code")
                        print(json)
                        print("------- send code")
                        if response.response?.statusCode == 200 || response.response?.statusCode == 201  {
                            currency = ConvertJsonToObject().convertJsonToCurrency(json["data"])
                            self.status = .Successful
                        }else{
                            status = .Failure
                        }
                        print("v1/users/validation-activation-code")
                        print(response.response?.statusCode ?? 0)
                        
                        break
                    case let .failure(error):
                        status = .Failure
                        print(url)
                        if response.response != nil {
                            print(response.response?.statusCode ?? 0 )
                        }
                        print("failed")
                        print(error)
                        break
                    }
                }catch{
                    status = .Failure
                    print(url)
                    if response.response != nil {
                        print(response.response?.statusCode ?? 0)
                    }
                    print("nil response")
                }
                
            }
        }
    
    func getWalletApi(){
        CallApi().getWallet { wallet in
            self.wallet = wallet
        } status: { status in
            if status == .Successful {
                getCurrencyInfo()
            }else if status == .Failure {
                self.status = .Failure
            }else{
                self.status = .Successful
            }
        }

    }
    
    func getWalletInventory() -> String{
        let amount = wallet.walletCurencies.first(where: {$0.currency._id == currencyId})?.getAmount() ?? "0"
        return amount
    }
    
}
//MARK: -PREVIEW
struct ExchangePage_Previews: PreviewProvider {
    static var previews: some View {
        ExchangePage(currencyId: "")
    }
}
