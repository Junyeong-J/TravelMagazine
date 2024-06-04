//
//  ChattingViewController.swift
//  TravelMagazine
//
//  Created by 전준영 on 6/3/24.
//

import UIKit

class ChattingViewController: UIViewController {
    
    @IBOutlet var chatTableView: UITableView!
    @IBOutlet var chatUIView: UIView!
    @IBOutlet var chatTextView: UITextView!
    @IBOutlet var sendButton: UIButton!
    
    var data: ChatRoom?
    var sections:[Int] = []
    let placeholder = "메시지를 입력하세요"
    var lastDate: String = "00.00.00"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
        configureUI()
    }
    
}

extension ChattingViewController{
    
    func configureTableView() {
        
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        let myXib = UINib(nibName: MyChatTableViewCell.identifier, bundle: nil)
        chatTableView.register(myXib, forCellReuseIdentifier: MyChatTableViewCell.identifier)
        
        let oppositeXib = UINib(nibName: OppositeChatTableViewCell.identifier, bundle: nil)
        chatTableView.register(oppositeXib, forCellReuseIdentifier: OppositeChatTableViewCell.identifier)
        
        chatTableView.separatorStyle = .none
        chatTableView.rowHeight = UITableView.automaticDimension
        chatTableView.estimatedRowHeight = 130
        chatTableView.scrollToRow(at: IndexPath(row: (self.data?.chatList.count)! - 1, section: 0), at: .bottom, animated: false)
    }
    
    func configureUI(){
        chatUIView.setViewUI(backgroundColor: .lightGray, cornerRadius: 10)
        chatTextView.delegate = self
        chatTextView.text = placeholder
        chatTextView.textColor = .lightGray
        
        sendButton.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
    }
    
}

extension ChattingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.chatList.count ?? 0
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if lastDate != data?.chatList[indexPath.item].newdate(){
            self.lastDate = (data?.chatList[indexPath.item].newdate())!
            if data?.chatList[indexPath.row].user == .user {
                let cell = tableView.dequeueReusableCell(withIdentifier: MyChatTableViewCell.identifier, for: indexPath) as! MyChatTableViewCell
                if let chat = data?.chatList[indexPath.item] {
                    cell.configureData(chat, change: false, changeDates: self.lastDate)
                }
                return cell
            } else {
                self.lastDate = (data?.chatList[indexPath.item].newdate())!
                let cell = tableView.dequeueReusableCell(withIdentifier: OppositeChatTableViewCell.identifier, for: indexPath) as! OppositeChatTableViewCell
                if let chat = data?.chatList[indexPath.item] {
                    cell.configureData(chat, change: false, changedates: self.lastDate)
                }
                return cell
            }
            
        }else {
            if data?.chatList[indexPath.row].user == .user {
                self.lastDate = (data?.chatList[indexPath.item].newdate())!
                let cell = tableView.dequeueReusableCell(withIdentifier: MyChatTableViewCell.identifier, for: indexPath) as! MyChatTableViewCell
                if let chat = data?.chatList[indexPath.item] {
                    cell.configureData(chat, change: true, changeDates: self.lastDate)
                }
                return cell
            } else {
                self.lastDate = (data?.chatList[indexPath.item].newdate())!
                let cell = tableView.dequeueReusableCell(withIdentifier: OppositeChatTableViewCell.identifier, for: indexPath) as! OppositeChatTableViewCell
                if let chat = data?.chatList[indexPath.item] {
                    cell.configureData(chat, change: true, changedates: self.lastDate)
                }
                return cell
            }
        }
    }
    
}

extension ChattingViewController: UITextViewDelegate {

    func textViewDidChange(_ textView: UITextView) {
        
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if textView == chatTextView{
            
            if textView.textColor == .lightGray {
                textView.text = nil
                textView.textColor = .black
            }
            
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        
        if textView == chatTextView{
            if textView.text.isEmpty {
                textView.text = placeholder
                textView.textColor = .lightGray
            }
        }
    }
    
}
