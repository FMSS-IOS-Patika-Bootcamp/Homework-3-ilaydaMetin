//
//  PhotosViewModel.swift
//  MVVM
//
//  Created by İlayda Metin on 22.09.2022.
//

import Foundation

protocol PhotosViewModelViewProtocol: AnyObject {
    
    func didCellItemFetch(_ items2: [PhotosCellViewModel])
    func showEmptyView()
    func hideEmptyView()
}


class PhotosViewModel {
    
  private let model = PhotosModel()
  weak var viewDelegate: PhotosViewModelViewProtocol?
  
  init() {
      model.delegate = self
  }
 
  func didViewLoad() {
      model.fetchData()
      
  }
  func didClickItem(at index: Int) {
      _ = model.photos[index]
      
  }
}
private extension PhotosViewModel {
    
    @discardableResult
    func makeViewBasedModel(_ photos: [Photos]) -> [PhotosCellViewModel] {
        
        return photos.map { .init(url: $0.url, thumbnailUrl: $0.thumbnailUrl, title: $0.title)
            
           
        }
            
        }
    }
extension PhotosViewModel: PhotosModelProtocol {
    func didDataFetchProcessFinish(_ isSucess: Bool) {
        if isSucess {
            let photos = model.photos
            let cellModels = makeViewBasedModel(photos)
            viewDelegate?.didCellItemFetch(cellModels)
            viewDelegate?.hideEmptyView()
        } else {
            viewDelegate?.showEmptyView()
            
        }
    }
}

