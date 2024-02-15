import 'package:covid_tracker/Views/world_states_view.dart';
import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {
  String name;
  String image;
  var totalCases, tested, recovered, deceased;
  DetailView({
    required this.name,
    required this.image,
    required this.totalCases,
    required this.tested,
    required this.recovered,
    required this.deceased,
  });

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .06,
                      ),
                      ReusableRow(title: 'Cases', value: widget.name),
                      ReusableRow(
                          title: 'Tested', value: widget.tested.toString()),
                      ReusableRow(
                          title: 'Recovered',
                          value: widget.recovered.toString()),
                      ReusableRow(
                          title: 'Deceased', value: widget.deceased.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          )
        ],
      ),
    );
  }
}
