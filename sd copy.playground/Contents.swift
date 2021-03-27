import UIKit
import PlaygroundSupport

//DiaryManager().userExists(profileName: "Connor")
DiaryManager().createProfile(profileName: "Connor", age: 1)
    
extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}

class ViewController: UIViewController {
    
    var mood: String = ""
    var diaryText: String = ""
    var pageTitle: String = "Add/Delete User"
    var pageTitleLabel = UILabel()
    
    // diary
    let happyButton = UIButton()
    let sadButton = UIButton()
    let addButton = UIButton()
    var diaryTextView = UITextView()
    
   
    // addProfile
    let nameLabel = UITextField()
    let addName = UIButton()
    let resultsLabel = UILabel()
    let deleteButton = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func addProfile() {
        
        let verticalMargin:CGFloat = 100
        let horizontalMargin:CGFloat = 20
        let verticalSpacing:CGFloat = 20
        
        
        pageTitleLabel.frame = CGRect(x:horizontalMargin, y:20, width: view.frame.width-2*horizontalMargin, height: 50)
        pageTitleLabel.text = "Add/Delete User"
        pageTitleLabel.textColor = UIColor(hex: "#FFFFFFFF")
        
        nameLabel.frame = CGRect(x:horizontalMargin,y:verticalMargin, width: view.frame.width-2*horizontalMargin, height: 50)
        nameLabel.backgroundColor = .white
        
        addName.frame = CGRect(x: horizontalMargin, y:verticalMargin+50+1*verticalSpacing, width: view.frame.width-2*horizontalMargin, height: 50)
        addName.backgroundColor = UIColor(hex: "#FF1B1Cff")
        addName.setTitle("Add!", for: .normal)
        addName.setTitleColor(.white, for: .normal)
        addName.addTarget(self, action: #selector(addUser(_:)), for: .touchUpInside)
        
        deleteButton.frame = CGRect(x: horizontalMargin, y: verticalMargin+100+2*verticalSpacing, width: view.frame.width-2*horizontalMargin, height: 50)
        deleteButton.backgroundColor = UIColor(hex: "#FF1B1CFF")
        deleteButton.setTitle("Delete!", for: .normal)
        deleteButton.setTitleColor(.white, for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteUser(_:)), for: .touchUpInside)
        
        resultsLabel.frame = CGRect(x: horizontalMargin, y: verticalMargin+150+3*verticalSpacing, width: view.frame.width-2*horizontalMargin, height: 50)
        resultsLabel.backgroundColor = .white
        resultsLabel.text = ""
        
        view.addSubview(pageTitleLabel)
        view.addSubview(resultsLabel)
        view.addSubview(addName)
        view.addSubview(nameLabel)
        view.addSubview(deleteButton)
        
    }
    
    func runDiaryEntry() {
        
        let width = (view.frame.width - 60)/2
        
        happyButton.frame = CGRect(x:20,y:15,width:width,height:50)
        
        happyButton.tintColor = .black
        happyButton.backgroundColor = .white
        happyButton.setTitle("Happy", for: .normal)
        happyButton.setTitleColor(.black, for: .normal)
        happyButton.addTarget(self, action: #selector(setMood(_:)), for: .touchUpInside)
        view.addSubview(happyButton)
        
        sadButton.frame = CGRect(x:happyButton.frame.width+40,y:15,width:width,height:50)
        sadButton.tintColor = .black
        sadButton.backgroundColor = .white
        sadButton.setTitle("Sad", for: .normal)
        sadButton.setTitleColor(.black, for: .normal)
        sadButton.addTarget(self, action: #selector(setMood(_:)), for: .touchUpInside)
        view.addSubview(sadButton)
        
        diaryTextView.frame = CGRect(x:20,y:90,width: view.frame.width-40, height: view.frame.height-195)
        view.addSubview(diaryTextView)
        diaryText = diaryTextView.text
        
        addButton.frame = CGRect(x: 20, y: view.frame.height-90, width: view.frame.width-40, height: 50)
        addButton.setTitleColor(.white, for: .normal)
        addButton.backgroundColor = UIColor(hex: "#FF1B1Cff")
        addButton.setTitle("Add!", for: .normal)
        addButton.addTarget(self, action: #selector(addAction(_:)), for: .touchUpInside)
        view.addSubview(addButton)
    }
    
    @objc func addAction(_ sender: UIButton) {
        if mood != "" && diaryTextView.text != "" {
            DiaryManager().createProfile(profileName: "Connor", age: 4)
        }
        
    }
    
    @objc func setMood(_ sender: UIButton) {
        mood = sender.titleLabel!.text!
    }
    
    @objc func addUser(_ sender: UIButton) {
        let name = nameLabel.text!
        if name != "" {
            if DiaryManager().userExists(profileName: name) {
                resultsLabel.text = "\(name) already exists."
            }
            else {
                DiaryManager().createProfile(profileName: name, age: 1)
                resultsLabel.text = "A profile for \(name) is created."
            }
        }
        else {
            resultsLabel.text = "Please enter a name."
        }
        
    }
    
    @objc func deleteUser(_ sender: UIButton) {
        let name = nameLabel.text!
        
        if name != "" {
            if DiaryManager().userExists(profileName: name) {
                DiaryManager().deleteProfile(profileName: name)
                resultsLabel.text = "The profile for \(name) is deleted."
            }
            else {
                resultsLabel.text = "\(name) does not exist."
            }
        }
        else {
            resultsLabel.text = "Please enter a name."
        }
        
    }
    
}


var vc = ViewController()
vc.view.backgroundColor = UIColor(hex: "#216F60ff")
vc.view.frame = CGRect(x:0,y:0,width:300,height:500)

// add diary entry
//vc.runDiaryEntry()

// profiles page
vc.addProfile()


PlaygroundPage.current.liveView = vc
