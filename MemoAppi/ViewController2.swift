//
//  ViewController2.swift
//  MemoAppi
//
//  Created by 岡瀬　瑞樹 on 2021/06/29.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var navi: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navi.title = self.title;
        if FileManager.default.fileExists(atPath: ViewController.filePath(fileName: self.title!)){
            var str = "";
            do{
                str = try String(contentsOfFile: ViewController.filePath(fileName: self.title!),encoding: String.Encoding.utf8);
            }catch{}
            self.textView.text = str;
        }else{
            self.textView.text = "";
        }
    }
        
        
    @IBAction func clickSave(_ sender: Any) {
        self.textView.resignFirstResponder();
        let str = self.textView.text;
        do{
            try str?.write(toFile: ViewController.filePath(fileName: self.title!),atomically: true, encoding: String.Encoding.utf8);
            let alert = UIAlertController(title: nil, message: "保存しました", preferredStyle: .alert);
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));
            present(alert, animated: true, completion: nil);
        }
        catch{
            let alert = UIAlertController(title: nil, message: "保存できませんでした", preferredStyle: .alert);
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));
            present(alert, animated: true, completion: nil)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
