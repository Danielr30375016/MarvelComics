import 'package:flutter/material.dart';
import 'package:marvel/src/ui/principal_search.dart';


class NewSearchBanner extends StatefulWidget {
  const NewSearchBanner({Key key}) : super(key: key);

  @override
  State<NewSearchBanner> createState() => _NewSearchBannerState();
}

class _NewSearchBannerState extends State<NewSearchBanner> {
  var search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return _bodyNewSearch();
  }

  Widget _bodyNewSearch() {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Buscar...",
                hintStyle: const TextStyle(color: Colors.white),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                    });
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                )),
            style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
        ),
      ],
    );
  }
}
