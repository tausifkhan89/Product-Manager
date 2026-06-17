# Product Manager

A fully functional Flutter application that demonstrates fetching data from an external API, state management, filtering, and building a complete user flow from product discovery to cart management.

## 🚀 Features

* **Product Listing:** Fetches and displays a list of products from a remote API (`dummyjson.com/products`).
* **Search & Filter:** Includes a custom text field to seamlessly search and filter products in real-time.
* **Product Details:** Detailed view for each product, showcasing the product image, title, description, and an option to add the product to the cart.
* **Cart Management:** 
  * Add products to a cart with a single tap.
  * Real-time cart badge counter on the Home Screen.
  * Prevents adding duplicate items to the cart, notifying the user via Snackbars.
  * View added items in a dedicated Cart Screen.
* **State Management:** Efficient and reactive state management using the `provider` package to handle both products and cart data globally.
* **Loading & Error States:** Provides a smooth user experience with loading indicators during data fetching and error messages if the API call fails.

## 🛠️ Technologies Used

* **[Flutter](https://flutter.dev/):** The UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
* **[Dart](https://dart.dev/):** The programming language used by Flutter.
* **[Provider](https://pub.dev/packages/provider):** (`^6.1.5+1`) Used for robust and scalable state management.
  * `ProductProvider`: Manages fetching products, storing them, and filtering based on user search.
  * `CartProvider`: Manages the cart state, including the items in the cart and the total count.
* **[http](https://pub.dev/packages/http):** (`^1.6.0`) Used for making network requests to the DummyJSON API.
* **[Cupertino Icons](https://pub.dev/packages/cupertino_icons):** (`^1.0.8`) For utilizing iOS style icons where necessary.

## 📁 Project Structure

```text
lib/
├── models/
│   └── product_model.dart       # Data model for parsing product JSON data
├── providers/
│   ├── cart_provider.dart       # State management logic for the shopping cart
│   └── product_provider.dart    # State management logic for product fetching & filtering
├── screens/
│   ├── cart_screen.dart         # Screen displaying items added to the cart
│   ├── home_screen.dart         # Main screen displaying the list of products and search bar
│   └── product_screen.dart      # Screen displaying details of a specific product
├── services/
│   └── product_service.dart     # Service class handling the HTTP GET request to the API
├── widgets/
│   └── custom_text_field.dart   # Reusable custom text field widget used for searching
└── main.dart                    # Entry point of the application, sets up MultiProvider
```

## 🌐 API Reference

The app uses the open-source **DummyJSON API** to fetch product data.
* **Endpoint:** `GET https://dummyjson.com/products`

## 🏃‍♂️ Getting Started

### Prerequisites

Ensure you have the Flutter SDK installed on your machine. If not, follow the official [Flutter installation guide](https://docs.flutter.dev/get-started/install).

### Installation

1. **Clone the repository** (if applicable):
   ```bash
   git clone <repository-url>
   ```
2. **Navigate to the project directory:**
   ```bash
   cd product_manager
   ```
3. **Install dependencies:**
   ```bash
   flutter pub get
   ```
4. **Run the application:**
   ```bash
   flutter run
   ```

## 🤝 Contributing
Contributions, issues, and feature requests are welcome! Feel free to check the issues page.
