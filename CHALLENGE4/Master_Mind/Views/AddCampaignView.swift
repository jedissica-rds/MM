//
//  AddCampaignView.swift
//  Master_Mind
//
//  Created by Jessica Rodrigues on 21/05/24.
//

import SwiftUI
import SwiftData
import PhotosUI

struct AddCampaignView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State var campaignName: String = "" //nome da campanha
//    @State var story: String = "" //descrição da campanha
    @State var capa: UIImage?  //descrição da campanha
    @State var selectedPhoto: PhotosPickerItem?
    @State var selectedPhotoData: Data?
    @Binding var isAddCampaignPresent: Bool
    
//    @StateObject private var viewModel = PhotoPickerViewModel()
    
    @State var isImageSelected : Bool = false
    
    
    let characterLimit = 250
    
    @Environment(\.modelContext) private var context
    
    var body: some View {
        
        
        ZStack{
            VStack(alignment: .leading){
                
                PhotosPicker(selection: $selectedPhoto, matching: .images, label: {
                    if let selectedPhotoData, let uiImage = UIImage(data: selectedPhotoData){
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 426, height: 217)
                            .cornerRadius(70)
                    }else{
                        Image("AddButton")
                    }
                })
                .frame(width: 426, height: 217)
                .background(Color(red: 0.16, green: 0.16, blue: 0.18))
                .cornerRadius(40)
                .padding(EdgeInsets(top: 50, leading: 0, bottom: 20, trailing: 0))
                .onChange(of: selectedPhoto) { _, newItem in
                    Task{
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            selectedPhotoData = data
                        }
                    }
                }
                
                Text("Campaign Title")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.colorDefaultText)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 45))
                
                TextField("Enter the title of your new adventure!", text: $campaignName)
                    .keyboardType(.alphabet)
                    .disableAutocorrection(true)
                    .padding(EdgeInsets(top: 20, leading: 60, bottom: 20, trailing: 20))
                    .frame(width: 426, height: 64)
                    .zIndex(2)
                    .foregroundColor(Color.white)
                    .font(.headline)
                    .background(content: {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.colorBackgroundBox .opacity(0.100))
                            .stroke(Color(red: 0.53, green: 0.57, blue: 0.65), lineWidth: 0.5)
                        
                            .frame(width: 426, height: 64)
                            .padding(EdgeInsets(top: 30, leading: 0, bottom: 20, trailing: 0))
                    })
                
                HStack{
                    
                    Button(action: {
                        isAddCampaignPresent.toggle()
                        dismiss()
                        
                    }, label: {
                        Text("Cancel".uppercased())
                            .frame(width: 160, height: 48, alignment: .center)
                            .background(Color.colorCreateCard.cornerRadius(10))
                            .foregroundColor(.white)
                            .font(.headline)
                        .padding(EdgeInsets(top: 60, leading: 20, bottom: 0, trailing: 20))})
                    
                Button(action: {
                    let campanha = Campanha(titulo: campaignName, /*historia: story,*/ capa: selectedPhotoData)
                    
                    context.insert(campanha)
                    isAddCampaignPresent.toggle()
                    
                    do {
                        try context.save()
                        
                    }catch{
                        print(error.localizedDescription)
                    }
                    dismiss()
                    
                }, label: {
                    Text("Create Campaign".uppercased())
                        .frame(width: 200, height: 48, alignment: .center)
                        .background(Color.colorCreateCard.cornerRadius(10))
                        .foregroundColor(.white)
                        .font(.headline)
                    .padding(EdgeInsets(top: 60, leading: 20, bottom: 0, trailing: 0))})
                
            }
                Spacer()
                
            }
            
        }
        .frame(width: 600, height: 600)
        .background(Color.colorBackgroundCard)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
//        .background(Color.clear)
        .cornerRadius(70)
        .ignoresSafeArea()
        .task(id: selectedPhoto){
            if let data = try? await selectedPhoto?.loadTransferable(type: Data.self){
                selectedPhotoData = data
            }
            
        }
    }
    
}
