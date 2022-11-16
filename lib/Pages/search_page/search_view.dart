import 'dart:developer';

import 'package:assistant_app_use_case/Pages/search_page/search_model.dart';
import 'package:assistant_app_use_case/Pages/search_page/search_viewmodel.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends SearchViewModel {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return SafeArea(
      // ignore: prefer_const_constructors
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                pinned: true,
                floating: true,
                title: Container(
                  decoration: const ShapeDecoration(
                    color: Colors.black,
                    shape: StadiumBorder(),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      hintText: "Search",
                      suffixIcon: (searcList?.isNotEmpty ?? false)
                          ? IconButton(
                              color: Colors.white,
                              onPressed: (() {
                                clearSearchList();
                              }),
                              icon: const Icon(Icons.clear_outlined),
                            )
                          : const SizedBox.shrink(),
                    ),
                    onChanged: (value) {
                      search(value);
                    },
                  ),
                ),
                actions: [
                  Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 49, 46, 45),
                      ),
                      child: IconButton(
                          focusColor: Colors.transparent,
                          onPressed: (() {
                            clearSearchList();
                          }),
                          icon: const Icon(Icons.clear))),
                ],
              ),
              SliverToBoxAdapter(
                child: (searcList?.isNotEmpty ?? false)
                    ? Padding(
                        padding: verticalPadding,
                        child: Center(child: Text("${searcList!.length.toString()} results found")),
                      )
                    : const SizedBox(),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                childCount: searcList?.length ?? 0,
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(searcList?[index].name ?? "null"),
                            Chip(label: Text(searcList?[index].type ?? "null")),
                            Text(searcList?[index].muscle ?? "null")
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
