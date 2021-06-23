//
//  ViewController.swift
//  SmiteAssistant
//
//  Created by Levi Carpenter on 6/9/21.
//

import UIKit
import Foundation
import CryptoKit

let DEVID = "3963"
let AUTHKEY = "C7788D2F0AC54C96817146849B35D0B1"
let baseUrl = "https://api.smitegame.com/smiteapi.svc"
var sessionId: String? = nil

class ViewController: UIViewController {
    var godResponse : Array<SessionResponse> = []
    var godImageHolders : Array<GodImageHolder> = []
    let methods = ["createsession", "testsession", "getgods", "getitems"]
    
    @IBOutlet weak var methodPickerView: UIPickerView!
    @IBOutlet weak var responseTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        methodPickerView.delegate = self
        methodPickerView.dataSource = self
    }
    
    @IBAction func onSendRequest(_ sender: Any) {
        let selectedRow = methodPickerView.selectedRow(inComponent: 0)
        var url = ""
        let method = methods[selectedRow]
        let signature = createSignature(from: methods[selectedRow])
        let timestamp = createTimestamp()
        
        switch selectedRow {
        case 0:
            url = "\(baseUrl)/\(method)Json/\(DEVID)/\(signature)/\(timestamp)"
            break
        case 1:
            if sessionId == nil {
                self.responseTextView.text = "Must create session first"
                return
            }
            url = "\(baseUrl)/\(method)Json/\(DEVID)/\(signature)/\(sessionId!)/\(timestamp)"
            break
        default:
            if sessionId == nil {
                self.responseTextView.text = "Must create session first"
                return
            }
            url = "\(baseUrl)/\(method)Json/\(DEVID)/\(signature)/\(sessionId!)/\(timestamp)/1"
            
        }
        
        
        getData(from: url, selectedRow: selectedRow)
    }
    
    private func getData(from url: String, selectedRow: Int) {
        print(url)
        
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
            guard let data = data, error == nil else {
                print("Something went wrong")
                return
            }
            
            print(data)
            
            switch selectedRow {
            case 0:
                var result: SessionResponse?
                
                do {
                    result = try JSONDecoder().decode(SessionResponse.self, from: data)
                } catch {
                    print("failed to convert \(error.localizedDescription)")
                }
                
                guard let json = result else {
                    return
                }
                
                if json.session_id != nil {
                    print("session_id to sessionID" + json.session_id!)
                    sessionId = json.session_id!
                }
                
                DispatchQueue.main.async {
                    self.responseTextView.text = json.toString()
                }
                break
            default:
                var result: Array<SessionResponse>?
                
                do {
                    result = try JSONDecoder().decode(Array<SessionResponse>.self, from: data)
                } catch {
                    print("failed to convert \(error.localizedDescription)")
                }
                
                guard let json = result else {
                    return
                }
                
                print(json)
                
                self.completeResponse(response: json)
                
                DispatchQueue.main.async {
                    var responseString = "["
                    for god in json {
                        responseString += god.toString() + ","
                    }
                    responseString += "]"
                    self.responseTextView.text = responseString
                }
            }
        })
        
        task.resume()
    }
    
    private func completeResponse(response: Array<SessionResponse>) {
        self.godResponse = response
        
        if self.godResponse.count != 0 {
            print("got god images")
            var i = 0
            for god in self.godResponse {
                let imageHolder = GodImageHolder.init(id: i, ability1URL: god.godAbility1_URL!, ability2URL: god.godAbility2_URL!, ability3URL: god.godAbility3_URL!, ability4URL: god.godAbility4_URL!, ability5URL: god.godAbility5_URL!, godCardURL: god.godCard_URL!, godIconURL: god.godIcon_URL!)
                
                imageHolder.getImages()
                self.godImageHolders.append(imageHolder)
                i += 1
            }
        }
        
    }

    private func createSignature(from methodName: String) -> String {
        let timestamp = createTimestamp()
        print(timestamp)
        let signature = DEVID + methodName + AUTHKEY + timestamp
        print(signature)
        return signature.MD5
    }
    
    private func createTimestamp() -> String {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyyMMddHHmmss"
        format.timeZone = TimeZone(identifier: "UTC")
        return format.string(from: date)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueFromBaseToGod" {
            let destinationVC = segue.destination as! GodSearchViewController
            
            destinationVC.godList = self.godResponse
            destinationVC.godImageHolders = self.godImageHolders
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return self.godImageHolders.hasAllImages()
    }

}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return methods.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return methods[row]
    }
}

extension String {
    var MD5: String {
        let computed = Insecure.MD5.hash(data: self.data(using: .utf8)!)
        return computed.map { String(format: "%02hhx", $0) }.joined()
    }
}

