import 'package:client_mob/main.dart';
import 'package:client_mob/models/fruveg_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _AddNewProductViewState();
}

class _AddNewProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController num_controller = TextEditingController();
    final TextEditingController comment_controller = TextEditingController();
    final cavidanProvider = StateProvider<String>((ref) => 'Kg');

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextField(
                        controller: num_controller,
                        decoration: InputDecoration(
                          labelText: 'Nums',
                          // prefixIcon: Icon(Icons.numbers),
                          filled: true,
                          fillColor: Color.fromARGB(255, 248, 247, 247),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.purple),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 230, 226, 226)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Consumer(
                        builder: (context, ref, child) {
                          return DropdownButton(
                            value: ref.watch(cavidanProvider),
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
                              ref.read(cavidanProvider.notifier).state = value!;
                            },
                          );
                        },
                        // child: DropdownButton(
                        //   value: ref.watch(unitProvider),
                        //   items: const [
                        //     DropdownMenuItem(
                        //       value: 'Kg',
                        //       child: Text('Kg'),
                        //     ),
                        //     DropdownMenuItem(
                        //       value: 'Ton',
                        //       child: Text('Ton'),
                        //     ),
                        //     DropdownMenuItem(
                        //       value: 'Pcs',
                        //       child: Text('Pcs'),
                        //     ),
                        //   ],
                        //   onChanged: (value) {
                        //     ref.read(unitProvider.notifier).state = value!;
                        //   },
                        // ),
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
                    print(comment_controller.text);
                    print(num_controller.text);
                    // print(ref.watch(unitProvider));
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
