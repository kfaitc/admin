import 'package:flutter/material.dart';
import 'package:kfa_admin/interface/mobile/navigate_home/User/use_vpoint.dart';

typedef OnChangeCallback = void Function(dynamic value);

class CustomSearchDelegate extends SearchDelegate {
  final List itemList;
  // final OnChangeCallback list;
  final OnChangeCallback index_back;

  CustomSearchDelegate(
      this.itemList,
      //  this.list,
      this.index_back);

  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions for the search bar (e.g., clear query button).
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Leading icon on the left side of the search bar.
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Build the search results based on the query.
    final results = itemList
        .where((item) => item['id_user_control'].toString().contains(query))
        .toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]['id_user_control'].toString()),
          onTap: () {
            // You can handle item selection here.
            // list(results[index]['id_user_control'].toString());
            close(context, results[index]['id_user_control'].toString());
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Suggestions that appear while typing in the search bar.
    List suggestionList = itemList
        .where((item) => item['id_user_control'].toString().startsWith(query))
        .toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]['id_user_control'].toString()),
          onTap: () {
            query = suggestionList[index]['id_user_control'].toString();
            index_back(index);
            Navigator.pop(context);
            print('Back');
          },
        );
      },
    );
  }
}
