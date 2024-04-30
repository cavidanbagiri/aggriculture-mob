import 'dart:io';

import 'package:client_mob/services/fruit_or_vegetables_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../main.dart';
import '../../../models/countries_model.dart';
import '../widgets/text_field.dart';

// Create an empty text image section provider, after selecting image, this text will change
final imageNameProvider = StateProvider<String?>((ref) {
  return null;
});

class FruitsOrVegetablesView extends ConsumerStatefulWidget {
  const FruitsOrVegetablesView({super.key});

  @override
  ConsumerState<FruitsOrVegetablesView> createState() => _SellFruitVegetableState();
}

class _SellFruitVegetableState extends ConsumerState<FruitsOrVegetablesView> {

  final TextEditingController fruit_or_vegetable_name_controller = TextEditingController();
  final TextEditingController fruit_or_vegetable_kind_controller = TextEditingController();
  final TextEditingController amount_controller = TextEditingController();
  final TextEditingController price_controller = TextEditingController();
  final TextEditingController comment_controller = TextEditingController();
  File? selected_file;
  // This is always will be 2, because it comes from first category
  static const categoryId = 2;

  Future pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    var file = await _imagePicker.pickImage(source: source);
    if (file != null) {
      //print('1 - ${ref.watch(imageNameProvider)}');
      selected_file = File(file.path);
      //print('selected file $selected_file');
      ref.read(imageNameProvider.notifier).state = 'One File Selected';
      //print('2 - ${ref.watch(imageNameProvider)}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<CountriesModel>> countries =
    ref.watch(countriesProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Sell Fruit Or Vegetables'),),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await pickImage(ImageSource.gallery);
                  },
                  child: const Text('Select Image'),
                ),
                Center(
                  child: ref.watch(imageNameProvider) == null
                      ? null
                      : Text('${ref.watch(imageNameProvider)}'),
                ),
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
                  entering_controller: fruit_or_vegetable_name_controller,
                  label_text: 'Fruit Or Vegetable Name',
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
                ElevatedButton(onPressed: () async{
                  final Map<String, dynamic> data = {
                    "name": fruit_or_vegetable_name_controller.text,
                    "kind": 'Note Specified',
                    "amount": amount_controller.text,
                    "unit": ref.watch(unitProvider),
                    "price": price_controller.text,
                    "currency": ref.watch(priceProvider),
                    "comment": comment_controller.text,
                    "categoryId": categoryId,
                    "countryId": ref.watch(countryValueProvider),
                  };
                  print('coming data : ');

                  if(selected_file == null){
                    await FruitOrVegetableService.addFruitOrVegetable(context, data);
                  }
                  else{
                    await FruitOrVegetableService.addProductWithImage(context, data, selected_file!);
                  }


                }, child: Text('Sell'),)
              ],
            ),
          )
        ),
      ),
    );
  }
}