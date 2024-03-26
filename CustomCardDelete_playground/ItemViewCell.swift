//
//  ItemViewCell.swift
//  CustomCardDelete_playground
//
//  Created by 양시관 on 3/26/24.
//

import SwiftUI

struct ItemViewCell: View {
    
    @Binding var item: Item
    var deleteDidTapClosure: (Item) -> ()
    
    var body: some View {
        
        ZStack {

            
            deleteButton
           
            
            HStack(spacing: 15) {
                Image(item.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 130, height: 130)
                    .cornerRadius(15)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(item.name)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Text(item.details)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                    
                    HStack(spacing: 15) {
                
                        Spacer()
                        

                        
                        Text("\(item.quantity)")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 5)
                            .background(Color.black.opacity(0.06))
                        

                    }
                }
            }
            .padding()
            .background(Color.black)
            .contentShape(Rectangle())
            .offset(x: item.offset)
            .gesture(DragGesture().onChanged(onChanged(value:)).onEnded(onEnd(value:)))
        }
    }
    

    
    
    func onChanged(value: DragGesture.Value) {
        if value.translation.width < 0 {
            
            if item.isSwiped {
                item.offset = value.translation.width - 90
            } else {
                item.offset = value.translation.width
            }
        }
    }
    
    func onEnd(value: DragGesture.Value) {
        withAnimation(.easeInOut) {
            if value.translation.width < 0 {
                

                 if -item.offset > 50 {
                    item.isSwiped = true
                    item.offset = -180
                } else {
                    item.isSwiped = false
                    item.offset = 0
                }
            } else {
                item.isSwiped = false
                item.offset = 0
            }
            
        }
    }
}

extension ItemViewCell {
    var deleteButton: some View {
        HStack {
            Spacer()
            
            // 새로운 버튼을 추가합니다.
            Button {
                // 여기에 '즐겨찾기' 버튼을 눌렀을 때 수행할 동작을 추가합니다.
                print("즐겨찾기 버튼이 눌렸습니다.")
            } label: {
                Image(systemName: "star.fill")
                    .font(.title)
                    .foregroundColor(.white)
                    //.frame(width: geometry.size.width / 2, height: geometry.size.height)
                    .frame(width: 90, height: 90)
                    .background(Color.yellow) // 즐겨찾기 버튼 색상 설정
                    .cornerRadius(15)
            }
            
            Button {
                // 여기에 '삭제' 버튼을 눌렀을 때 수행할 동작을 추가합니다.
                deleteDidTapClosure(item)
            } label: {
                Image(systemName: "trash")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 90, height: 50)
                    .background(Color.red) // 삭제 버튼 색상 설정
                    .cornerRadius(15)
            }
        }
    }
}
