import 'package:arz/models/currency.dart';
import 'package:arz/models/network_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    await Provider.of<NetworkHelper>(context, listen: false).getCurrency();
  }

  @override
  Widget build(BuildContext context) {
    final proData = Provider.of<NetworkHelper>(context).currency;
    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text('This is Description about this site'),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(50)),
                width: double.infinity,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Crypto',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Price',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Changes',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 410,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: proData.length,
                    itemBuilder: (ctx, i) {
                      return SingelCryptoCard(
                        title: proData[i].title,
                        price: proData[i].price,
                        changes: proData[i].changes,
                      );
                    }),
              ),
              // SizedBox(height: ,)
              Container(
                margin: EdgeInsets.only(top: 20),
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.amber),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            padding: const EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        onPressed: () {
                          _showSnackBar(context, 'Updated');
                        },
                        icon: const Icon(CupertinoIcons.refresh),
                        label: const Text('Refresh')),
                    Text(
                        'Last update :${DateFormat.Hms().format(DateTime.now())}',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ),

              // Text('$_getTimeUpdate')
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 1),
      content: Text(
        msg,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Colors.white),
      ),
      backgroundColor: Colors.green,
    ));
  }

  // String _getTimeUpdate() {
  //   return DateFormat.Hms().format(DateTime.now());
  // }

  _appBar(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: Colors.white,
      leading: Image.asset(
        'assets/images/digital_wallet.jpg',
      ),
      title: Text(
        "Exchange",
        style: Theme.of(context).textTheme.titleLarge,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class SingelCryptoCard extends StatelessWidget {
  SingelCryptoCard({
    this.changes,
    this.price,
    this.title,
    super.key,
  });
  String? price;
  String? title;
  String? changes;
  Currency? currency;

  @override
  Widget build(BuildContext context) {
    final proData = Provider.of<NetworkHelper>(context, listen: false).currency;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: 1)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Text(
              title!,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              price!,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              changes!,
            ),
          ]),
        ),
      ),
    );
  }
}
