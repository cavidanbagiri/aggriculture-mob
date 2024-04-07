import 'package:client_mob/main.dart';
import 'package:client_mob/models/countries_model.dart';
import 'package:client_mob/screens/home/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:client_mob/services/product_service.dart';

class ProductView extends ConsumerStatefulWidget {
  const ProductView({super.key});

  @override
  ConsumerState<ProductView> createState() => _AddNewProductViewState();
}

class _AddNewProductViewState extends ConsumerState<ProductView> {
  final TextEditingController product_name_controller = TextEditingController();
  final TextEditingController amount_controller = TextEditingController();
  final TextEditingController price_controller = TextEditingController();
  final TextEditingController comment_controller = TextEditingController();


  static const categoryId = 1;
  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<CountriesModel>> countries = ref.watch(countriesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New product'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Center(
                  child: Text('Add Product'),
                ),
                Center(
                  child: countries.when(
                    data: (data) {
                      // return Column(
                      //   children: data.map((e){
                      //     return Text(e.country_name);
                      //   }).toList(),
                      // );
                      return DropdownButton(
                        value: ref.watch(countryValueProvider),
                        items: data.map((e) =>
                          DropdownMenuItem(child: Text(e.country_name),value: e.id,)).toList(),
                        onChanged: (value) {
                          // print('value is $value');
                          ref.read(countryValueProvider.notifier).state = value!;
                        },
                      );
                    },
                    error: (error, stackTrace) {
                      return Text(stackTrace.toString());
                    },
                    loading: () {
                      return const CircularProgressIndicator();
                    },
                  ),
                ),
                CustomTextField(
                  entering_controller: product_name_controller,
                  label_text: 'Product Name',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomTextField(
                      entering_controller: amount_controller,
                      label_text: 'Amount',
                    ),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width * 0.4,
                    //   child: TextField(
                    //     controller: num_controller,
                    //     decoration: InputDecoration(
                    //       labelText: 'Nums',
                    //       // prefixIcon: Icon(Icons.numbers),
                    //       filled: true,
                    //       fillColor: Color.fromARGB(255, 248, 247, 247),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //         borderSide: const BorderSide(color: Colors.purple),
                    //       ),
                    //       enabledBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //         borderSide: const BorderSide(
                    //             color: Color.fromARGB(255, 230, 226, 226)),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: DropdownButton(
                        value: ref.watch(unitProvider),
                        items: const [
                          DropdownMenuItem(
                            value: 'Kg',
                            child: Text('Kg'),
                          ),
                          DropdownMenuItem(
                            value: 'Ton',
                            child: Text('Ton'),
                          ),
                          DropdownMenuItem(
                            value: 'Pcs',
                            child: Text('Pcs'),
                          ),
                        ],
                        onChanged: (value) {
                          ref.read(unitProvider.notifier).state = value!;
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    CustomTextField(
                      entering_controller: price_controller,
                      label_text: 'Price',
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: DropdownButton(
                        value: ref.watch(priceProvider),
                        items: const [
                          DropdownMenuItem(
                            value: 'Rub',
                            child: Text('Rub'),
                          ),
                          DropdownMenuItem(
                            value: 'USD',
                            child: Text('USD'),
                          ),
                          DropdownMenuItem(
                            value: 'EURO',
                            child: Text('EURO'),
                          ),
                        ],
                        onChanged: (value) {
                          ref.read(priceProvider.notifier).state = value!;
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: comment_controller,
                  minLines: 6,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                    labelText: 'Enter text',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    final Map<String, dynamic> data = {
                      "product_name": product_name_controller.text,
                      "amount": amount_controller.text,
                      "unit": ref.watch(unitProvider),
                      "price": price_controller.text,
                      "currency": ref.watch(priceProvider),
                      "comment": comment_controller.text,
                      "categoryId": categoryId,
                      "countryId": ref.watch(countryValueProvider),
                    };
                    ProductService.addProduct(context, data);
                  },
                  child: Text('Post'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
