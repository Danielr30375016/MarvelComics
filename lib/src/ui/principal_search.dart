import 'package:flutter/material.dart';

import '../../models/model.dart';
import '../api/remote_service.dart';

class PrincipalSearch extends StatefulWidget {
  const PrincipalSearch({Key key}) : super(key: key);

  @override
  State<PrincipalSearch> createState() => _PrincipalSearchState();
}

class _PrincipalSearchState extends State<PrincipalSearch> {
  List<Post> posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    //Fetch data from API
    getData();
  }

  getData() async {
    posts = (await RemoteService().getPosts());
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _bodyPrincipalSearch(context: context);
  }

  Widget _bodyPrincipalSearch({BuildContext context}) {
    return Visibility(
      visible: isLoaded,
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
      child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[300]),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${posts[index].title}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${posts[index].body ?? ''}",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
