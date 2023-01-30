import 'package:apiapp/model2/productdetail.dart';
import 'package:apiapp/model2/productmodel.dart';
import 'package:apiapp/model2/service.dart';
import 'package:flutter/material.dart';

class SecondBody extends StatefulWidget {
  const SecondBody({Key? key}) : super(key: key);

  @override
  State<SecondBody> createState() => _SecondBodyState();
}

class _SecondBodyState extends State<SecondBody> {
  late final ProductModel? model;
  bool _loading = true;

  @override
  void initState() {

    ProductService().makeCall().then((value) {
      model = value;
    }).then((value){
      setState(() {
        _loading = false;
      });
    }
    );


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SECOND API REQUEST'),
      ),
      body: (_loading) ? const Center(child: CircularProgressIndicator()):
      ListView.builder(
        itemCount: model?.limit ?? 0,
        itemBuilder: (context, index){
          return ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(myproduct: model?.products[index]),));
            },
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(model?.products[index].images[0] ?? "")
                )
              ),
            ),
            title: Text(model?.products[index].title ?? ""),
            subtitle: Text(model?.products[index].brand ?? ""),
            trailing: Text("\$${model?.products[index].price.toString() ?? ""}"),
          );
        },
      )
      ,
    );
  }
}
