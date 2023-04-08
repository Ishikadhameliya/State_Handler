import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';
import '../../providers/theme_provider.dart';
import '../../res/modals/product_modal.dart';

class cart_page extends StatefulWidget {
  const cart_page({Key? key}) : super(key: key);

  @override
  State<cart_page> createState() => _cart_pageState();
}

class _cart_pageState extends State<cart_page> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Cart page"), centerTitle: true, actions: [
        Switch(
            value: Provider.of<ThemeProvider>(context).isdrk,
            onChanged: (val) {
              Provider.of<ThemeProvider>(context, listen: false).changeTheme();
            })
      ]),
      body: Column(
        children: [
          Expanded(
              flex: 12,
              child: ListView.builder(
                  itemCount: Provider.of<CartProvider>(context).allcart.length,
                  itemBuilder: (contecxt, i) {
                    Product product =
                    Provider.of<CartProvider>(context).allcart[i];
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Card(
                        elevation: 3,
                        child: Container(
                          height: _height * 0.20,
                          width: _width,
                          decoration: BoxDecoration(
                              color: Colors.green.shade200,
                              border: Border.all(
                                  color: Colors.green.shade300,
                                  style: BorderStyle.solid,
                                  width: 5),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 5,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        product.image,
                                        height: _height * 0.15,
                                      ),
                                      // SizedBox(height: _height * 0.01),
                                      Text(
                                        product.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      )
                                    ],
                                  ),),
                              Expanded(
                                  flex: 5,
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                Provider.of<CartProvider>(
                                                    context,
                                                    listen: false)
                                                    .Countpluse(
                                                    product: product);
                                              },
                                              child: Container(
                                                height: 45,
                                                width: 45,
                                                decoration: BoxDecoration(
                                                    color: Colors.green.shade400,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        15),
                                                    border: Border.all(
                                                        color: Colors.green.shade400,
                                                        width: 5)),
                                                alignment: Alignment.center,
                                                child: const Text(
                                                  "+",
                                                  style:
                                                  const TextStyle(fontSize: 30),
                                                ),
                                              ),),
                                          SizedBox(width: _width * 0.01),
                                          Text(
                                            "${product.quantity}",
                                            style: const TextStyle(fontSize: 20),
                                          ),
                                          SizedBox(width: _width * 0.01),
                                          InkWell(
                                            onTap: () {
                                              Provider.of<CartProvider>(context,
                                                  listen: false)
                                                  .CountdecrementAndRemove(
                                                  product: product);
                                            },
                                            child: Container(
                                              height: 45,
                                              width: 45,
                                              decoration: BoxDecoration(
                                                  color: Colors.green.shade400,
                                                  borderRadius:
                                                  BorderRadius.circular(15),
                                                  border: Border.all(
                                                      color: Colors.green.shade400,
                                                      width: 5)),
                                              alignment: Alignment.center,
                                              child: const Text(
                                                "-",
                                                style: const TextStyle(fontSize: 30),
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                Provider.of<CartProvider>(
                                                    context,
                                                    listen: false)
                                                    .RemoveFromCart(
                                                    product: product);
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.red.shade400,
                                              ))
                                        ],
                                      ),
                                      Text(
                                        "Price : ${product.price}",
                                        style: const TextStyle(fontSize: 20),
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ),
                    );
                  })),
          Expanded(
              flex: 3,
              child: Container(
                width: _width,
                color: Colors.green.shade300,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: _height * 0.02),
                    Text(
                      "Total Product : ${Provider.of<CartProvider>(context).allProduct}",
                      style:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: _height * 0.05),
                    Text(
                      "Total Price : ${Provider.of<CartProvider>(context).totalPrice}",
                      style:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}