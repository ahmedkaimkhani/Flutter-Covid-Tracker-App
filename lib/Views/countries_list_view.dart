import 'package:covid_tracker/Services/state_services.dart';
import 'package:covid_tracker/Views/detail_view.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListView extends StatefulWidget {
  const CountriesListView({super.key});

  @override
  State<CountriesListView> createState() => _CountriesListViewState();
}

class _CountriesListViewState extends State<CountriesListView> {
  StateServices stateServices = StateServices();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                    hintText: 'Search with country name',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: stateServices.countriesListApi(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<dynamic>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade800,
                        highlightColor: Colors.grey.shade100,
                        child: ListView.builder(
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Container(
                                  height: 10,
                                  width: 90,
                                  color: Colors.white,
                                ),
                                subtitle: Container(
                                  height: 10,
                                  width: 90,
                                  color: Colors.white,
                                ),
                                leading: Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.white,
                                ),
                              );
                            }),
                      );
                    } else if (snapshot.hasError) {
                      print("Error: ${snapshot.error}");
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            String name = snapshot.data![index]['country'];

                            if (searchController.text.isEmpty) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailView(
                                            name: snapshot.data![index]
                                                ['country'],
                                            image: snapshot.data![index]
                                                ['flag'],
                                            totalCases: snapshot.data![index]
                                                ['infected'],
                                            tested: snapshot.data![index]
                                                ['tested'],
                                            recovered: snapshot.data![index]
                                                ['recovered'],
                                            deceased: snapshot.data![index]
                                                ['deceased'],
                                          ),
                                        )),
                                    child: ListTile(
                                      title: Text(
                                          snapshot.data![index]['country']),
                                      subtitle: Text(snapshot.data![index]
                                              ['infected']
                                          .toString()),
                                      leading: Image(
                                        height: 50,
                                        width: 50,
                                        image: NetworkImage(snapshot
                                            .data![index]['flag']
                                            .toString()),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            } else if (name.toLowerCase().contains(
                                searchController.text.toLowerCase())) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailView(
                                            name: snapshot.data![index]
                                                ['country'],
                                            image: snapshot.data![index]
                                                ['flag'],
                                            totalCases: snapshot.data![index]
                                                ['infected'],
                                            tested: snapshot.data![index]
                                                ['tested'],
                                            recovered: snapshot.data![index]
                                                ['recovered'],
                                            deceased: snapshot.data![index]
                                                ['deceased'],
                                          ),
                                        )),
                                    child: ListTile(
                                      title: Text(
                                          snapshot.data![index]['country']),
                                      subtitle: Text(snapshot.data![index]
                                              ['infected']
                                          .toString()),
                                      leading: Image(
                                        height: 50,
                                        width: 50,
                                        image: NetworkImage(snapshot
                                            .data![index]['flag']
                                            .toString()),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Container();
                            }
                          });
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
