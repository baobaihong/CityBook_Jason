//
//  ProfileView.swift
//  CityBook_Jason
//
//  Created by Jason on 2023/12/18.
//

import SwiftUI

struct Setting: Hashable {
    let title: String
    let imageName: String
}

struct ProfileView: View {
    let setting: [Setting] = [
        Setting(title: "系统设置", imageName: "gearshape"),
        Setting(title: "消息通知", imageName: "bell"),
        Setting(title: "反馈帮助", imageName: "rectangle.and.pencil.and.ellipsis"),
        Setting(title: "鼓励一下", imageName: "hand.thumbsup"),
        Setting(title: "关于CityBook", imageName: "signpost.right.and.left")
    ]
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(setting, id: \.self) { setting in
                    NavigationLink(destination: ChildCollectionView(viewToDisplay: setting.title)) {
                        Label(setting.title, systemImage: setting.imageName)
                    }
                }
            }
        }
    }
}

struct ChildCollectionView: View {
    let viewToDisplay: String
    var body: some View {
        switch viewToDisplay {
        case "系统设置":
            SettingView()
        case "消息通知":
            NotificationView()
        case "反馈帮助":
            FeedbackView()
        case "鼓励一下":
            ContentView()
        case "关于CityBook":
            ContentView()
        default:
            ChildCollectionView(viewToDisplay: "")
        }
    }
}

#Preview {
    ProfileView()
}
