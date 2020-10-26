//
//  LearnApi.swift
//  switui_learn
//
//  Created by laijihua on 2020/10/17.
//

import SwiftUI
import Combine

struct ResponseData: Codable {
    struct Data: Codable {
        var items: [Topic]
    }
    var code: Int
    var message: String
    var data: Data
}

struct Topic: Codable, Identifiable {
    var id: String
    var title: String
    var content: String?
}

class TopicViewModel: ObservableObject {
    
    @Published var topics: [Topic] = []
    
    var cancellationToken: AnyCancellable? // 2
    
    init() {
        getTopics()
    }
    
    func getTopics() {
        let url = URL(string: "https://sb.loveli.site/api/subject/null/topics?per=10&page=1")!
        var urlReq = URLRequest(url: url)
        urlReq.addValue("application/json", forHTTPHeaderField: "Accept")
        self.cancellationToken = URLSession.shared.dataTaskPublisher(for: urlReq)
            .map { $0.data }
            .decode(type: ResponseData.self, decoder: JSONDecoder())
            .replaceError(with: ResponseData(code: 404, message: "not Found", data: ResponseData.Data(items: [])))
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .sink { (res) in
                self.topics = res.data.items
            }
    }
}

struct LearnApi: View {
    @ObservedObject var viewModel = TopicViewModel()

    var body: some View {
        VStack{
            List {
                ForEach(viewModel.topics) { topic in
                    NavigationLink(topic.title, destination: ArticleDetail(content: topic.content))
                }
            }
        }
        .navigationTitle(Text("LearnApi"))
        .onAppear(perform: {
            viewModel.getTopics()
        })
    }
    
    
}

struct LearnApi_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(content: {
            LearnApi()
        })
    }
}
