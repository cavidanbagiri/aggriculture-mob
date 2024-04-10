import 'dart:io';
import 'dart:typed_data';

import 'package:client_mob/main.dart';
import 'package:client_mob/models/countries_model.dart';
import 'package:client_mob/screens/home/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:client_mob/services/product_service.dart';
import 'package:image_picker/image_picker.dart';

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
  File? selected_file;
  // This is always will be 1, because it comes from first category
  static const categoryId = 1;

  // pickImage(ImageSource source) async {
  //   final ImagePicker _imagePicker = ImagePicker();
  //   var file = await _imagePicker.pickImage(source: source);
  //   if (file != null) {
  //     File? selected_file = File(file.path);
  //     ProductService.uploadImage(selected_file);
  //   }
  // }
  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    var file = await _imagePicker.pickImage(source: source);
    if (file != null) {
      selected_file = File(file.path);
      // ProductService.uploadImage(selected_file);
      //return selected_file;
    }
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<CountriesModel>> countries =
        ref.watch(countriesProvider);
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
                ElevatedButton(
                    onPressed: () async {
                      await pickImage(ImageSource.gallery);
                    },
                    child: Text('Select Image')),
                Center(
                  child: countries.when(
                    data: (data) {
                      return DropdownButton(
                        value: ref.watch(countryValueProvider),
                        items: data
                            .map((e) => DropdownMenuItem(
                                  child: Text(e.country_name),
                                  value: e.id,
                                ))
                            .toList(),
                        onChanged: (value) {
                          // int some = int.parse(value!);
                          // print('value is $value');
                          ref.read(countryValueProvider.notifier).state =
                              value!;
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
                    // ProductService.addProduct(context, data);
                    if(selected_file == null){
                    }
                    else{
                      // ProductService.uploadImage(selected_file!, data);
                    ProductService.addProduct(context, data, selected_file!);
                    }
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
