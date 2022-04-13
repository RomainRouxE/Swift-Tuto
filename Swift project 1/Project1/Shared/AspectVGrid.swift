//
//  AspectVGrid.swift
//  Project1
//
//  Created by Roux Romain on 23/03/2022.
//

import SwiftUI

struct AspectVGrid<Item, ItemView>: View where ItemView: View, Item: Identifiable {
    var items: [Item]
    var aspectRatio: CGFloat
    var content: (Item) -> ItemView
    
    init(items: [Item], aspectRatio: CGFloat, @ViewBuilder content: @escaping (Item) -> ItemView) {
        self.items = items
        self.aspectRatio = aspectRatio
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                let width: CGFloat = widthThatFits(itemsCount: items.count, in: geometry.size, itemAspectRation: aspectRatio)
                LazyVGrid(columns: [adaptiveGridItem(width: width)], spacing: 0) {
                    ForEach(items) { item in
                        content(item).aspectRatio(aspectRatio, contentMode: .fit)
                    }
                }
                Spacer(minLength: 0)
            }
        }
    }
    
    private func adaptiveGridItem(width: CGFloat) -> GridItem {
        var gridItem = GridItem(.adaptive(minimum: width))
        gridItem.spacing = 0
        return gridItem
    }
    
    private func widthThatFits(itemsCount: Int, in size: CGSize, itemAspectRation: CGFloat) -> CGFloat {
        var columnCount = 1
        var rowCount = itemsCount
        repeat {
            let itemWidth = size.width / CGFloat(columnCount)
            let itemHeight = itemWidth / aspectRatio
            if CGFloat(rowCount) * itemHeight < size.height {
                break
            }
            columnCount += 1
            rowCount = (itemsCount + (columnCount - 1)) / columnCount
        } while columnCount < itemsCount
        if columnCount > itemsCount {
            columnCount = itemsCount
        }
        return floor(size.width / CGFloat(columnCount))
    }
}

//struct AspectVGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        AspectVGrid()
//    }
//}
