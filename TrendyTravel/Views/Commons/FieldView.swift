//
//  FieldView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 17/07/2023.
//

import SwiftUI
import Utility_Toolbox

struct FieldView: View {
    var focusField: FocusState<FocusField?>.Binding
    @Binding var text: String
    var prompt: String
    var limit: Int
    var focusedValue: FocusField
    var submitValue: FocusField
    var submitLabel: SubmitLabel
    var isSecure: Bool
    var isDone: Bool
    var isDisabled: Bool
    
    init(focusField: FocusState<FocusField?>.Binding,
         text: Binding<String>,
         prompt: String,
         limit: Int = 320,
         focusedValue: FocusField,
         submitValue: FocusField,
         submitLabel: SubmitLabel = .continue,
         isSecure: Bool = false,
         isDone: Bool = false,
         isDisabled: Bool = false) {
        self.focusField = focusField
        self._text = text
        self.limit = limit
        self.prompt = prompt
        self.focusedValue = focusedValue
        self.submitValue = submitValue
        self.submitLabel = submitLabel
        self.isSecure = isSecure
        self.isDone = isDone
        self.isDisabled = isDisabled
    }
    
    var body: some View {
        if isSecure {
            SecureField(prompt.localizedKey, text: $text)
                .completeTextFieldStyle(text: $text,
                                        cornerRadius: 10,
                                        textColor: .accentColor,
                                        backgroundPadding: 12,
                                        focusField: focusField)
                .limitText(text: $text, limit: limit)
                .padding(.horizontal)
                .focused(focusField, equals: focusedValue)
                .submitLabel(submitLabel)
                .onSubmit {
                    if !isDone {
                        withAnimation {
                            focusField.wrappedValue = submitValue
                        }
                    }
                }
                .disabled(isDisabled)
                .keyboardType(.asciiCapable)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .dynamicTypeSize(.xSmall ... .accessibility3)
        } else {
            TextField(prompt.localizedKey, text: $text)
                .completeTextFieldStyle(text: $text,
                                        cornerRadius: 10,
                                        textColor: .accentColor,
                                        backgroundPadding: 12,
                                        focusField: focusField)
                .limitText(text: $text, limit: limit)
                .padding(.horizontal)
                .focused(focusField, equals: focusedValue)
                .submitLabel(submitLabel)
                .onSubmit {
                    if !isDone {
                        withAnimation {
                            focusField.wrappedValue = submitValue
                        }
                    }
                }
                .disabled(isDisabled)
                .keyboardType(.asciiCapable)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .dynamicTypeSize(.xSmall ... .accessibility3)
        }
    }
}
