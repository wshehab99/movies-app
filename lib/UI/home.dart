import 'package:api_task/model/api_services/api_services.dart';
import 'package:api_task/model/data/api.dart';
import 'package:api_task/model/data/constatnts.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    /*  getResult(); */
    return Scaffold(
      appBar: AppBar(
        title: Text('PopularMovies'),
      ),
      body: FutureBuilder<List<Result>>(
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Text('There is an error');
          else if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          else
            return GridView.builder(
                itemCount: snapshot.data!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 320),
                itemBuilder: (context, index) {
                  return Container(
                    height: 500,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Card(
                      elevation: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          _buildImage(index, snapshot),
                          _buildTextContent(index, snapshot)
                        ],
                      ),
                    ),
                  );
                });
        },
        future: ApiSrevices.getPage(),
      ),
    );
  }

  /* getResult() {
    try {
      ApiSrevices().getPage().then((value) {
        setState(() {
          if (value is Pages) _pages = value;
          if (value is PageError) _messege = value.success.toString();
        });
      });
    } catch (e) {
      setState(() {
        _messege = e.toString();
      });
    }
  } */

  Widget _buildImage(int index, AsyncSnapshot<List<Result>> snapshot) {
    return Image(
        fit: BoxFit.fill,
        image:
            NetworkImage(image + snapshot.data![index].poster_path.toString()));
  }

  _buildTextContent(int index, AsyncSnapshot<List<Result>> snapshot) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
          child: Text(
            snapshot.data![index].original_title.toString(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Text(snapshot.data![index].release_date!),
        Container(
          padding: EdgeInsets.only(left: 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                snapshot.data![index].vote_average!.toString(),
                style: TextStyle(fontSize: 18),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Icon(
                  Icons.star,
                  color: Colors.grey[500],
                  size: 15,
                ),
              ),
              SizedBox(
                width: 70,
              ),
              Container(
                child: IconButton(
                    alignment: Alignment.bottomRight,
                    onPressed: null,
                    icon: Icon(
                      snapshot.data![index].video!
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: 30,
                      color: Colors.red[800],
                    )),
              ),
            ],
          ),
        )
      ],
    );
  }
}
