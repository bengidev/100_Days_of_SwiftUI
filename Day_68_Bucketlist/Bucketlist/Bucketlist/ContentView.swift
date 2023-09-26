//
//  ContentView.swift
//  Bucketlist
//
//  Created by Bambang Tri Rahmat Doni on 27/09/23.
//

import SwiftUI

/// Adding conformance to Comparable for custom types
///
struct User: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String

    static func < (lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

/// Writing data to the documents directory
///
extension FileManager {
    static var getDocumentsDirectory: URL {
        let paths = self.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

/// Switching view states with enums
///
enum LoadingState {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView("Loading...")
        }
    }
}

struct SuccessView: View {
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "checkmark.seal")
                .foregroundColor(.accentColor)
                .font(.title)
                .imageScale(.medium)
                .symbolVariant(.none)
            Text("Success!")
        }
    }
}

struct FailedView: View {
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "exclamationmark.triangle")
                .foregroundColor(.accentColor)
                .font(.title)
                .imageScale(.medium)
                .symbolVariant(.none)
            Text("Failed!")
        }
    }
}

struct ContentView: View {
    /// Adding conformance to Comparable for custom types
    ///
    private let users = [
        User(firstName: "Arnold", lastName: "Rimmer"),
        User(firstName: "Kristine", lastName: "Kochanski"),
        User(firstName: "David", lastName: "Lister"),
    ].sorted()

    /// Switching view states with enums
    ///
    private var loadingState = LoadingState.loading

    var body: some View {
        /// Adding conformance to Comparable for custom types
        ///
//        VStack {
//            List(users) { user in
//                Text("\(user.lastName), \(user.firstName)")
//            }
//        }

        /// Writing data to the documents directory
        ///
//        VStack(spacing: 10) {
//            Image(systemName: "globe")
//                .foregroundColor(.accentColor)
//            Text("Hello, World!")
//        }
//        .onTapGesture {
//            let str = "Test Message"
//            let url = getDocumentsDirectory().appending(path: "message.txt")
//
//            do {
//                try str.write(to: url, atomically: true, encoding: .utf8)
//                let input = try String(contentsOf: url)
//                print(input)
//            } catch {
//                print(error.localizedDescription)
//            }
//        }

        /// Switching view states with enums
        ///
        switch loadingState {
        case .loading:
            LoadingView()
        case .success:
            SuccessView()
        case .failed:
            FailedView()
        }
    }

    /// Writing data to the documents directory
    ///
    private func getDocumentsDirectory() -> URL {
        // Find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

        // Just send back the first one, which ought to be the only one
        return paths[0]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
