import 'dart:math';

import 'package:flutter/material.dart';

class addLoadingPage extends StatefulWidget {
  const addLoadingPage({super.key});

  @override
  State<addLoadingPage> createState() => _addLoadingPageState();
}

class _addLoadingPageState extends State<addLoadingPage> {
  List<Person>? personList;
  ScrollController scrollController = ScrollController();
  bool isLoading = true;
  bool isBottomLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    scrollController.addListener(() async {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        isBottomLoading = true;
        setState(() {});
        print("------------加载更多-------------");
        await Future.delayed(Duration(milliseconds: 300));
        addMoreList();
        isBottomLoading = false;
        setState(() {});
      }
    });
  }

  getData() async {
    //api getData
    await Future.delayed(Duration(seconds: 1));
    listRefresh();
    isLoading = false;
    setState(() {});
  }

  listRefresh() {
    personList = List.generate(
      30,
      (index) => Person(index, getRandomName(), getRandomCountry(), Random().nextInt(2)),
    );
  }

  addMore() {
    personList!.add(Person(personList!.length - 1, getRandomName(), getRandomCountry(), Random().nextInt(2)));
  }

  addMoreList() {
    personList!.addAll(List.generate(5, (index) => Person(personList!.length + index - 1, getRandomName(), getRandomCountry(), Random().nextInt(2))));
  }

  onFresh() async {
    print('-------开始刷新------------');
    await Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        listRefresh();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('hello', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              color: Colors.white,
              child: RefreshIndicator(
                onRefresh: () => onFresh(),
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: personList!.length + 1,
                  itemBuilder: (context, index) {
                    if (personList!.length == index) {
                      return isBottomLoading ? LoadMoreView() : SizedBox(height: 50);
                    }
                    return ListTile(
                      title: Text(
                        personList![index].name,
                        style: TextStyle(color: Colors.blue),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}

class LoadMoreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Row(
            children: <Widget>[new CircularProgressIndicator(), Padding(padding: EdgeInsets.all(10)), Text('加载中...')],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
      color: Colors.white70,
    );
  }
}

String getRandomName() {
  List<String> names = [
    'Alice',
    'Bob',
    'Charlie',
    'David',
    'Eva',
    'Frank',
    'Grace',
    'Henry',
    'Ivy',
    'Jack',
  ];

  Random random = Random();
  int randomIndex = random.nextInt(names.length);

  return names[randomIndex];
}

String getRandomCountry() {
  List<String> countries = [
    'United States',
    'Canada',
    'United Kingdom',
    'Germany',
    'France',
    'Japan',
    'Australia',
    'Brazil',
    'India',
    'China',
  ];

  Random random = Random();
  int randomIndex = random.nextInt(countries.length);

  return countries[randomIndex];
}

class Person {
  int id;
  String name;
  String country;
  int gender;
  Person(this.id, this.name, this.country, this.gender);
}
