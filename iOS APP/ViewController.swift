//
//  ViewController.swift
//  Music Plus
//
//  Created by 劉品萱 on 2019/9/19.
//  Copyright © 2019 劉品萱. All rights reserved.
//

import UIKit

//var songs:[String] = []

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    // In My Downloading Page
    @IBOutlet weak var MusicListSearchBar: UISearchBar!
    @IBOutlet weak var MusicListTableView: UITableView!
    
    var SongArray = [SONG]()
    var SongSearchArray = [SONG]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MusicListTableView?.estimatedRowHeight = 0
        //MusicListTableView?.delegate = self
        //MusicListTableView?.dataSource = self
        SetUpSongs()
        SetUpSongSearch()
        
        //GetSongName()
        // Do any additional setup after loading the view.
    }
    
    
    // Set up Songs Information
    private func SetUpSongs(){
        SongArray.append(SONG(Cover: "Red Moon", SongName: "Sleep in the car", Singer: "MAMAMOO", Category: .Korean))
        SongArray.append(SONG(Cover: "Purple", SongName: "Yes I Am", Singer: "MAMAMOO", Category: .Korean))
        SongArray.append(SONG(Cover: "Yellow Flower", SongName: "Starry Night", Singer: "MAMAMOO", Category: .Korean))
        
        
        SongSearchArray = SongArray
    }
    
    private func SetUpSongSearch(){
        MusicListSearchBar?.delegate = self
    }
    
    // Sign Up treaty agree buttom
    @IBAction func checkboxTuapped(sender:UIButton)
    {
        if(sender.isSelected)
        {
            sender.isSelected = false
        }
        else
        {
            sender.isSelected = true
        }
    }
    
    
    // PageViewController
    var CenterPVC:CenterPageViewController!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if(segue.identifier == "PVCSegue")
        {
            if(segue.destination.isKind(of: CenterPageViewController.self))
            {
                CenterPVC = segue.destination as? CenterPageViewController
            }
        }
    }
    
    // Change Page By Index Number
    @IBAction func FourPageFirst(_ sender: Any) {
        CenterPVC.setViewControllerFromIndex(index: 0)
    }
    
    @IBAction func FourPageSecond(_ sender: Any) {
        CenterPVC.setViewControllerFromIndex(index: 1)
    }
    
    @IBAction func FourPageThird(_ sender: Any) {
        CenterPVC.setViewControllerFromIndex(index: 2)
    }
    
    @IBAction func FourPageFourth(_ sender: Any) {
        CenterPVC.setViewControllerFromIndex(index: 3)
    }
    
    @IBAction func FourPageFifth(_ sender: Any) {
        CenterPVC.setViewControllerFromIndex(index: 4)
    }
    
    
    
    // Table View Data Information
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Declare Table View Cell Num
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SongSearchArray.count
    }
    // Set Table View DataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MusicListTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! SongsTableViewCell
        
        cell.CoverCell.image = UIImage(named: SongSearchArray[indexPath.row].Cover)
        cell.SongNameCell.text = SongSearchArray[indexPath.row].SongName
        cell.SingerCell.text = SongSearchArray[indexPath.row].Singer
        
        return cell
    }
    
    // Set Table View Cell high
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    // Search Bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else { SongSearchArray = SongArray; MusicListTableView.reloadData();  return }
        
        SongSearchArray =  SongArray.filter({song -> Bool in
            switch searchBar.selectedScopeButtonIndex{
            case 0:
                if searchText.isEmpty {return true}
                return song.SongName.lowercased().contains(searchText.lowercased())
            case 1:
                if searchText.isEmpty {return song.Category == .Chinese}
                return song.SongName.lowercased().contains(searchText.lowercased()) && song.Category == .Chinese
            case 2:
                if searchText.isEmpty {return song.Category == .Korean}
                return song.SongName.lowercased().contains(searchText.lowercased()) && song.Category == .Korean
            case 3:
                if searchText.isEmpty {return song.Category == .Japanese}
                return song.SongName.lowercased().contains(searchText.lowercased()) && song.Category == .Japanese
            case 4:
                if searchText.isEmpty {return song.Category == .Western}
                return song.SongName.lowercased().contains(searchText.lowercased()) && song.Category == .Western
            default:
                return false
            }
            
        })
        
        MusicListTableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        switch selectedScope{
        case 0:
            SongSearchArray = SongArray
        case 1:
            SongSearchArray = SongArray.filter({song -> Bool in
                song.Category == SongType.Chinese
            })
        case 2:
            SongSearchArray = SongArray.filter({song -> Bool in
                song.Category == SongType.Korean
            })
        case 3:
            SongSearchArray = SongArray.filter({song -> Bool in
                song.Category == SongType.Japanese
            })
        case 4:
            SongSearchArray = SongArray.filter({song -> Bool in
                song.Category == SongType.Western
            })
        default:
            break
        }
        
        MusicListTableView.reloadData()
        
    }
    
    
    /*
    // Get Music Player Song Name
    func GetSongName()
    {
        let folderURL = URL(fileURLWithPath: Bundle.main.resourcePath!)
        
        do
        {
            let SongPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            for song in SongPath
            {
                var mysong = song.absoluteString
                
                if (mysong.contains(".mp3"))
                {
                    let findString = mysong.components(separatedBy: "/")
                    mysong = findString[findString.count - 1]
                    mysong = mysong.replacingOccurrences(of: "%20", with: " ")
                    mysong = mysong.replacingOccurrences(of: ".mp3", with: "")
                    songs.append(mysong)
                }
            }
            myTableView.reloadData()
        }
        catch
        {
            
        }
    }*/
    
    
}


class SONG {
    let Cover: String
    let SongName: String
    let Singer: String
    let Category: SongType
    
    init(Cover: String, SongName: String, Singer: String, Category: SongType) {
        self.Cover = Cover
        self.SongName = SongName
        self.Singer = Singer
        self.Category = Category
    }
    
}

enum SongType: String {
    case Chinese = "Chinese"  // 華語
    case Korean = "Korean"   // 韓語
    case Japanese = "Japanese" // 日語
    case Western = "Western"  // 西洋
}


class CustomButton: UIButton{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBUttomStyle()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setBUttomStyle()
    }
    func setBUttomStyle(){
        layer.cornerRadius = 20 // 邊框橢圓
    }
}
