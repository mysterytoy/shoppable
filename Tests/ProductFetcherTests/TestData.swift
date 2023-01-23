
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
