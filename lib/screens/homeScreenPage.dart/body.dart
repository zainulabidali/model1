import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:model1/provider.dart';
import 'package:model1/screens/const.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Row(
      children: [
        // Left Side - Categories
        Container(
          width: 100,
          color: KbodybgColor,
          child: productProvider.isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: productProvider.categories.length,
                  itemBuilder: (context, index) {
                    final category = productProvider.categories[index]["title"];
                    return GestureDetector(
                      onTap: () {
                        productProvider.selectCategory(category);
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: productProvider.selectedCategory == category
                              ? Colors.green[100]
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  productProvider.categories[index]["image"]),
                              backgroundColor: Colors.green[100],
                              radius: 30,
                            ),
                            const SizedBox(height: 5),
                            Text(category, style: KsecondaryText),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),

        // Right Side - Products
        Expanded(
          child: productProvider.isLoading
              ? Center(child: CircularProgressIndicator())
              : productProvider.errorMessage != null
                  ? Center(
                      child: Text(
                        productProvider.errorMessage!,
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  : GridView.builder(
                      padding: EdgeInsets.all(5),
                      itemCount: productProvider.products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              childAspectRatio: 0.6),
                      itemBuilder: (context, index) {
                        var product = productProvider.products[index];

                        // Handle unavailable products
                        if (!product["status"]) {
                          return Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .start, // Align all content to the start (left)
                                children: [
                                  // Image with border radius
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        10), // Added radius to image
                                    child: Image.network(
                                      product["image"][0]["url"],
                                      fit: BoxFit.cover,
                                      height: 150,
                                    ),
                                  ),
                                  SizedBox(height: 10),

                                  // Text wrapped in Column
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start, // Ensure text is aligned to the left (start)
                                    children: [
                                      Text(
                                        product["title"],
                                        style: KprodectnameText.copyWith(
                                          fontSize: 16,
                                            color:
                                                KsecondaryColor), // Styled product name
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "Unavailable",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize:
                                                13), // Styled unavailable text
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 10),

                                  // Buttons wrapped in Row
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .start, // Align buttons to the start (left)
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 110,
                                        decoration: BoxDecoration(
                                          color: Colors.green[100],
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(width: 5),
                                            Text("Add to Cart"),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          color: Colors.green[100],
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: const Icon(
                                          Icons.arrow_right,
                                          color: Colors.green,
                                        ),
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 0),
                                      ),
                                    ],
                                  ),
                                ],
                              ));
                        }

                        return Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    product["image"][0]["url"],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(product["title"],
                                        style: KprodectnameText),
                                    const SizedBox(height: 3),
                                    Row(
                                      children: [
                                        Text(
                                          "\$${product["discountPrice"]}",
                                          style: KpriceText.copyWith(
                                              color: KsecondaryColor),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          "MRP \$${product["price"]}",
                                          style: TextStyle(
                                              fontSize: 13,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 20,
                                    width: 110,
                                    decoration: BoxDecoration(
                                      color: Colors.green[100],
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(width: 5),
                                        Text("Add to Cart"),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      color: Colors.green[100],
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Icon(
                                      Icons.arrow_right,
                                      color: Colors.green,
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
        ),
      ],
    );
  }
}
