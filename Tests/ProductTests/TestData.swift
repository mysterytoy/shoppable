
import Foundation

@testable import Product

let testJSON = """
{
  "products": [
    {
      "id": "1",
      "name":  "Henriksdal",
      "price": {
        "value": 499,
        "currency": "kr"
      },
      "info": {
        "material": "wood with cover",
        "color": "white"
      },
      "type": "chair",
      "imageUrl": "https://shop.static.ingka.ikea.com/PIAimages/0462849_PE608354_S4.JPG"
    },
    {
      "id": "2",
      "name":  "Lidhult",
      "price": {
        "value": 1035,
        "currency": "kr"
      },
      "info": {
        "numberOfSeats": 4,
        "color": "beige"
      },
      "type": "couch",
      "imageUrl": "https://shop.static.ingka.ikea.com/PIAimages/0667779_PE714073_S4.JPG"
    }
  ]
}
""".data(using: .utf8)!

let testJSON_unknownType = """
{
  "products": [
    {
      "id": "unknown",
      "name":  "unknown",
      "price": {
        "value": 999,
        "currency": "unknown"
      },
      "info": {
        "material": "unknown",
        "color": "unknown"
      },
      "type": "unknown",
      "imageUrl": "https://valid.url"
    }
  ]
}
""".data(using: .utf8)!

let testJSON_chairMissingMaterial = """
{
  "products": [
    {
      "id": "chair",
      "name":  "chair",
      "price": {
        "value": 999,
        "currency": "chair"
      },
      "info": {
        "color": "chair"
      },
      "type": "chair",
      "imageUrl": "https://valid.url"
    }
  ]
}
""".data(using: .utf8)!

let testJSON_couchMissingNumberOfSeats = """
{
  "products": [
    {
      "id": "couch",
      "name":  "couch",
      "price": {
        "value": 999,
        "currency": "couch"
      },
      "info": {
        "color": "couch"
      },
      "type": "couch",
      "imageUrl": "https://valid.url"
    }
  ]
}
""".data(using: .utf8)!

let testProducts = [
  Product(
    id: "1",
    name: "Henriksdal",
    price: .init(currency: "kr", value: 499),
    info: .chair(material: "wood with cover", color: "white"),
    imageURL: URL(string: "https://shop.static.ingka.ikea.com/PIAimages/0462849_PE608354_S4.JPG")!
  ),
  Product(
    id: "2",
    name: "Lidhult",
    price: .init(currency: "kr", value: 1035),
    info: .couch(numberOfSeats: 4, color: "beige"),
    imageURL: URL(string: "https://shop.static.ingka.ikea.com/PIAimages/0667779_PE714073_S4.JPG")!
  )
]
