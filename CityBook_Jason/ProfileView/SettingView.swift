//
//  SettingView.swift
//  CityBook_Jason
//
//  Created by Jason on 2023/12/18.
//

import SwiftUI
// 仅保留：恢复购买、
struct SettingView: View {
    let section1: [String] = ["个人资料", "账号与安全", "恢复购买"]
    let section2: [String] = ["用户协议", "隐私政策"]
    enum appearence: String, Identifiable {
        case auto, dark, light
        var id: Self { self }
    }
    @State private var selectedPreference: appearence = .auto
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(section1, id: \.self) { section in
                        NavigationLink(destination: ContentView()) {
                            Text(section)
                        }
                    }
                }
                
                Section {
                    Toggle(isOn: .constant(false), label: {
                        Text("接收消息通知")
                    })
                    Picker("外观设置", selection: $selectedPreference) {
                        Text("跟随系统").tag(appearence.auto)
                        Text("深色模式").tag(appearence.dark)
                        Text("浅色模式").tag(appearence.light)
                    }
                    
                    Toggle(isOn: .constant(false), label: {
                        Text("仅在连接Wi-Fi时下载地图")
                    })
                    Text("清理缓存").badge("0B")
                }
                
                Section {
                    ForEach(section2, id: \.self) { section in
                        NavigationLink(destination: ContentView()) {
                            Text(section)
                        }
                    }
                }
            }
        }
        .navigationTitle("系统设置")
    }
}

#Preview {
    SettingView()
}
