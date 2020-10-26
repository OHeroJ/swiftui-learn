//
//  ArticleDetail.swift
//  switui_learn
//
//  Created by laijihua on 2020/10/26.
//

import SwiftUI
import Parma

struct SnapshotPreferenceKey: PreferenceKey {
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        _ = nextValue()
    }
    typealias Value = CGRect
    
    static var defaultValue: Value = .zero
}

struct SnapshotViewSetter: View {
    var body: some View {
        GeometryReader { geometry in
            return Color.clear
                .preference(key: SnapshotPreferenceKey.self,
                            value: CGRect(origin: geometry.frame(in:.global).origin, size: geometry.size))
        }
    }
    
}

class DetailViewModel: ObservableObject {
    @Published var showSheet = false
    var rect = CGRect.zero
    var sharedImage: UIImage?
}

struct ArticleDetail: View {
    let content: String
    
    @StateObject var data: DetailViewModel = DetailViewModel()
    
    init(content: String? = nil) {
        self.content = content ?? "占时没有内容"
    }
    
    var body: some View {
        ScrollView {
            Parma(content)
                .padding(10)
                .background(SnapshotViewSetter())
        }
        .onPreferenceChange(SnapshotPreferenceKey.self) { (preference) in
            data.rect = preference
        }
        .navigationTitle("文章详情")
        .navigationBarItems(trailing: Button("Snapshoot") {
            data.sharedImage = takeScreenshot(origin: data.rect.origin, size: data.rect.size)
            data.showSheet = true
        }
        .sheet(isPresented: $data.showSheet) {
            return VStack {
                Button("保存图片") {
                    saveImageToPhotoLibrary(image: data.sharedImage)
                }
                
                ScrollView {
                    ((data.sharedImage != nil) ? Image(uiImage: data.sharedImage!) : Image("tab_learn"))
                        .shadow(radius: 10)
                }
            }
        })
        
    }
}

struct ArticleDetail_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetail()
    }
}
