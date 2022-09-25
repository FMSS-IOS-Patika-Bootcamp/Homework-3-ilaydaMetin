//
//  PostListViewModel.swift
//  MVVM
//
//  Created by İlayda Metin on 22.09.2022.
//

import Foundation

protocol PostListViewModelViewProtocol: AnyObject {
    func didCellItemFetch(_ items: [PostCellViewModel])
    func showEmptyView()
    func hideEmptyView()
}
class PostListViewModel {
    
    private let model = PostListModel()
    
    weak var viewDelegate: PostListViewModelViewProtocol?
    
    init() {
        model.delegate = self
    }

    func didViewLoad() {
        model.fetchData()
    }
    
    func didClickItem(at index: Int) {
        _ = model.posts[index]
        
        //TODO: NAVIGATE
        
    }
}

private extension PostListViewModel {
    
    @discardableResult
    func makeViewBasedModel(_ posts: [Post]) -> [PostCellViewModel] {
        return posts.map{.init(title: $0.title, desc: $0.body, userId: $0.userId, id: $0.id)}
    }
}

// MARK: - PostListModelProtocol

extension PostListViewModel: PostListModelProtocol {
func didDataFetchProcessFinish(_ isSuccess: Bool) {
        if isSuccess {
        let posts = model.posts
        let cellModels = makeViewBasedModel(posts)
        viewDelegate?.didCellItemFetch(cellModels)
        viewDelegate?.hideEmptyView()
        }else {
        viewDelegate?.showEmptyView()
        }
    }
}
