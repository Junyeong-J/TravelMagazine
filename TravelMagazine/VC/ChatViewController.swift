//
//  ChatViewController.swift
//  TravelMagazine
//
//  Created by 전준영 on 6/3/24.
//

import UIKit

class ChatViewController: UIViewController {
    
    let chatList = mockChatList
    var newList:[ChatRoom] = []
    
    @IBOutlet var nicknameSearchBar: UISearchBar!
    @IBOutlet var chatListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationUI()
        configureUI()
        configureTable()
    }
    
    
    
}

extension ChatViewController {
    
    func navigationUI() {
        
        self.navigationTitle("TRAVEL TALK")
        
    }
    
    
    func configureUI() {
        
        nicknameSearchBar.placeholder = "친구 이름을 검색해보세요"
        nicknameSearchBar.tintColor = .black
        nicknameSearchBar.delegate = self
        
        newList = chatList
    }
    
    func configureTable() {
        chatListTableView.delegate = self
        chatListTableView.dataSource = self
        let xib = UINib(nibName: ChatListTableViewCell.identifier, bundle: nil)
        chatListTableView.register(xib, forCellReuseIdentifier: ChatListTableViewCell.identifier)
        chatListTableView.rowHeight = 80
    }
    
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatListTableViewCell.identifier, for: indexPath) as! ChatListTableViewCell
        cell.configureCell(data: chatList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: ChattingViewController.identifier) as! ChattingViewController
        vc.data = chatList[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ChatViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        var searchList: [ChatRoom] = []
        
        for item in chatList{
            if item.chatroomName.contains(searchBar.text!) {
                searchList.append(item)
            }
        }
        newList = searchList
        chatListTableView.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        newList = chatList
        chatListTableView.reloadData()
    }
    
}
