//
//  ViewController.swift
//  MemoAppi
//
//  Created by 岡瀬　瑞樹 on 2021/06/29.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    var objects = [Any]()
    var fileNames:[String] = []
    
    var inputTextField:UITextField?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.dataSource = self
        let manager = FileManager.default;
        do{
            try fileNames = manager.contentsOfDirectory(atPath: ViewController.filePath(fileName: ""))
            for i in 0..<fileNames.count {
                objects.append(fileNames[i])
            }
        }
        catch{}
    }
    
    @IBAction func insrtNewButton(_ sender: Any) {
        let alert = UIAlertController(title: "ファイル名", message: "", preferredStyle: .alert);
        alert.addTextField{
            textField -> Void in
            textField.placeholder = "新しいファイル";
            self.inputTextField = textField;
        }
        alert.addAction(UIAlertAction(title: "取り消し", style: .default, handler: nil));
        
        let okAction:UIAlertAction = UIAlertAction(title: "決定", style: .default){
            action -> Void in
            if self.inputTextField!.text == ""{
                self.inputTextField!.text = "新しいファイル";
            }
            self.objects.insert(self.inputTextField!.text ?? ",", at: 0);
            let indexPath = IndexPath(row: 0, section: 0);
            self.tableView.insertRows(at: [indexPath], with: .automatic)
            self.tableView.setEditing(false, animated: true)
        }
        alert.addAction(okAction);
        present(alert,animated:true, completion: nil);
    }
    
    @IBAction func editButton(_ sender: Any) {
        if self.tableView.isEditing{
            self.tableView.setEditing(false, animated: true)
        }
        else{
            self.tableView.setEditing(true, animated: true)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath)
        
        let  object = objects[indexPath.row] as! String;
        cell.textLabel!.text = object;
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle:UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath ) {
        if editingStyle == .delete {
            let str = objects[indexPath.row] as! String;
            do{
                try FileManager.default.removeItem(atPath: ViewController.filePath(fileName: str))
            }
            catch{}
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let indexPath = tableView.indexPathForSelectedRow {
            let object = objects[indexPath.row] as! String
            let controller = segue.destination as! ViewController2
            controller.title = object
        }
    }
    
    @IBAction func returnDetail(segue: UIStoryboardSegue){
        
    }
    
    static func filePath(fileName:String) -> String{
        let list = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as [String];
        return list[0] + "/" + fileName;
        
    }
}

