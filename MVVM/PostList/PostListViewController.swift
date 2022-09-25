//
//  ViewController.swift
//  MVVM
//
//  Created by İlayda Metin on 22.09.2022.
//

import UIKit

class PostListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = PostListViewModel()     //Private sayesinde bir sınıfın içerisinde tanımladığımız bir özelliği(fonksiyonu) sınıfın dışında kullanılmaz hale getirebiliyoruz.
    
    private var items: [PostCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupUI()
        viewModel.viewDelegate = self  //self i değer atama için kullnadık.
        viewModel.didViewLoad()

    }
}

private extension PostListViewController {    //Extension uzantı, genişletme anlamlarına gelir ve var olan protokollere veya yapılara yeni işlevler eklememizi sağlar.
    
    func setupUI() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        registerCell()   //Register veri depolamak için kullanılır.
    }
    func registerCell() {
        tableView.register(.init(nibName: "PostListTableViewCell", bundle: nil), forCellReuseIdentifier: "PostListTableViewCell")
    }
}

extension PostListViewController: PostListViewModelViewProtocol {
    func didCellItemFetch(_ items: [PostCellViewModel]) {
        self.items = items
        DispatchQueue.main.async {    //DispatchQueuen
            self.tableView.reloadData()
        }
    }
    func showEmptyView(){
        //TODO:
    }
    
    func hideEmptyView(){
       //TODO:
    }
}

extension PostListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didClickItem(at: indexPath.row)
    }
}

extension PostListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostListTableViewCell") as! PostListTableViewCell
        cell.postTitleLabel.text = items[indexPath.row].title
        cell.postDescLabel.text = items[indexPath.row].desc
        cell.postIdLbl.text = String(items[indexPath.row].id!)
        cell.postUserIdLbl.text = String(items[indexPath.row].userId!)
        
        return cell
    }
}
