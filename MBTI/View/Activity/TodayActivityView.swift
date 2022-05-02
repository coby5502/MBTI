//
//  TodayActivityView.swift
//  MBTI
//
//  Created by COBY_PRO on 2022/04/29.
//

import SwiftUI

struct TodayActivityView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest var user: FetchedResults<User>
    @FetchRequest var activities: FetchedResults<Activity>
    
    init() {
        _user = FetchRequest<User>(sortDescriptors: [])
        _activities = FetchRequest<Activity>(sortDescriptors: [], predicate: NSPredicate(format: "goal == %@", "E"))
    }
    
    var body: some View {
        
        VStack {
            
            Image("ENFJ")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 300)
                .aspectRatio(1.0, contentMode: .fit)
                .padding(.top, 50)
            
            Spacer()
            
            Text("감상문 쓰기")
                .font(.system(size: 30, weight: .semibold))
                .foregroundColor(Color.black)
                .padding(.bottom, 50)
            
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("활동을 완료했어요.")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(Color.white)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 80)
                    .background(Color.black)
                    .cornerRadius(20)
                    .background(Color.black
                        .opacity(0.05)
                        .shadow(color: .black, radius: 20, x: 0, y: 4)
                        .blur(radius: 10, opaque: false)
                    )
                    .padding(.top, 40)
            }
            .padding()
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(Text("오늘의 활동"))
        
    }
}

struct TodayActivityView_Previews: PreviewProvider {
    static var previews: some View {
        TodayActivityView()
    }
}
