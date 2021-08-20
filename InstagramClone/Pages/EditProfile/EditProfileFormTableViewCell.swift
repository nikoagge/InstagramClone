//
//  EditProfileFormTableViewCell.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 20/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit

protocol EditProfileFormTableViewCellDelegate: AnyObject {
    func editProfileFormTableViewCell(_ editProfileFormTableViewCell: EditProfileFormTableViewCell, didUpdateEditProfileForm updatedEditProfileForm: EditProfileForm)
}

class EditProfileFormTableViewCell: UITableViewCell {
    @IBOutlet weak var editProfileFormTableViewCellLabel: UILabel!
    @IBOutlet weak var editProfileFormTableViewCellTextField: UITextField!
    
    static let identifier = "EditProfileFormTableViewCell"
    static let nibName = "EditProfileFormTableViewCell"
    
    private var editProfileForm: EditProfileForm?
    public weak var editProfileFormTableViewCellDelegate: EditProfileFormTableViewCellDelegate?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        editProfileFormTableViewCellLabel.text = nil
        editProfileFormTableViewCellTextField.placeholder = nil
        editProfileFormTableViewCellTextField.text = nil
    }
    
    public func configure(editProfileForm: EditProfileForm) {
        self.editProfileForm = editProfileForm
        editProfileFormTableViewCellLabel.text = editProfileForm.label
        editProfileFormTableViewCellTextField.placeholder = editProfileForm.placeholder
        editProfileFormTableViewCellTextField.text = editProfileForm.value
    }
}

extension EditProfileFormTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        editProfileForm?.value = textField.text
        guard let editProfileForm = editProfileForm else { return true }
        editProfileFormTableViewCellDelegate?.editProfileFormTableViewCell(self, didUpdateEditProfileForm: editProfileForm)
        textField.resignFirstResponder()
        
        return true
    }
}
