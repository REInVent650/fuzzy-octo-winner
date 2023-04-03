//
//  ContentView.swift
//  SaW
//
//  Created by Startegy In Motion on 3/04/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    //@FocusState private var emailFieldIsFocused: Bool = false
    
    var body: some View {
        VStack {
            Text("Log in to Shake and Wipe")
                .font(.system(size: 25, weight: .regular, design: .default))
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.primary)
                .background(.teal)
            VStack {
                Spacer()
                VStack {
                    Text("Please enter Name, Email and Password")
                    TextField("Name", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .clipped()
                        .padding()
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .clipped()
                    TextField(
                        "Password",
                        text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .clipped()
                    Text("Continue".uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .clipped()
                        .background(.teal)
                        .font(.system(size: 20, weight: .regular, design: .default))
                    Text("By clicking continue you agree with our Privacy Policy")
                        .padding()
                        .font(.footnote.weight(.regular))
                    Text("Reset Password")
                        .font(.body.weight(.medium))
                        .foregroundColor(.teal)
                }
                Spacer()
            }
            .padding()
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
