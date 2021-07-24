//
//  Networking.swift
//  AppsCore
//
//  Created by Apit Aprida on 24/07/21.
//

import Foundation

extension AppsCore {
  
  public class Networking {
    
    public class Manager {
      public init() {}
      
      private let session = URLSession.shared
      
      public func loadData(from url: URL, completionHandler: @escaping(NetworkResult<Data>) -> Void) {
        let task = session.dataTask(with: url) { data, response, error in
          let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
          completionHandler(result)
        }
        task.resume()
      }
    }
    
    public enum NetworkResult<Value> {
      case success(Value)
      case failure(Error?)
    }
  }
}
