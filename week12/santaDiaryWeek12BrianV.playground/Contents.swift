import UIKit
import PlaygroundSupport

print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0])
//DiaryManager().displayEntries(profileName: "Connor")

//DiaryManager().displayEntries(profileName: "Connor", year: 2021)
    
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
    var user: String = ""
    
    // diary
    let happyButton = UIButton()
    let sadButton = UIButton()
    let addButton = UIButton()
    var diaryTextView = UITextView()
    
   
    // addProfile
    let nameLabel = TextFieldWithPadding()
    let addName = UIButton()
    let resultsLabel = SSPaddingLabel()
    let deleteButton = UIButton()
    let backToLoginButton = UIButton()
    
    // login page
    let loginButton = UIButton()
    let createButton = UIButton()
    
    // filter page
    let yearTextField = TextFieldWithPadding()
    let monthTextField = TextFieldWithPadding()
    let dayTextField = TextFieldWithPadding()
    let searchButton = UIButton()
    let userLabel = SSPaddingLabel()
    let moodTextField = TextFieldWithPadding()
    
    
    // create or read diaries
    let createDiaryButton = UIButton()
    let readDiaryButton = UIButton()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsLabel.padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        userLabel.padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    @objc func createOrReadView() {
        removeSubviews()
        
        let verticalMargin:CGFloat = 100
        let horizontalMargin:CGFloat = 20
        let verticalSpacing:CGFloat = 20
        
        pageTitleLabel.frame = CGRect(x:horizontalMargin, y:20, width: view.frame.width-2*horizontalMargin, height: 50)
        pageTitleLabel.text = "What do you want to do?"
        pageTitleLabel.textColor = UIColor(hex: "#FFFFFFFF")
        view.addSubview(pageTitleLabel)
        
        userLabel.frame = CGRect(x:horizontalMargin,y:verticalMargin, width: view.frame.width-2*horizontalMargin, height: 50)
        userLabel.text = user
        userLabel.backgroundColor = .white
        view.addSubview(userLabel)
        
        createDiaryButton.frame = CGRect(x: horizontalMargin, y:verticalMargin+50+1*verticalSpacing, width: view.frame.width-2*horizontalMargin, height: 50)
        createDiaryButton.backgroundColor = UIColor(hex: "#FF1B1Cff")
        createDiaryButton.setTitle("Add a diary entry", for: .normal)
        createDiaryButton.setTitleColor(.white, for: .normal)
        createDiaryButton.addTarget(self, action: #selector(readOrWrite(_:)), for: .touchUpInside)
        view.addSubview(createDiaryButton)
        
        readDiaryButton.frame = CGRect(x: horizontalMargin, y: verticalMargin+100+2*verticalSpacing, width: view.frame.width-2*horizontalMargin, height: 50)
        readDiaryButton.backgroundColor = UIColor(hex: "#FF1B1CFF")
        readDiaryButton.setTitle("Find a diary entry", for: .normal)
        readDiaryButton.setTitleColor(.white, for: .normal)
        readDiaryButton.addTarget(self, action: #selector(readOrWrite(_:)), for: .touchUpInside)
        view.addSubview(readDiaryButton)
        
        resultsLabel.frame = CGRect(x: 20, y: 350, width: view.frame.width-40, height: 50)
        resultsLabel.backgroundColor = .white
        resultsLabel.text = ""
        view.addSubview(resultsLabel)
        


        
    }
    
    @objc func filterView() {
        
        removeSubviews()
        
        let verticalMargin:CGFloat = 80
        let horizontalMargin:CGFloat = 20
        let verticalSpacing:CGFloat = 20
        
        pageTitleLabel.frame = CGRect(x:horizontalMargin, y:20, width: view.frame.width-2*horizontalMargin, height: 50)
        pageTitleLabel.text = "Search for Diary Entries"
        pageTitleLabel.textColor = UIColor(hex: "#FFFFFFFF")
        view.addSubview(pageTitleLabel)
        
        userLabel.frame = CGRect(x:horizontalMargin,y:verticalMargin, width: view.frame.width-2*horizontalMargin, height: 50)
        userLabel.backgroundColor = .white
        userLabel.text = user
        view.addSubview(userLabel)
        
        yearTextField.frame = CGRect(x: horizontalMargin, y:verticalMargin+50+1*verticalSpacing, width: view.frame.width-2*horizontalMargin, height: 50)
        yearTextField.backgroundColor = .white
        yearTextField.text = ""
        view.addSubview(yearTextField)
        
        monthTextField.frame = CGRect(x: horizontalMargin, y:verticalMargin+100+2*verticalSpacing, width: view.frame.width-2*horizontalMargin, height: 50)
        monthTextField.backgroundColor = .white
        monthTextField.text = ""
        view.addSubview(monthTextField)
        
        dayTextField.frame = CGRect(x: horizontalMargin, y:verticalMargin+150+3*verticalSpacing, width: view.frame.width-2*horizontalMargin, height: 50)
        dayTextField.backgroundColor = .white
        dayTextField.text = ""
        view.addSubview(dayTextField)
        
        searchButton.frame = CGRect(x: horizontalMargin, y:verticalMargin+250+5*verticalSpacing, width: view.frame.width-2*horizontalMargin, height: 50)
        searchButton.backgroundColor = UIColor(hex: "#FF1B1Cff")
        searchButton.setTitle("Search", for: .normal)
        searchButton.setTitleColor(.white, for: .normal)
        searchButton.addTarget(self, action: #selector(filter(_:)), for: .touchUpInside)
        view.addSubview(searchButton)
        
        moodTextField.frame = CGRect(x: horizontalMargin, y:verticalMargin+200+4*verticalSpacing, width: view.frame.width-2*horizontalMargin, height: 50)
        moodTextField.backgroundColor = .white
        moodTextField.text = ""
        view.addSubview(moodTextField)
        
        
        
        
    }
    
    @objc func loginView() {
        
        removeSubviews()
        DiaryManager().listUsers()
        
        let verticalMargin:CGFloat = 100
        let horizontalMargin:CGFloat = 20
        let verticalSpacing:CGFloat = 20
        
        pageTitleLabel.frame = CGRect(x:horizontalMargin, y:20, width: view.frame.width-2*horizontalMargin, height: 50)
        pageTitleLabel.text = "Login"
        pageTitleLabel.textColor = UIColor(hex: "#FFFFFFFF")
        view.addSubview(pageTitleLabel)
        
        nameLabel.frame = CGRect(x:horizontalMargin,y:verticalMargin, width: view.frame.width-2*horizontalMargin, height: 50)
        nameLabel.backgroundColor = .white
        view.addSubview(nameLabel)
        
        loginButton.frame = CGRect(x: horizontalMargin, y:verticalMargin+50+1*verticalSpacing, width: view.frame.width-2*horizontalMargin, height: 50)
        loginButton.backgroundColor = UIColor(hex: "#FF1B1Cff")
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.addTarget(self, action: #selector(login(_:)), for: .touchUpInside)
        view.addSubview(loginButton)
        
        resultsLabel.frame = CGRect(x: horizontalMargin, y: verticalMargin+150+3*verticalSpacing, width: view.frame.width-2*horizontalMargin, height: 50)
        resultsLabel.backgroundColor = .white
        resultsLabel.text = ""
        view.addSubview(resultsLabel)
        
        createButton.frame = CGRect(x: horizontalMargin, y: verticalMargin+100+2*verticalSpacing, width: view.frame.width-2*horizontalMargin, height: 50)
        createButton.backgroundColor = UIColor(hex: "#FF1B1CFF")
        createButton.setTitle("Create Account", for: .normal)
        createButton.setTitleColor(.white, for: .normal)
        createButton.addTarget(self, action: #selector(addProfileView), for: .touchUpInside)
        view.addSubview(createButton)
        
        
    }

    
    @objc func addProfileView() {
        
        removeSubviews()
        
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
        
        backToLoginButton.frame = CGRect(x: horizontalMargin, y:verticalMargin+200+4*verticalSpacing, width: view.frame.width-2*horizontalMargin, height: 50)
        backToLoginButton.backgroundColor = UIColor(hex: "#FF1B1Cff")
        backToLoginButton.setTitle("Back to login", for: .normal)
        backToLoginButton.setTitleColor(.white, for: .normal)
        backToLoginButton.addTarget(self, action: #selector(loginView), for: .touchUpInside)
        backToLoginButton.isHidden = true
        
        view.addSubview(pageTitleLabel)
        view.addSubview(resultsLabel)
        view.addSubview(addName)
        view.addSubview(nameLabel)
        view.addSubview(deleteButton)
        view.addSubview(backToLoginButton)
        
    }
    
    func setupDiaryUI() {
        
        removeSubviews()
        
        let width = (view.frame.width - 60)/2
        
        nameLabel.frame = CGRect(x:20,y:20, width: view.frame.width-40, height: 50)
        nameLabel.backgroundColor = .white
        view.addSubview(nameLabel)
        
        happyButton.frame = CGRect(x:20,y:90,width:width,height:50)
        
        happyButton.backgroundColor = .white
        happyButton.setTitle("Happy", for: .normal)
        happyButton.setTitleColor(.black, for: .normal)
        happyButton.addTarget(self, action: #selector(setMood(_:)), for: .touchUpInside)
        view.addSubview(happyButton)
        
        sadButton.frame = CGRect(x:happyButton.frame.width+40,y:90,width:width,height:50)
        sadButton.tintColor = .black
        sadButton.backgroundColor = .white
        sadButton.setTitle("Sad", for: .normal)
        sadButton.setTitleColor(.black, for: .normal)
        sadButton.addTarget(self, action: #selector(setMood(_:)), for: .touchUpInside)
        view.addSubview(sadButton)
        
        diaryTextView.frame = CGRect(x:20,y:165,width: view.frame.width-40, height: 160)
        diaryTextView.font = .systemFont(ofSize: 16)
        view.addSubview(diaryTextView)
        diaryText = diaryTextView.text
        
        resultsLabel.frame = CGRect(x: 20, y: 350, width: view.frame.width-40, height: 50)
        resultsLabel.backgroundColor = .white
        resultsLabel.text = ""
        view.addSubview(resultsLabel)
        
        addButton.frame = CGRect(x: 20, y: view.frame.height-90, width: view.frame.width-40, height: 50)
        addButton.setTitleColor(.white, for: .normal)
        addButton.backgroundColor = UIColor(hex: "#FF1B1Cff")
        addButton.setTitle("Add!", for: .normal)
        addButton.addTarget(self, action: #selector(addAction(_:)), for: .touchUpInside)
        view.addSubview(addButton)
    }
    
    @objc func addAction(_ sender: UIButton) {
        
        if nameLabel.text == "" {
            resultsLabel.text = "Type in your profile name."
            return
        }
        else {
               
            if !DiaryManager().userExists(profileName: nameLabel.text!) {
                resultsLabel.text = "\(nameLabel.text!) does not exist."
                return
            }
        }
        
        
        
        if mood == "" {
            resultsLabel.text = "Select a mood"
            return
        }
        
        if diaryTextView.text == "" {
            resultsLabel.text = "Your diary entry is empty."
            return
        }
        
        
        let entry = DiaryEntry(
            mood: mood,
            text: diaryTextView.text
        )

        if DiaryManager().addToDiary(profileName: nameLabel.text!, entry: entry) {
            resultsLabel.text = "Entry Successfull."
        }
        else {
            resultsLabel.text = "Error adding the diary entry."
        }
    }
    
    @objc func filter(_ sender: UIButton) {
        DiaryManager().displayEntries(profileName: user, year: yearTextField.text!, month: monthTextField.text!, day: dayTextField.text!, mood: moodTextField.text!)
    }
    
    @objc func setMood(_ sender: UIButton) {
        mood = sender.titleLabel!.text!
        resultsLabel.text = "You selected \(mood)"
        happyButton.backgroundColor = UIColor(hex: "#ffffffff")
        sadButton.backgroundColor = UIColor(hex: "#ffffffff")
        sender.backgroundColor = UIColor(hex: "#EDDDB9ff")
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
                backToLoginButton.isHidden = false
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
    
    func removeSubviews() {
        for view in self.view.subviews {
            view.removeFromSuperview()
        }
    }
    
    @objc func readOrWrite(_ sender: UIButton) {
        
        let name = nameLabel.text!
        if name != "" {
            if DiaryManager().userExists(profileName: name) {
                
            }
            else {
                resultsLabel.text = "User does not exist."
                return
            }
        }
        else {
            resultsLabel.text = "Please enter a name."
        }
        
        if let title = sender.titleLabel?.text {
            
            if title == "Add a diary entry" {
                // go to addDiaryEntry
                setupDiaryUI()
            }
            
            if title == "Find a diary entry" {
                // go to filter page
                filterView()
            }
        }
        
    }
    
    @objc func login(_ sender: UIButton) {
        
        
        
        if nameLabel.text == "" {
            resultsLabel.text = "Type in your profile name."
            return
        }
        else {
            
            if DiaryManager().userExists(profileName: nameLabel.text!) {
                resultsLabel.text = "Log in now!"
                user = nameLabel.text!
                createOrReadView()
            }
            else {
                resultsLabel.text = "\(nameLabel.text!) does not exist."
            }
        }
    }
    
}


var vc = ViewController()
vc.view.backgroundColor = UIColor(hex: "#216F60ff")
vc.view.frame = CGRect(x:0,y:0,width:300,height:500)

// login
vc.loginView()

// add diary entry
//vc.setupDiaryUI()

// profiles page
//vc.addProfile()




 

PlaygroundPage.current.liveView = vc
