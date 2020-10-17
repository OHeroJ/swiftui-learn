//
//  LearnApi.swift
//  switui_learn
//
//  Created by laijihua on 2020/10/17.
//

import SwiftUI

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

struct LearnApi: View {
    @State private var topics: [Topic] = []
    
    var body: some View {
        VStack{
            List {
                ForEach(self.topics) { joke in
                    return Text(joke.title)
                }
            }
            
            Button(action: {
                self.getTopics()
            }, label: {
                Text("刷新")
            })
        }
        .navigationTitle(Text("LearnApi"))
        .onAppear(perform: {
            self.getTopics()
        })
    }
    
    func getTopics() {
        let url = URL(string: "https://sb.loveli.site/api/subject/null/topics?per=10&page=1")!
        var urlReq = URLRequest(url: url)
        urlReq.addValue("application/json", forHTTPHeaderField: "Accept")
        let request = URLSession.shared.dataTaskPublisher(for: urlReq)
            .map({ res in
                
                return res.data
            })
            .decode(type: ResponseData.self, decoder: JSONDecoder())
            .replaceError(with: ResponseData(code: 404, message: "not Found", data: ResponseData.Data(items: [])))
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .sink { (res) in
                self.topics = res.data.items
            }
    }
}

struct LearnApi_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(content: {
            LearnApi()
        })
    }
}
