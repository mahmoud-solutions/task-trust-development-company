🍔 Dushka Burger App

Dushka Burger App is a mobile application that allows users (guest users) to browse categories, view product details, and manage their cart in a seamless and modern way. The app is fully production-ready, following clean architecture principles.

Features

Guest User Flow
Handle guest users only, no authentication required

Categories
Browse all available product categories

Product Details
View detailed product information and addons/extras

Cart Management
View cart, add products with quantity and addons, delete items

Error Handling
Proper error handling for network requests and API errors

Localization
Supports English and Arabic languages

Tech Stack & Architecture

Flutter & Dart

Clean Architecture (Domain, Data, Presentation layers)

Cubit for state management

Dio for API integration

Dependency Injection

RESTful APIs

Modular and scalable project structure

API Integration

Base URL:
https://dushkaburger.com/wp-json/

Authentication:
Basic Auth with credentials:

Username: testapp

Password: 5S0Q YjyH 4s3G elpe 5F8v u8as

Endpoints:

Get Guest ID
GET guestcart/v1/guestid

Get Categories
GET custom-api/v1/categories

Get Product Details
GET custom-api/v1/products?product_id={id}

Get Product Addons/Extras
GET proaddon/v1/get2/?product_id2={id}

Get Cart (Guest User)
GET guestcart/v1/cart?guest_id={guestId}

Add to Cart (Guest User)
POST guestcart/v1/cart

{
  "guest_id": "guest_123",
  "items": [
    {
      "product_id": 456,
      "quantity": 2,
      "addons": [
        {
          "id": 789,
          "name": "Extra Cheese",
          "price": "5.00"
        }
      ]
    }
  ]
}

Delete from Cart (Guest User)
DELETE guestcart/v1/cart

{
  "guest_id": "guest_123",
  "product_id": 456,
  "quantity": 1
}
Screens

Categories Screen – Display all product categories

Product Details Screen – Show product info, price, and addons

View Cart Screen – Display cart items, manage quantity, delete items

Why This Project Is Important

Gained experience building production-ready Flutter apps

Applied Clean Architecture in real-world project

Practiced Cubit state management effectively

Learned to integrate RESTful APIs with proper error handling

Developed a fully localized app supporting multiple languages

Acknowledgements

Built in collaboration with Next Zone

Special thanks to API team at Dushka Burger for providing endpoints
