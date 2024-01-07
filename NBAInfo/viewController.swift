//
//  viewController.swift
//  NBAInfo
//
//  Created by Jiawen Wang on 6/1/24.
//

import Foundation


import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Replace the URL with the one you want to fetch data from
        if let url = URL(string: "https://www.google.com/search?q=golden+state+warriors&oq=g&gs_lcrp=EgZjaHJvbWUqBggAEEUYOzIGCAAQRRg7MgYIARBFGDsyBggCEEUYOTIGCAMQRRg7MgYIBBBFGDsyBggFEEUYPDIGCAYQRRg8MgYIBxBFGDzSAQg0NzIzajBqN6gCALACAA&sourceid=chrome&ie=UTF-8#sie=t;/m/0jmj7;3;/m/05jvx;mt;fp;1;;;") {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                } else if let data = data {
                    // Process the data here
                    let dataString = String(data: data, encoding: .utf8)
                    print(dataString ?? "No data")
                }
            }.resume()
        }
    }
}
