//
//  PhotosModel.swift
//  MVVM
//
//  Created by İlayda Metin on 22.09.2022.
//

import Foundation

protocol PhotosModelProtocol: AnyObject{
    func didDataFetchProcessFinish(_ isSucess: Bool)
}
class PhotosModel {
    weak var delegate: PhotosModelProtocol?
    var photos: [Photos] = []
    
    
    func fetchData() {
        guard let url = URL.init(string:"https://jsonplaceholder.typicode.com/photos") else {
            delegate?.didDataFetchProcessFinish(false)
                    return
                }
        var request: URLRequest = .init(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else { return }
            guard error == nil
            else {
                self.delegate?.didDataFetchProcessFinish(false)
                return
            }
            let statusCode = (response as! HTTPURLResponse).statusCode
            guard
                  statusCode >= 200,
                  statusCode < 300
            else {
                self.delegate?.didDataFetchProcessFinish(false)
                return
            }
            
            guard let data = data else {
            self.delegate?.didDataFetchProcessFinish(false)
            return

        }
            do {
                let jsonDecoder = JSONDecoder()
                self.photos = try jsonDecoder.decode([Photos].self, from: data)
                
                self.delegate?.didDataFetchProcessFinish(true)
                
            } catch {
                print(error)
                self.delegate?.didDataFetchProcessFinish(false)
            }
    }
        task.resume()
        
    }
    
    
}

