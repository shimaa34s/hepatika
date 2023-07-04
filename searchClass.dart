import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/doctors.dart';
import '../screens/favourite.dart';
import '../screens/labs.dart';
class CustomSearchDelegate extends SearchDelegate {
// Demo list to show querying
  List<String> searchTerms = [
    "Lab",
    "doctor",
    "offers",
  ];
// first override to clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];}
// second override to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),);}
// third override to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var x in searchTerms) {
      if (x.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(x);}}
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Container(child: Text(result),)
        );},);}
// last override to show the querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var x in searchTerms) {
      if (x.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(x);}}
    return GetBuilder<AppLanguage>(
        init: AppLanguage(),
    builder: ((controller) => ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: InkWell(
              onTap: (){
                query=query=="" ? searchTerms[index]: matchQuery[index];
                showResults(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                query=="Lab".tr? Labs():query=="Doctors".tr?Doctors():FavDoc()));
              },
              child: Text(result,style: TextStyle(fontSize: 20)))
        );
      },
    )));
  }
}

