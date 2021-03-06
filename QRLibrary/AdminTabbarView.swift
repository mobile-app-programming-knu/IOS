//
//  AdminPageView.swift
//  QRLibrary
//
//  Created by unme97 on 2021/05/29.
//

import SwiftUI

struct AdminTabbarView: View {
    var user : User?
    @State private var selection = 2
    @State var isTaken = false
    @State var takenString = ""
    
    var body: some View {
        TabView(selection: $selection) {
            AdminCameraView(user: user!, isTaken: $isTaken, takenString: $takenString)
                .tabItem {
                    Image(systemName: "qrcode.viewfinder")
                    Text("반납")
                }
                
            adminFilter()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("대출목록")
                }.tag(2)
        }
        .alert(isPresented: self.$isTaken){
            return Alert(title: Text("결과"), message: Text(takenString), dismissButton: .default(Text("OK")))
        }
    }
}

struct adminFilter : View {
    @State var text : String = ""
    @State var borrowMakers : [BorrowResponse] = []
    
    var body :some View{
        VStack{
            BorrowList(text: self.$text)
        }
    }
}

struct BorrowList: View {
    @Binding var text :String
    @State var editText : Bool = false
    @EnvironmentObject var borrows : Borrows
    
    @State private var width: CGFloat? = nil
    
    var body: some View {
        VStack {
            TextField("검색어를 입력하세요" , text : self.$text)
                .autocapitalization(.none)
                .padding(15)
                .padding(.horizontal, 15)
                .background(Color(.systemGray6))
                .cornerRadius(15)
            HStack {
                Spacer()
                Text("대출번호")
                    .frame(width: width, alignment: .leading)
                    .lineLimit(1)
                    .background(CenteringView())
                Spacer()
                Text("대출일")
                Spacer()
                Text("반납일")
                Spacer()
            }
            .frame(height: 40)
            .background(Color(red: 242 / 255, green: 134 / 255, blue: 101 / 256).opacity(0.5))
            .cornerRadius(10)
            
            List(self.borrows.allBorrowings.filter({"\($0)".contains(self.text) || self.text.isEmpty}), id: \.self) { borrow in
                NavigationLink(destination: BorrowDetail(borrow: borrow)) {
                    BorrowMakerCell(borrow: borrow)
                }
            }
        }
    }
}



struct BorrowMakerCell: View {
    var borrow : BorrowResponse
    
    var body: some View {
        HStack {
            HStack() {
                Spacer()
                Text("\(borrow.borrow_id)")
                Spacer()
                Spacer()
                Text(borrow.createdAt)
                Spacer()
                Text(borrow.expiredAt)
                Spacer()
            }
        }
    }
}

//class Observer_Admin: ObservableObject {
//    @Published var borrows = [BorrowResponse]()
//    var user : User?
//
//    func forTest(){
//        doGetAllBorrows(userId: user!.id, successCallback: { borrows in
//            self.borrows = borrows
//        }, failedCallback: { errorResponse in
//            print(errorResponse)
//        })
//    }
//
//    init(){
//        forTest()
//    }
//}
