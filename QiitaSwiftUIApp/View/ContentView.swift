//
//  ContentView.swift
//  QiitaSwiftUIApp
//
//  Created by 橋元雄太郎 on 2023/05/14.
//

import SwiftUI

struct ContentView: View {
    @State private var qiitas: [Qiita] = []

    var body: some View {
        NavigationView {
            List(qiitas) { qiita in
                VStack(alignment: .leading) {
                    Text(qiita.title)
                        .font(.headline)
                    Text(qiita.user.name)
                        .font(.subheadline)
                }
            }
            .navigationTitle("Qiitaの記事")
            .task {
                do {
                    self.qiitas = try await getQiitaApi()
                } catch {
                    print("情報の取得に失敗しました", error)
                }
            }
        }
    }

    func getQiitaApi() async throws -> [Qiita] {
        guard let url = URL(string: "https://qiita.com/api/v2/items?page=1&per_page=10") else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Qiita].self, from: data)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


