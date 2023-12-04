//
//  ModelData.swift
//  CityBook
//
//  Created by Jason on 2023/11/22.
//

// question: 基于收藏联动逻辑（poi-star -> Street-Star），Street and POI是否应该是包含关系？

import Foundation

class ModelData: ObservableObject {
    var distribution: [String: [Street]] {
        Dictionary(
            grouping: streets,
            by: { $0.district.rawValue }
        )
    }
    
    var isPurchased: [Street] {
        streets.filter { $0.isPurchased }
    }
    
    var stared: [Street] {
        streets.filter { $0.star }
    }
    
    @Published var streets = [
        Street(
            id: 0,
            title: "武康路",
            abstract: "每个人眼里的武康路，每个人心里的大上海。",
            description: "武康路是上海徐汇区一条长约1.2公里的道路，被誉为“浓缩了上海近代百年历史”的“名人路”。武康路两旁集中了大量民国时期的建筑，风格多样，包括西班牙式、法国文艺复兴式、英国乡村别墅式等。武康路不仅是上海近代建筑的缩影，也是上海文化名人的聚集地。如今，武康路已成为上海重要的旅游景点，吸引着众多游客前来参观。武康路的特点主要体现在以下几个方面：建筑风格多样、历史文化悠久，人文气息浓厚。",
            color: .yellow,
            star: true,
            feature: ["永不拓宽", "落叶景观"],
            district: .huangpu,
            coverImageName: "wukangcover",
            heroImageName: "wukanghero",
            coordinates: .init(latitude: 31.21017, longitude: 121.43575),
            poiList: [
                POI(id: 1, title: "武康大楼", abstract: "迷人法式风情，探秘上海文艺复兴之美——探访武康大楼", feature: ["保护建筑", "绝佳出片点", "网红打卡地"], address: "淮海中路1836—1858号", date: 1924, description: "武康大楼是一座具有法国文艺复兴式风格的建筑，位于面积有限的地块上。总占地1580平方米，建筑面积达9275平方米，钢筋混凝土结构，共八层，高30余米。底层以骑楼样式设计，保留人行道空间。一、二层外立面仿石墙，三至七层为黄褐色砖块，八层再次仿石。北向留有两大天井解决采光问题。内部分为商铺和居民住房，共63套房间，设有厨房、卫浴和通风道。设有回旋式楼梯、电梯。1930年，在东侧增建了新武康大楼，面积1700平方米，新楼高五层。",star: true, imageName: "wukangdalou", coordinates: .init(latitude: 31.20619, longitude: 121.43358)),
                POI(id: 2, title: "周璇故居", abstract: "🎙️《夜上海》演唱者的复出之路：「金嗓子」周璇故居", feature: ["保护建筑", "可参观", "西班牙风格"], address: "武康路391弄1-5号", date: 1916, description: "周璇故居是一座独特的三层西班牙式小楼，建于1916年，采用砖木结构，与周围的其他建筑风格截然不同。这座小楼见证着“金嗓子”从影生涯的高光时刻也承载她敏感孤寂的心绪。 1943年，中国最早的歌影两栖明星、流行乐坛的先驱者——“金嗓子”周璇和养母搬进了这里。之前，由于时局关系，周璇已息影一年多。然而，在这里，她加入了中华电影联合股份有限公司，复出拍片。她主演了《渔家女》、《鸾凤和鸣》、《红楼梦》、《凤凰于飞》四部影片。", imageName: "zhouxuanguju", coordinates: .init(latitude: 31.20611, longitude: 121.43426))
                    ]
        ),
        Street(
            id: 1,
            title: "愚园路",
            abstract: "文化沉淀，从近代史走进现代精致生活。",
            description: "愚园路是上海一条历史悠久的街道，两旁林立着老洋房和花园。这里是上海最著名的城市漫步路线之一，也是许多电影和电视剧的拍摄地。愚园路是上海最具代表性的老洋房街区之一，这里有许多建于19世纪末20世纪初的老洋房，这些老洋房大多是西式建筑，具有独特的风格。愚园路也是上海最繁华的商业街之一，这里有许多高档商店和餐厅。",
            color: .yellow,
            isPurchased: true,
            feature: ["洋房街区", "城市漫步路线"],
            district: .huangpu,
            coverImageName: "wukangcover",
            heroImageName: "wukanghero",
            coordinates: .init(latitude: 31.21017, longitude: 121.43575),
            poiList: [
                POI(id: 1, title: "愚园路158号", abstract: "上海最早的公共租赁房", feature: ["保护建筑", "可参观", "民国风格"], address: "愚园路158号", date: 1920, description: "愚园路158号是一座具有民国风格的建筑，建于1920年，是上海最早的公共租赁房之一。这座建筑采用钢筋混凝土结构，外立面为红砖墙，屋顶为坡屋顶。内部有60多户住户，每户面积约30平方米。", imageName: "yuyunlufu158", coordinates: .init(latitude: 31.20913, longitude: 121.43411)),
                POI(id: 2, title: "愚园路200号", abstract: "上海第一家公立幼儿园", feature: ["保护建筑", "可参观", "民国风格"], address: "愚园路200号", date: 1928, description: "愚园路200号是一座具有民国风格的建筑，建于1928年，是上海第一家公立幼儿园。这座建筑采用钢筋混凝土结构，外立面为红砖墙，屋顶为坡屋顶。内部有10多个教室，每间面积约20平方米。", imageName: "yuyunlufu200", coordinates: .init(latitude: 31.20963, longitude: 121.43417))
                ]
        ),
        Street(
            id: 2,
            title: "衡山路",
            abstract: "120年，看遍魔都百年兴衰史。",
            description: "衡山路是上海一条历史悠久的街道，两旁林立着老洋房和花园。这里是上海最具历史文化底蕴的街道之一，也是许多电影和电视剧的拍摄地。衡山路是上海最具代表性的老洋房街区之一，这里有许多建于19世纪末20世纪初的老洋房，这些老洋房大多是西式建筑，具有独特的风格。衡山路也是上海最繁华的商业街之一，这里有许多高档商店和餐厅。",
            color: .yellow,
            feature: ["历史文化底蕴", "老洋房街区", "城市漫步路线"],
            district: .huangpu,
            coverImageName: "wukangcover",
            heroImageName: "wukanghero",
            coordinates: .init(latitude: 31.21017, longitude: 121.43575),
            poiList: [
                POI(id: 1, title: "衡山路158号", abstract: "上海最早的公共租赁房", feature: ["保护建筑", "可参观", "民国风格"], address: "衡山路158号", date: 1920, description: "衡山路158号是一座具有民国风格的建筑，建于1920年，是上海最早的公共租赁房之一。这座建筑采用钢筋混凝土结构，外立面为红砖墙，屋顶为坡屋顶。内部有60多户住户，每户面积约30平方米。", imageName: "hengshanlu158", coordinates: .init(latitude: 31.20913, longitude: 121.43411)),
                    POI(id: 2, title: "衡山路200号", abstract: "上海第一家公立幼儿园", feature: ["保护建筑", "可参观", "民国风格"], address: "衡山路200号", date: 1928, description: "衡山路200号是一座具有民国风格的建筑，建于1928年，是上海第一家公立幼儿园。这座建筑采用钢筋混凝土结构，外立面为红砖墙，屋顶为坡屋顶。内部有10多个教室，每间面积约20平方米。", imageName: "hengshanlu200", coordinates: .init(latitude: 31.20963, longitude: 121.43417))
                ]
        ),
        Street(
            id: 3,
            title: "武康路",
            abstract: "每个人眼里的武康路，每个人心里的大上海。",
            description: "武康路是上海徐汇区一条长约1.2公里的道路，被誉为“浓缩了上海近代百年历史”的“名人路”。武康路两旁集中了大量民国时期的建筑，风格多样，包括西班牙式、法国文艺复兴式、英国乡村别墅式等。武康路不仅是上海近代建筑的缩影，也是上海文化名人的聚集地。如今，武康路已成为上海重要的旅游景点，吸引着众多游客前来参观。武康路的特点主要体现在以下几个方面：建筑风格多样、历史文化悠久，人文气息浓厚。",
            color: .yellow,
            isPurchased: true,
            feature: ["永不拓宽", "落叶景观"],
            district: .jingan,
            coverImageName: "wukangcover",
            heroImageName: "wukanghero",
            coordinates: .init(latitude: 31.21017, longitude: 121.43575),
            poiList: [
                POI(id: 1, title: "武康大楼", abstract: "迷人法式风情，探秘上海文艺复兴之美——探访武康大楼", feature: ["保护建筑", "绝佳出片点", "网红打卡地"], address: "淮海中路1836—1858号", date: 1924, description: "武康大楼是一座具有法国文艺复兴式风格的建筑，位于面积有限的地块上。总占地1580平方米，建筑面积达9275平方米，钢筋混凝土结构，共八层，高30余米。底层以骑楼样式设计，保留人行道空间。一、二层外立面仿石墙，三至七层为黄褐色砖块，八层再次仿石。北向留有两大天井解决采光问题。内部分为商铺和居民住房，共63套房间，设有厨房、卫浴和通风道。设有回旋式楼梯、电梯。1930年，在东侧增建了新武康大楼，面积1700平方米，新楼高五层。", imageName: "wukangdalou", coordinates: .init(latitude: 31.20619, longitude: 121.43358)),
                POI(id: 2, title: "周璇故居", abstract: "🎙️《夜上海》演唱者的复出之路：「金嗓子」周璇故居", feature: ["保护建筑", "可参观", "西班牙风格"], address: "武康路391弄1-5号", date: 1916, description: "周璇故居是一座独特的三层西班牙式小楼，建于1916年，采用砖木结构，与周围的其他建筑风格截然不同。这座小楼见证着“金嗓子”从影生涯的高光时刻也承载她敏感孤寂的心绪。 1943年，中国最早的歌影两栖明星、流行乐坛的先驱者——“金嗓子”周璇和养母搬进了这里。之前，由于时局关系，周璇已息影一年多。然而，在这里，她加入了中华电影联合股份有限公司，复出拍片。她主演了《渔家女》、《鸾凤和鸣》、《红楼梦》、《凤凰于飞》四部影片。", imageName: "zhouxuanguju", coordinates: .init(latitude: 31.20611, longitude: 121.43426))
                    ]
        ),
        Street(
            id: 4,
            title: "愚园路",
            abstract: "文化沉淀，从近代史走进现代精致生活。",
            description: "愚园路是上海一条历史悠久的街道，两旁林立着老洋房和花园。这里是上海最著名的城市漫步路线之一，也是许多电影和电视剧的拍摄地。愚园路是上海最具代表性的老洋房街区之一，这里有许多建于19世纪末20世纪初的老洋房，这些老洋房大多是西式建筑，具有独特的风格。愚园路也是上海最繁华的商业街之一，这里有许多高档商店和餐厅。",
            color: .yellow,
            feature: ["洋房街区", "城市漫步路线"],
            district: .jingan,
            coverImageName: "wukangcover",
            heroImageName: "wukanghero",
            coordinates: .init(latitude: 31.21017, longitude: 121.43575),
            poiList: [
                POI(id: 1, title: "愚园路158号", abstract: "上海最早的公共租赁房", feature: ["保护建筑", "可参观", "民国风格"], address: "愚园路158号", date: 1920, description: "愚园路158号是一座具有民国风格的建筑，建于1920年，是上海最早的公共租赁房之一。这座建筑采用钢筋混凝土结构，外立面为红砖墙，屋顶为坡屋顶。内部有60多户住户，每户面积约30平方米。", imageName: "yuyunlufu158", coordinates: .init(latitude: 31.20913, longitude: 121.43411)),
                POI(id: 2, title: "愚园路200号", abstract: "上海第一家公立幼儿园", feature: ["保护建筑", "可参观", "民国风格"], address: "愚园路200号", date: 1928, description: "愚园路200号是一座具有民国风格的建筑，建于1928年，是上海第一家公立幼儿园。这座建筑采用钢筋混凝土结构，外立面为红砖墙，屋顶为坡屋顶。内部有10多个教室，每间面积约20平方米。", imageName: "yuyunlufu200", coordinates: .init(latitude: 31.20963, longitude: 121.43417))
                ]
        )
    ]
    
}

