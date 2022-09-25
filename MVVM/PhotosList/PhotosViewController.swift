//
//  PhotosViewController.swift
//  MVVM
//
//  Created by İlayda Metin on 22.09.2022.
//

import UIKit
import Kingfisher

class PhotosViewController: UIViewController  {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let viewModel = PhotosViewModel()
    private var itemsapp: [PhotosCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        viewModel.viewDelegate = self
        viewModel.didViewLoad()
        registerCell()
        designUI()
    }
}
extension PhotosViewController: PhotosViewModelViewProtocol {
    func didCellItemFetch(_ itemsapp: [PhotosCellViewModel]) {
    self.itemsapp = itemsapp
    DispatchQueue.main.async {
    self.collectionView.reloadData()
    self.collectionView.reloadInputViews()
        }
    }
    
    func showEmptyView() {
    }
    
    
    func hideEmptyView() {
    }
    
    
    func registerCell() {
    collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil),
                            forCellWithReuseIdentifier: "collectionCell")
    }
    
    
    func designUI() {
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        design.minimumInteritemSpacing = 5
        design.minimumLineSpacing = 5
        let width = view.frame.size.width
        let heigth = view.frame.size.height
        let hucreGenislik = (width - 30)
        design.itemSize = CGSize(width: hucreGenislik, height: heigth / 3 )
        collectionView.collectionViewLayout = design
    }
}

    extension PhotosViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsapp.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
                
        if let url = itemsapp[indexPath.row].url {
            cell.image1.kf.setImage(with: URL(string: url))
        }
        
        if let thumbnailUrl = itemsapp[indexPath.row].thumbnailUrl {
            cell.image2.kf.setImage(with: URL(string: thumbnailUrl))
        }
        
        cell.title.text = itemsapp[indexPath.row].title
        
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didClickItem(at: indexPath.row)
    }
    
}


