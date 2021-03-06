//
//  SettingsViewController.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 1/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit

class SettingsViewController: GenericViewController {
    @IBOutlet weak var settingsTableView: UITableView!
    
    private var settingsCellModelData = [[SettingsCellModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSettingsCellModel()
    }
}

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingsCellModelData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsCellModelData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        tableViewCell.textLabel?.text = settingsCellModelData[indexPath.section][indexPath.row].title
        
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        settingsCellModelData[indexPath.section][indexPath.row].handler()
    }
}

private extension SettingsViewController {
    func configureSettingsCellModel() {
        settingsCellModelData.append([SettingsCellModel(title: "Edit Profile", handler: { [weak self] in
            guard let self = self else { return }
            self.editProfileTapped()
        }), SettingsCellModel(title: "Invite Friends", handler: { [weak self] in
            guard let self = self else { return }
            self.inviteFriendsTapped()
        }), SettingsCellModel(title: "Save Original Posts", handler: { [weak self] in
            guard let self = self else { return }
            self.saveOriginalPostsTapped()
        })])
        settingsCellModelData.append([SettingsCellModel(title: "Terms Of Service", handler: { [weak self] in
            guard let self = self else { return }
            self.termsOfServiceTapped()
        }), SettingsCellModel(title: "Privacy Policy", handler: { [weak self] in
            guard let self = self else { return }
            self.privacyPolicyTapped()
        }), SettingsCellModel(title: "Help / Feedback", handler: { [weak self] in
            guard let self = self else { return }
            self.helpOrFeedbackTapped()
        })])
        settingsCellModelData.append([SettingsCellModel(title: "Log Out", handler: { [weak self] in
            guard let self = self else { return }
            self.logOutTapped()
        })])
    }
    
    @objc func editProfileTapped() {
        navigate(.init(pageType: .editProfileViewController, navigationStyle: .presentWithinNavigation(animated: true, hidesBottomBar: true, modalPresentationStyle: .fullScreen)))
    }
    
    @objc func inviteFriendsTapped() {
        
    }
    
    @objc func saveOriginalPostsTapped() {
        
    }
    
    @objc func termsOfServiceTapped() {
        
    }
    
    @objc func privacyPolicyTapped() {
        
    }
    
    @objc func helpOrFeedbackTapped() {
        
    }
    
    @objc func logOutTapped() {
        let logoutAction = UIAlertAction(title: "Log Out", style: .destructive) { action in
            AuthManager.shared.logOut { loggedOutSuccessfully in
                DispatchQueue.main.async {
                    if loggedOutSuccessfully {
                        self.navigate(.init(pageType: .loginViewController, navigationStyle: .presentAndPopToRootViewController(modalPresentationStyle: .fullScreen, animated: true)))
                    } else {
                        fatalError("Couldn't log out user.")
                    }
                }
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let alertActions = [logoutAction, cancelAction]
        showActionSheetController(title: "Log Out", message: "Are you sure you want to log out?", alertActions: alertActions, viewController: self, sourceView: settingsTableView)
    }
}
