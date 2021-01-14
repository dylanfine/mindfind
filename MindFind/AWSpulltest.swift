//
//  AWSpulltest.swift
//  MindFind
//
//  Created by Andrew Boppart on 1/9/21.
//

import Foundation

let url = URL(string: "https://2jq441w3f5.execute-api.us-east-1.amazonaws.com/prod/")!
var request = URLRequest(url: url)
request.setValue("application/json", forHTTPHeaderField: "Content-Type")
request.httpMethod = "POST"
let parameters: [String: Any] = [
    "id": 13,
    "name": "Jack & Jill"
]
request.httpBody = parameters.percentEncoded()

let task = URLSession.shared.dataTask(with: request) { data, response, error in
    guard let data = data,
          let response = response as? HTTPURLResponse,
          error == nil else {                                              // check for fundamental networking error
        print("error", error ?? "Unknown error")
        return
    }
    
    guard (200 ... 299) ~= response.statusCode else {                    // check for http errors
        print("statusCode should be 2xx, but is \(response.statusCode)")
        print("response = \(response)")
        return
    }
    
    let responseString = String(data: data, encoding: .utf8)
    print("responseString = \(responseString)")
}

task.resume()
