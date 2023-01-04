import 'package:flutter/material.dart';

class TravelPage extends StatelessWidget {
  const TravelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        title: Text('travel app'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            children: [
              Expanded(
                child: CardDiscripton(
                  title: 'Distance',
                  description: '7km',
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: CardDiscripton(
                  title: 'Distance',
                  description: '7km',
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: CardDiscripton(
                  title: 'Distance',
                  description: '7km',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Discription',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                    'This is an grate place to visit, be sure that before resveravtion call the reseption for mor info call this')
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Total Price'),
                    Text('\$1200'),
                  ],
                ),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }

  // _appbar() {
  //   AppBar(
  //     title: Text(
  //       'Travel APP',
  //       style: TextStyle(color: Colors.black),
  //     ),
  //   );
  // }
}

class CardDiscripton extends StatelessWidget {
  CardDiscripton({
    required this.description,
    required this.title,
    super.key,
  });
  String title;
  String description;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: Colors.black12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 11,
            ),
          ),
          Text(
            description,
            style: const TextStyle(
              color: Colors.cyan,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
