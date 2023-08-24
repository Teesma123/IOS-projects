//
//  TCNewsListViewModel.swift
//  TechCrunch
//
//  Created by Amil Freight on 18/08/22.
//

import Foundation

struct TCNewsListViewModel {

    //MARK: - API call
    func getNewsList(completion : @escaping ([Articles])->()) {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=9f9a7c9ae9594e84888f889fbccb8020") else { return }
            
            var request = URLRequest(url: url)
        
            //method, body, headers
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            //Make the request
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else { return }
                 print("data : \(data)")
                do {
                   // let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    let json = try JSONDecoder().decode(TCNewsListModel.self, from: data)
                    print("Success: \(json)")
                    completion(json.articles)
                }
                catch {
                    print(error)
                }
            }
            task.resume()
    }
}

