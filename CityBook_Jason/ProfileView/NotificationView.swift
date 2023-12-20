//
//  NotificationView.swift
//  CityBook_Jason
//
//  Created by Jason on 2023/12/18.
//

import SwiftUI

struct NotificationView: View {
    let title = "用户协议更新通知"
    let content = "为保障您的合法权益，更好地向您提供服务，以及适应相关监管规定的要求，我们修订和完善了《用户协议》。"
    let date = Date()
    
    var body: some View {
        List {
            NotificationCard(title: self.title, content: self.content, timeStamp: date)
        }
    }
}

struct NotificationCard: View {
    let title: String
    let content: String
    let timeStamp: Date
    @State private var isRead: Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 5) {
                if !isRead {
                    Circle().frame(width: 5, height: 5)
                }
                Text(title).font(.headline)
            }
            Text(content).font(.footnote).foregroundStyle(.gray)
            HStack {
                Text(Date.now.addingTimeInterval(600), style: .date).foregroundStyle(.gray)
                Spacer()
                HStack(spacing: 5) {
                    Text("查看详情")
                    Image(systemName: "chevron.right")
                }
                .foregroundStyle(.black)
            }
            .font(.footnote)
        }
        .navigationTitle("消息通知")
    }
}

#Preview {
    NotificationView()
}
