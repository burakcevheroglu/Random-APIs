import 'package:flutter/material.dart';
import 'service.dart';
import 'package:apiapp/model1/usermodel.dart';

class AppBody extends StatefulWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  bool _isLoading = true;
  UserModel? myUser;
  int _pageCount = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      ModelService().makeCall().then((value) {
        myUser = value;
        _pageCount = value?.perPage ?? 0;
        _isLoading=false;
      }).then((value){
        setState(() {

        });
        _isLoading = false;
      });
    });
    setState(() {

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: (_isLoading)
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _pageCount,
              itemBuilder: (context, index) {
              return ListTile(
                onTap: (){},
                leading: Container(width: 50,height:50,decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),image: DecorationImage(image: NetworkImage(myUser?.data[index].avatar ?? ""))),),
                title: Text("${myUser?.data[index].firstName ?? "AD"} ${myUser?.data[index].lastName ?? "SOYAD"}" ),
                subtitle: Text(myUser?.data[index].email ?? "email"),
                trailing: Text("id: ${myUser?.data[index].id}"),
              );
            }),
    );
  }
}
