//
//  ContentView.swift
//  MindFind
//
//  Created by Andrew Boppart on 1/9/21.
//

import SwiftUI
//struct Button<Label> where Label : View {
//    func Button(action: LogEmotion) {
//        Text("Log Emotion")
//    }
//}

//struct Button<LogEmoButton> where LogEmoButton : View {
//    func Button(action: LogEmotion) {
//        Text("Log Emotion")
//    }
//}

func saveChosenEmotion(){
    
}
//class Order: ObservableObject {
//    @Published var test = [String]()
//}
//public var test = ""
//class UserSettings: ObservableObject {
//    private init() { }
//
//    static let shared = UserSettings()
//
//    @Published var test = "t1"
//}

//enum Emotions: String, CaseIterable, Identifiable {
//    case happy
//    case sad
//    case excited
//
//    var id: String { self.rawValue }
//}
//@State private var selectedEmotion = Emotion.happy

struct ContentView: View {
    public var Emotions = ["happy","sad","excited"]
    @State public var test = ""
    //    @EnvironmentObject var settings: UserSettings = .shared
    //    @ObservedObject var test = Order()
    @State private var selectedEmotion = 0
    var body: some View {
        
        VStack {
            Text("How are you feeling?")
                .multilineTextAlignment(.center)
                .padding()
            Picker(selection: $selectedEmotion, label: Text("Please choose an emotion")) {
                ForEach(0 ..< Emotions.count) {
                    Text(self.Emotions[$0])
                }
            }
            Text("You chose: \(Emotions[selectedEmotion])")
            Button(action: {
                //                @State public var test = ""
                test = Emotions[selectedEmotion]
                
                
                
                
                
                
                
                
                
                
                
                
                
                let url = URL(string: "https://27mv57or9d.execute-api.us-east-1.amazonaws.com/prod")
                guard let requestUrl = url else { fatalError() }
                // Prepare URL Request Object
                var request = URLRequest(url: requestUrl)
                request.httpMethod = "POST"
                 
                // HTTP Request Parameters which will be sent in HTTP Request Body
                let uuid = UUID().uuidString
                print(uuid)

                let date = Date()
                let df = DateFormatter()
                df.dateFormat = "MM-dd-yyyy HH:mm:ss"
                let dateString = df.string(from: date)

                let newTodoItem = ["feedback_id": uuid, "tableName": "Feedback","date":dateString,"emotion":test,"name":"Andrew"] as [String : String]
                // Set HTTP Request Body

                do {
                let jsonData = try JSONEncoder().encode(newTodoItem)
                request.httpBody = jsonData
                // Perform HTTP Request
                let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                        
                        // Check for Error
                        if let error = error {
                            print("Error took place \(error)")
                            return
                        }
                 
                        // Convert HTTP Response Data to a String
                        if let data = data, let dataString = String(data: data, encoding: .utf8) {
                            print("Response data string:\n \(dataString)")
                        }
                }
                task.resume()
                }
                catch {print("catch error")}

                
                
                
                
                
                
                
                //                send Emotions[selectedEmotion]
                //                self.settings.test = Emotions[selectedEmotion]
            }) {
                Text("Log Emotion")
                    .bold()
            }
            
            Text("\(test)")
            //            Picker("Emotion", selection: $selection) {
            //                ForEach(Emotion.allCases) { emotion in
            //                    Text(emotion.rawValue.capitalized)
            //                }
            //                var test = $selection
        }
        //            var test = $selection
        //            let test = $selection; Binding<Int>
        //            Text("\(test)")
        
        //            Button("Sign In", action: awswrite)
    }
}


struct View2: View {
    //    @EnvironmentObject var settings: UserSettings = .shared
    var body: some View {
        Text("test")
        
        
        
        
        
        
        
//        let url = URL(string: "https://2jq441w3f5.execute-api.us-east-1.amazonaws.com/prod/")
//        guard let requestUrla = url else { fatalError() }
//        // Prepare URL Request Object
//        var request = URLRequest(url: requestUrla)
//            request.httpMethod = "POST"
//
//        // HTTP Request Parameters which will be sent in HTTP Request Body
//        let uuid = UUID().uuidString
//        print(uuid)
//
//        let date = Date()
//        let df = DateFormatter()
//        df.dateFormat = "MM-dd-yyyy HH:mm:ss"
//        let dateString = df.string(from: date)
//
//        let newTodoItem = ["operation": "scan", "tableName": "Feedback"] as [String : String]
//        // Set HTTP Request Body
//
//        do {
//        let jsonData = try JSONEncoder().encode(newTodoItem)
//        request.httpBody = jsonData
//        // Perform HTTP Request
//        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//
//                // Check for Error
//                if let error = error {
//                    print("Error took place \(error)")
//                    return
//                }
//
//                // Convert HTTP Response Data to a String
//            if let data = data, let dataString = String(data: data, encoding: .utf8) {
//                print("Response data string:\n \(dataString)")
//            }
//        //    if ~data.isEmpty, let dataString = String(data: data, encoding: .utf8) {
//        //        print("Response data string:\n \(dataString)")
//        //    }
//        }
//        task.resume()
//
//        }
//        catch {print("catch error read")}

        
        
        
        
        
        
        
        
        
        
//                Text("\(test)")
    }
}

struct TabItem: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Emotion")
                }
            
            View2()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("History")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //        ContentView().environmentObject(test())
        TabItem()
    }
}
