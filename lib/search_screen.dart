import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = new TextEditingController();
  int numberText = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }


  @override
  Widget build(BuildContext context) {


    final List<String> searches = [
      'Albany',
      'Amsterdam',
      'Batavia',
      'Buffalo',
      'Corland',
      'Cohoes',
      'Fulton',
      'Geneva',
      'Kingston',
      'Lockport',
      'New York',
      'New Rochelle',
      'Norwich',
      'Rome',
      'Troy',
      'White Plains',
      'Salamanca',
      'Port Jervis'
    ];

    List<String> recentSearch = [
      'Geneva',
      'Kingston',
      'Lockport',
      'New York',
    ];
    final List<String> suggestList = numberText == 0 ? recentSearch : searches;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 44,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
                    child: InkWell(
                      customBorder: CircleBorder(),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.arrow_back, size: 28),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                      const EdgeInsets.only(top: 10, right: 12),
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          TextField(
                            controller: controller,
                            onChanged: (text) {
                              setState(() {
                                numberText = text.length;
                              });
                            },
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                                fillColor: Colors.grey[100],
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                hintText: 'Search',
                                hintStyle: TextStyle(color: Colors.grey[500])),
                          ),
                          numberText != 0
                              ? Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () {
                                print('clear');
                              },
                              child: Icon(Icons.clear),
                            ),
                          )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 6),
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.grey[300], width: 1),
                      bottom: BorderSide(color: Colors.grey[300], width: 1))
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recent', style: TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w700),),
                  Text('EDIT', style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(0.6)),)
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: suggestList.length,
                  itemBuilder: (context, index){
                  return ListTile(
                    onTap: (){},
                    leading: Icon(Icons.search),
                    title: Text(suggestList[index]),
                    trailing: InkWell(
                      onTap: (){
                        print('clear');
                      },
                      child: Icon(Icons.clear),
                    )
                  );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
