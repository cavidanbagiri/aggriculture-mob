import 'package:client_mob/main.dart';
import 'package:client_mob/models/fruveg_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewProductView extends ConsumerStatefulWidget {
  const AddNewProductView({super.key});

  @override
  ConsumerState<AddNewProductView> createState() => _AddNewProductViewState();
}

class _AddNewProductViewState extends ConsumerState<AddNewProductView> {
  @override
  Widget build(BuildContext context) {
    // final AsyncValue<List<FruVegModel>> fruveg = ref.watch(fruvegProvider(context));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New product'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: Text('Add Product'),
              ),
              // fruveg.when(
              //   data: (data) {
              //     return DropdownButton(
              //       value: ref.watch(fruvegvalueProvider),
              //       items: data
              //           .map(
              //             (e) => DropdownMenuItem(
              //               value: e.id,
              //               child: Text(e.name),
              //             ),
              //           )
              //           .toList(),
              //       onChanged: (value) {
              //         ref.read(fruvegvalueProvider.notifier).state = value!;
              //       },
              //     );
              //   },
              //   error: (error, stackTrace) {
              //     return Text(stackTrace.toString());
              //   },
              //   loading: () {
              //     return const CircularProgressIndicator();
              //   },
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextField(
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
                    child: DropdownButton(
                      value: 'Kg',
                      items: [
                        DropdownMenuItem(child: Text('Kg'), value: 'Kg',),
                        DropdownMenuItem(child: Text('Ton'), value: 'Ton',),
                        DropdownMenuItem(child: Text('Pcs'), value: 'Pcs',),
                      ],
                      onChanged: (value) {
                        print('Hello world');
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
