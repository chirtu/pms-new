import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class StockAdd extends StatefulWidget {
  const StockAdd({super.key});

  @override
  State<StockAdd> createState() => _StockAddState();
}

class _StockAddState extends State<StockAdd> {
  TextEditingController _controller = TextEditingController();
  String _selectedType = 'Food';
  bool isFood = false;
  bool _isUploading = false;
  bool _isPicked = false;
  File? _image;
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _isUploading = true;
        _isPicked = true;
      });

      // Simulate a delay for uploading the image
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isUploading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Add Stock'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).primaryColor.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: Center(
                      child: Text(
                        'Select The item Type',
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.4),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio<String>(
                              value: 'Option 1',
                              groupValue: _selectedType,
                              onChanged: (String? value) {
                                setState(() {
                                  isFood = true;
                                  _selectedType = value!;
                                });
                              },
                            ),
                            Text(
                              'Food',
                              style: TextStyle(
                                  color: isFood
                                      ? Theme.of(context).colorScheme.primary
                                      : Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.4),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio<String>(
                              value: 'Option 2',
                              groupValue: _selectedType,
                              onChanged: (String? value) {
                                setState(() {
                                  isFood = false;
                                  _selectedType = value!;
                                });
                              },
                            ),
                            Text(
                              'Drinks',
                              style: TextStyle(
                                  color: !isFood
                                      ? Theme.of(context).colorScheme.primary
                                      : Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text("Name"),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: CupertinoTextField(
                          placeholder:
                              isFood ? 'Enter Food Name' : 'Enter Drink Name',
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            // color: CupertinoColors.systemGrey6,
                            borderRadius: BorderRadius.circular(10.0),
                            // border: Border.all(
                            //   color: CupertinoColors.systemGrey,
                            //   width: 1.0,
                            // ),
                          ),
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: CupertinoColors.black,
                          ),
                          placeholderStyle: const TextStyle(
                            color: CupertinoColors.systemGrey,
                            fontSize: 10.0,
                          ),
                          prefix: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              CupertinoIcons.pencil,
                              color: CupertinoColors.systemGrey,
                            ),
                          ),
                          suffix: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              CupertinoIcons.clear_thick_circled,
                              color: CupertinoColors.systemGrey,
                            ),
                          ),
                          cursorColor: CupertinoColors.activeBlue,
                          clearButtonMode: OverlayVisibilityMode.editing,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
              const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text("Price"),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: CupertinoTextField(
                      placeholder:
                          isFood ? 'Enter Food Price' : 'Enter Drink price',
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        // color: CupertinoColors.systemGrey6,
                        borderRadius: BorderRadius.circular(10.0),
                        // border: Border.all(
                        //   color: CupertinoColors.systemGrey,
                        //   width: 1.0,
                        // ),
                      ),
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: CupertinoColors.black,
                      ),
                      placeholderStyle: const TextStyle(
                        color: CupertinoColors.systemGrey,
                        fontSize: 10.0,
                      ),
                      prefix: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          CupertinoIcons.pencil,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                      cursorColor: CupertinoColors.activeBlue,
                      clearButtonMode: OverlayVisibilityMode.editing,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),
            isFood
                ? Column(
                    children: [
                      Text("Food Description"),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.4),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: IntrinsicHeight(
                            child: CupertinoTextField(
                              controller: _controller,
                              placeholder: 'Enter Description',
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                // color: CupertinoColors.systemGrey6,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: CupertinoColors.systemGrey,
                                  width: 1.0,
                                ),
                              ),
                              style: const TextStyle(
                                fontSize: 18.0,
                                color: CupertinoColors.black,
                              ),
                              placeholderStyle: TextStyle(
                                color: Theme.of(context).colorScheme.surface,
                                fontSize: 10,
                              ),
                              cursorColor:
                                  Theme.of(context).colorScheme.primary,
                              clearButtonMode: OverlayVisibilityMode.editing,
                              maxLines: null,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Served With"),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.4),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: IntrinsicHeight(
                            child: CupertinoTextField(
                              controller: _controller,
                              placeholder: 'Served with Description',
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                // color: CupertinoColors.systemGrey6,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: CupertinoColors.systemGrey,
                                  width: 1.0,
                                ),
                              ),
                              style: const TextStyle(
                                fontSize: 18.0,
                                color: CupertinoColors.black,
                              ),
                              placeholderStyle: TextStyle(
                                color: Theme.of(context).colorScheme.surface,
                                fontSize: 10,
                              ),
                              cursorColor:
                                  Theme.of(context).colorScheme.primary,
                              clearButtonMode: OverlayVisibilityMode.editing,
                              maxLines: null,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox(
                    height: 10,
                  ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                // height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Theme.of(context).colorScheme.surface),
                      ),
                      height: 200,
                      width: MediaQuery.of(context).size.width / 2,
                      child: !_isPicked
                          ? const Icon(
                              Icons.add_a_photo_outlined,
                              size: 50,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                _image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    // SvgPicture.asset(
                    //   'assets/images/picture.svg',
                    //   fit: BoxFit.fill,
                    // ),

                    Text(
                      _isPicked
                          ? 'image Uploaded Successfully'
                          : 'Clich to select an Image.',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.surface,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
