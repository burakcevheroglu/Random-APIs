import 'package:apiapp/model2/productmodel.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key, required this.myproduct}) : super(key: key);

  final Product? myproduct;


  @override
  Widget build(BuildContext context) {
    const snackBar2 = SnackBar(
      content: Text('No It cannot cancel'),
    );

    final snackBar = SnackBar(
      content: const Text('It will be delivered in 2 days!'),
      action: SnackBarAction(
        label: "Don't buy!",
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(snackBar2);
        },
      ),
    );



    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(myproduct?.brand ?? "null"),
          actions: [
            Text("%${myproduct?.discountPercentage.toString() ?? ""} OFF",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.red),),
            const SizedBox(width: 10,),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                  myproduct?.images[0] ?? ""),
                              fit: BoxFit.cover,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Title',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            myproduct?.category ?? "",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16,color: Colors.grey),
                          ),
                        ],
                      ),
                      Text(myproduct?.title ?? "null"),
                      const SizedBox(height: 20,),
                      const Text(
                        'Description',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(width:double.infinity,height:100,child: Text(myproduct?.description ?? "null")),
                      const SizedBox(height: 20,),
                      const Text(
                        'Images',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: double.infinity,
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: myproduct?.images.length ?? 0,
                          itemBuilder: (context, index){
                            return Container(
                              margin: const EdgeInsets.only(right: 20),
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage(myproduct?.images[index] ?? ""),
                                  fit: BoxFit.cover,
                                )
                              ),
                            );
                          }
                        ),
                      ),
                      Expanded(child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: InkWell(
                          onTap: () => ScaffoldMessenger.of(context).showSnackBar(snackBar),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.orangeAccent,
                                  Colors.redAccent
                                ]
                              )
                            ),
                            child: Center(
                              child: Text('BUY IT FOR \$${myproduct?.price.toString() ?? ""}' ,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                            ),
                          ),
                        ),
                      ))

                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
