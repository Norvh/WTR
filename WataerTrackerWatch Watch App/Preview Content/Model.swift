//
//  Model.swift
//  WataerTrackerWatch Watch App
//
//  Created by Aisha Alnozili on 09/08/1445 AH.
//

import Foundation
import WatchConnectivity



final class Watchmodel: NSObject , ObservableObject {
    
    var session: WCSession
    
    init(session: WCSession  = .default) {
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }
}


extension Watchmodel: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if let error = error {
            print(error.localizedDescription)
        } else {
            print("The session has completed activation.")
        }
    }
   
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        
//        DispatchQueue.main.sync {
//            let receivedName = message["animal"] as? String ?? "hello"
//            let receivedemojie = message["animal"] as? String ?? "emoji"
//
//
//            self.messages.append(receivedName + receivedemojie)
//        }
//
        
    }
    
    
//     func addWater(amount: Double) {
//        withAnimation {
//            totalLitersDrank += amount
//        }
//    }
  
    func session(_ session: WCSession, didReceiveMessageData messageData: Data) {
        
      
//        DispatchQueue.main.sync {
//            guard let message = try? JSONDecoder().decode(AnimalModel.self, from: messagesData) else {
//                return
//            }
//
//            self.messagesData.append(message)
//        }
        
    }
    
    
}
