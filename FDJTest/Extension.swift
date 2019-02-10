//
//  Extension.swift
//  FDJTest
//
//  Created by julien brandin on 10/02/2019.
//  Copyright © 2019 julien brandin. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func download(_ string : String){
        
        guard let url = URL(string: string) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let imageData = data, let image = UIImage(data: imageData ) else {return}
            DispatchQueue.main.async {
                self.image = image
            }
            }.resume()
        
    }
    
}

extension UIViewController {
    
    func displayErrorAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
