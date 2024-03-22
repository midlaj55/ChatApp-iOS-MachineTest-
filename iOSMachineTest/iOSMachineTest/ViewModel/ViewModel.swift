//
//  ViewModel.swift
//  iOSMachineTest
//
//  Created by Mc on 20/03/24.
//

import Foundation
import CoreData
import SwiftUI

class GroupViewModel: ObservableObject {
    private let viewContext = PersistenceController.shared.viewContext
    @Published var companyArray: [GroupName] = []
    @Published var groupItems: ResultData?
    @Published var groupName: String = ""
    @Published var groupBio: String = ""
    
    fileprivate var service = IteamListService()
    init() {
        service.delegate = self
        fetchCompanyData()
    }
    
    func getItemListValues() {
        service.getAllMoviewCategories()
    }
    
    func fetchCompanyData() {
        let request = NSFetchRequest<GroupName>(entityName: "GroupName")
        
        do {
            companyArray = try viewContext.fetch(request)
        }catch {
            print("DEBUG: Some error occured while fetching")
        }
    }
    
    func addDataToCoreData(groupName: String, groupBio: String) {
        let group = GroupName(context: viewContext)
        group.id = UUID()
        group.name = groupName
        group.bio = groupBio
        
        save()
        self.fetchCompanyData()
    }
    
    func save() {
        do {
            try viewContext.save()
        } catch {
            print("Error saving")
        }
    }
    
//    func saveToCoreData(groupName: String, groupBio: String) {
//        guard !groupName.isEmpty && !groupBio.isEmpty else { return }
//        
//        // Save data to Core Data
//        addDataToCoreData(groupName: groupName, groupBio: groupBio)
//        
//        // Clear text fields after saving
//        self.groupName = ""
//        self.groupBio = ""
//    }
    
    func saveToCoreData(groupName: Binding<String>, groupBio: Binding<String>) {
        guard !groupName.wrappedValue.isEmpty && !groupBio.wrappedValue.isEmpty else { return }
        
        // Save data to Core Data
        addDataToCoreData(groupName: groupName.wrappedValue, groupBio: groupBio.wrappedValue)
        
        // Clear text fields after saving
        groupName.wrappedValue = ""
        groupBio.wrappedValue = ""
    }
}

extension GroupViewModel: IteamListServiceDelegate {
    func productSuccessResponse(_ response: GroupResponse) {
        self.groupItems = response.result
    }

    func productFailResponse() {
        
    }
}
