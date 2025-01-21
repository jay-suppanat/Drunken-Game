//
//  EditCommandContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 21/1/2568 BE.
//

import SwiftUI

struct EditCommandContentView: View {
    @StateObject var viewModel: EditCommandViewModel

    var body: some View {
        Text("Edit Command")
    }
}

#Preview {
    EditCommandContentView(viewModel: EditCommandViewModel())
}
