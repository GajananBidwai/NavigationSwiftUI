//
//  ContentView.swift
//  NavigationSwiftUI
//
//  Created by Neosoft on 05/12/25.
//

import SwiftUI
import Kingfisher
import TipKit

struct ContentView: View {
    
    @State var product: [Product] = []
    @State var searchText: String = ""
    @StateObject var common = CommonFunction.shared
    @State var showsheet: Bool = false
    @State var presentInspecter: Bool = false
    @State var showPopover: Bool = false
    @State var openDialogue: Bool = false
    var tipButton = TipView()
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State var size : CGSize = .zero
    
    //To dismiss the view
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            //ScrollViewReader
            //ScrollView
            //Tool bar
            //ToolbarItem
            //ToolbarItemGroup
            //Search
            //Navigation Link
            
            //Zoom Transition .matchedTransition - This property open the view with zoom effect
            // Model views (sheet) - Opens cover on a view
            //Inspecter
            //Cpnfirmation dialogue
            //Tip Views
            //Tab view Tab(role : .search) - magnifying glass at the top
            //Pages
            //Side bar
            //TabSection
            //Adaptibility Size class
            //GeoMetry Reader
            //Preferences using preference key
            
            
//            ScrollViewReader { proxy in
//                ScrollView {
//                    LazyVStack(alignment: .leading) {
//                        ForEach(common.filteredItems) { item in
//                            ProductCell(
//                                productName: item.title,
//                                productPrice: "Rs.\(item.price)",
//                                productImage: item.image
//                            )
//                            .id(item.id)
//                            
//                        }
//                    }
//                }
//                .navigationTitle("Product")
//                .toolbar {
//                    ToolbarItemGroup {
//                        Button {
//                            if let firstID = product.first?.id {
//                                withAnimation {
//                                    proxy.scrollTo(firstID, anchor: .bottom)
//                                }
//                            }
//                        } label: {
//                            Image(systemName: "arrow.up")
//                        }
//                        
//                        Button {
//                            if let lastId = product.last?.id {
//                                withAnimation {
//                                    proxy.scrollTo(lastId, anchor: .top)
//                                }
//                            }
//                        } label: {
//                            Image(systemName: "arrow.down")
//                        }
//                        
//                        
//                        NavigationLink {
//                            ProductDetailsView()
//                        } label: {
//                            Image(systemName: "arrow.right")
//                        }
//
//                        Button {
//                            showsheet = true
//                            presentInspecter = true
//                            showPopover = true
//                            openDialogue = true
//                        } label: {
//                            Image(systemName: "plus")
//                        }
//
//                        
//                    }
//                }
//                
//            }
            
//            TabView {
//                Tab("Home", systemImage: "book.circle") {
//                    Text("Book")
//                        
//                }
//                
//                Tab("Setting", systemImage: "gear") {
//                    Text("Settings")
//                }
//                
//                TabSection("More option") {
//                    Tab("Settings", systemImage: "gear") {
//                        Text("Settings")
//                    }
//                }
//
//            }
//            .tabViewStyle(.page)
//            .tabViewStyle(.page(indexDisplayMode: .always))
//            side bar can show on the tab device not on the mobile phone
//            .tabViewStyle(.sidebarAdaptable)
            
            //Size Class
//            Group {
//                if horizontalSizeClass == .compact {
//                    VStack() {
//                        HeaderView(isCompact: true)
//                        BodyView()
//                    }
//                } else {
//                    VStack {
//                        HeaderView(isCompact: false)
//                        BodyView()
//                    }
//                }
//            }
            
//            GeoMetry Reader: based on a device can determine the geometry
//            GeometryReader { geometry in
//                let isPortrait = geometry.size.height > geometry.size.width
//                let message = isPortrait ? "Portrait" : "Landscape"
//                
//                HStack {
//                    Text(message)
//                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
//                }
//            }
            
//            Preferences
            
            Image(.sample)
                .resizable()
                .scaledToFit()
                .background(
                    GeometryReader(content: { geometry in
                        Color.clear
                            .preference(key: BoxPreference.self, value: geometry.size)
                    })
                )
            Text("\(Int(size.width)) x \(Int(size.height))")
            
            
        } .padding()
        .onPreferenceChange(BoxPreference.self, perform: { value in
            size = value
        })
        
//        .task({
//            try? Tips.configure([
//                .displayFrequency(.immediate)
//            ])
//        })
        
//        .confirmationDialog("Email", isPresented: $openDialogue, actions: {
//            Button("Cancel", role: .cancel) {
//
//            }
//            Button("Move to inbox", role: .destructive) {
//                
//            }
//            
//            
//        }, message: {
//            Text("Are you sure you want to confirm this action?")
//        })
//        
//        .popover(isPresented: $showPopover, content: {
//            ProductDetailsView()
//                
//        })
        
        
//        .inspector(isPresented: $presentInspecter, content: {
//            ProductDetailsView()
//        })
//        .sheet(isPresented: $showsheet, content: {
//            ProductDetailsView()
//                .interactiveDismissDisabled(true)
//                .presentationBackground(.thinMaterial)
//          //      .presentationDetents(.medium)
//        })
        
//        .searchable(text: $searchText, prompt: Text("Search Text"))
        // IT called every time when user type or removed from text from text field
//        .onSubmit(of: .search, {
//            searchTerm()
//        })
//        .onChange(of: searchText, initial: false, { old, value in
//            let search = value.trimmingCharacters(in: .whitespaces)
//            common.filterValue(search: search)
//            if value.isEmpty {
//                searchTerm()
//            }
//        })
        
        //Gives Search suggestions from the list
//        .searchSuggestions({
//            ForEach(product) { result in
//                Text("\(result.title)")
//                    .searchCompletion(result.title)
//            }
//        })
        .onAppear(perform: {
            APIHelper.shared.fetchData(url: Constant.product) { result in
                switch result {
                case .success(let product):
                    self.product = product
                    DispatchQueue.main.async {
                        common.product = product
                        common.filteredItems = product
                    }
                case .failure(_):
                    print("Error while getting data in View")
                }
            }
        })
        .padding()
        
        
        
        
    }
    func searchTerm(){
        let search = searchText.trimmingCharacters(in: .whitespaces)
        CommonFunction.shared.filterValue(search: search)
    }
    
}

struct HeaderView: View {
    var isCompact: Bool
    
    var body: some View {
        Text("Food Menu")
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: isCompact ? 150 : .infinity)
            .background(Color.yellow)
    }
}

struct BodyView: View {
    
    var body: some View {
        Text("Content View")
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.gray)
    }
}

struct BoxPreference: PreferenceKey {
    typealias value = CGSize
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
    
}


#Preview {
    ContentView()
}
