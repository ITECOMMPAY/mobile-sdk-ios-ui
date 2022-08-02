//
//  EmbeddedFieldView.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivev on 18.07.2022.
//

import SwiftUI

struct CustomerFieldValue {

}

protocol AdditionalField {}

struct EmbeddedFieldView: View {
    var visibleCustomerFields: [CustomerField]
    var additionalFields: [AdditionalField] = []
    @Binding var customerFieldValues: [CustomerFieldValue]
    @Binding var isValid: Bool

    var body: some View {
        VStack(spacing: UIScheme.dimension.formSmallSpacing) {
            ForEach(visibleCustomerFields, id: \.name) { field in
                switch field.fieldServerType {
                default:
                    // TODO: заменить биндинги на коллбеки
                    BaseCustomerTextField(value: .constant(""), isValid: .constant(true), customerField: field, formatter: EmptyFormatter(), isAllowedCaracter: { _ in true })
                }
            }
        }
    }

    // TODO: адаптировать механизм валидации
    /*
     val visibleRequiredCustomerFields = remember { visibleCustomerFields.filter { it.isRequired } }
     val changedFieldsMap = remember { mutableMapOf<String, CustomerFieldValue>() }
     val changedNonRequiredFieldsMap = remember { mutableMapOf<String, CustomerFieldValue>() }

     private fun validateFields(
     customerField: CustomerField,
     value: String,
     isValid: Boolean,
     changedFieldsMap: MutableMap<String, CustomerFieldValue>,
     changedNonRequiredFieldsMap: MutableMap<String, CustomerFieldValue>,
     visibleRequiredFields: List<CustomerField>,
     onCustomerFieldsChanged: (List<CustomerFieldValue>, Boolean) -> Unit
     ) {
     //добавляем в мапу поля, которые были изменены пользователем
     //проверка на валидность и обязательность
     if (isValid && customerField.isRequired) {
     changedFieldsMap[customerField.name] =
     CustomerFieldValue.fromNameWithValue(customerField.name, value)
     } else if (!customerField.isRequired) {
     //добавляем в мапу измененные необязательное поля
     changedNonRequiredFieldsMap[customerField.name] =
     CustomerFieldValue.fromNameWithValue(customerField.name, value)
     } else if (customerField.isRequired) {
     changedFieldsMap.remove(customerField.name)
     }
     //список всех обязательных полей (по имени)
     val allRequiredFields = visibleRequiredFields.map { it.name }.sorted().toTypedArray()
     //список всех измененных обязательных полей (по имени)
     val changedRequiredCustomerFieldsList = changedFieldsMap.keys.sorted().toTypedArray()
     val allCustomerFields = (changedFieldsMap + changedNonRequiredFieldsMap).values.map {
     CustomerFieldValue.fromNameWithValue(
     it.name,
     it.value
     )
     }
     onCustomerFieldsChanged(
     allCustomerFields,
     allRequiredFields contentEquals changedRequiredCustomerFieldsList  //проверка, что список всех обязательных полей соответствует списку измененных и прошедших проверку обязательных полей
     )
     }
     */
}

#if DEBUG

struct EmbeddedFieldView_Previews: PreviewProvider {
    static var previews: some View {
        EmbeddedFieldView(visibleCustomerFields: [], customerFieldValues: .constant([]), isValid: .constant(false))
    }
}

#endif
