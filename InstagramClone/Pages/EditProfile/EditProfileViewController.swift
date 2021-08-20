//
//  EditProfileViewController.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 1/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit

class EditProfileViewController: GenericViewController {
    @IBOutlet weak var editProfileTableView: UITableView!
    @IBOutlet weak var editProfileTableViewHeaderView: UIView!
    
    private var editProfileForms = [[EditProfileForm]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        editProfileFormsConfiguration()
    }
}

extension EditProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return editProfileForms.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return editProfileForms[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let editProfileFormTableViewCell = tableView.dequeueReusableCell(withIdentifier: EditProfileFormTableViewCell.identifier, for: indexPath) as! EditProfileFormTableViewCell
        editProfileFormTableViewCell.configure(editProfileForm: editProfileForms[indexPath.section][indexPath.row])
        editProfileFormTableViewCell.editProfileFormTableViewCellDelegate = self
        
        return editProfileFormTableViewCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard section == 1 else { return nil }
        
        return "Private Information"
    }
}

extension EditProfileViewController: EditProfileFormTableViewCellDelegate {
    func editProfileFormTableViewCell(_ editProfileFormTableViewCell: EditProfileFormTableViewCell, didUpdateEditProfileForm updatedEditProfileForm: EditProfileForm) {
        
    }
}

private extension EditProfileViewController {
    func setupUI() {
        navigationBarConfiguration()
        editProfileTableViewHeaderViewConfiguration()
        editProfileTableView.register(UINib(nibName: EditProfileFormTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: EditProfileFormTableViewCell.identifier)
    }
    
    func editProfileFormsConfiguration() {
        let personalInfoSectionLabels = ["Name", "Username", "Bio"]
        var personalInfoSection = [EditProfileForm]()
        for personalInfoSectionLabel in personalInfoSectionLabels {
            let editProfileForm = EditProfileForm(label: personalInfoSectionLabel, placeholder: "Enter \(personalInfoSectionLabel)...", value: nil)
            personalInfoSection.append(editProfileForm)
        }
        editProfileForms.append(personalInfoSection)
        
        let otherInfoSectionLabels = ["Email", "Phone", "Gender"]
        var otherInfoSection = [EditProfileForm]()
        for otherInfoSectionLabel in otherInfoSectionLabels {
            let editProfileForm = EditProfileForm(label: otherInfoSectionLabel, placeholder: "Enter \(otherInfoSectionLabel)...", value: nil)
            otherInfoSection.append(editProfileForm)
        }
        editProfileForms.append(otherInfoSection)
    }
    
    func navigationBarConfiguration() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveBarButtonItemTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelBarButtonItemTapped))
        navigationItem.title = "Edit Profile"
    }
    
    func editProfileTableViewHeaderViewConfiguration() {
        let profilePhotoButton = UIButton()
        profilePhotoButton.fround(cornerRadius: profilePhotoButton.frame.size.height / 2)
        profilePhotoButton.tintColor = .label
        profilePhotoButton.setBackgroundImage(UIImage(systemName: "person.circle.fill"), for: .normal)
        profilePhotoButton.addTarget(self, action: #selector(profilePhotoButtonTouchUpInside), for: .touchUpInside)
        editProfileTableViewHeaderView.addSubview(profilePhotoButton)
        profilePhotoButton.translatesAutoresizingMaskIntoConstraints = false
        profilePhotoButton.centerXAnchor.constraint(equalTo: editProfileTableViewHeaderView.centerXAnchor).isActive = true
        profilePhotoButton.centerYAnchor.constraint(equalTo: editProfileTableViewHeaderView.centerYAnchor).isActive = true
        profilePhotoButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        profilePhotoButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    @objc func saveBarButtonItemTapped() {
        
    }
    
    @objc func cancelBarButtonItemTapped() {
        dismiss(animated: true)
    }
    
    @objc func changeProfilePictureTapped() {
        let alertActions = [UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
            
        }), UIAlertAction(title: "Choose from Library", style: .default, handler: { _ in
            
        }), UIAlertAction(title: "Cancel", style: .cancel)]
        showActionSheetController(title: "Profile Picture", message: "Change profile picture", alertActions: alertActions, viewController: self, sourceView: view)
    }
    
    @objc func profilePhotoButtonTouchUpInside() {
        
    }
}
