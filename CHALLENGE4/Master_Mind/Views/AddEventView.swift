//
//  AddEventView.swift
//  Master_Mind
//
//  Created by Jessica Rodrigues on 23/05/24.
//

import SwiftUI
import SwiftData
import PhotosUI

struct AddEventView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @State var eventName: String = "" //nome da campanha
    @State var story: String = "" //descrição da campanha
    @State var capa: UIImage?  //descrição da campanha
    @State var selectedPhoto: PhotosPickerItem?
    @State var selectedPhotoData: Data?
    let campanha : Campanha
    @State var isImageSelected : Bool = false
    var onEventAdded: ([Eventos]) -> Void
    
    let characterLimit = 250
    
    var body: some View {
        
        
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 700, height: 800)
                .background(Color.colorBackgroundCard)
                .cornerRadius(10)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
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
                
                TextField("Enter the card title", text: $eventName)
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
                
                Text("Story Description")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.colorDefaultText)
                    .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 45))
                
                TextField("Enter the card title", text: $story)
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
                        
                            .frame(width: 426, height: 160)
                            .padding(EdgeInsets(top: 125, leading: 0, bottom: 20, trailing: 0))
                    })
                Button(action: {
                    let count = campanha.eventos.count
                    let evento = Eventos(nome: eventName, descricao: story, capa: selectedPhotoData, order: count+1)
                    
                    evento.campanha = campanha
                    
                    context.insert(evento)
                    
                    do {
                        try context.save()
                        campanha.eventos.append(evento)
                        onEventAdded(campanha.eventos)
                    }catch{
                        print(error.localizedDescription)
                    }
                    dismiss()
                }, label: {
                    Text("Create Event".uppercased())
                        .frame(width: 291, height: 48, alignment: .center)
                        .background(Color.colorCreateCard.cornerRadius(10))
                        .foregroundColor(.white)
                        .font(.headline)
                    .padding(EdgeInsets(top: 135, leading: 70, bottom: 0, trailing: 0))})
                Spacer()
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all).opacity(100))
        .cornerRadius(10)
        .ignoresSafeArea(.all)
        .task(id: selectedPhoto){
            if let data = try? await selectedPhoto?.loadTransferable(type: Data.self){
                selectedPhotoData = data
            }
        }
        
    }
    
    
    
//    #Preview {
//        
//        NavigationStack{
//            AddCampaignView()
//                .modelContainer(for: [Eventos.self])
//        }
//    }
    
}
