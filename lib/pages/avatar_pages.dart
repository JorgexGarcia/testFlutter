import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatares'),
        actions: [
          Container(
            padding: const EdgeInsets.all(5),
            child: const CircleAvatar(
              backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Sobo_1909_260.png/490px-Sobo_1909_260.png'),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/');
              },
              child: const CircleAvatar(
                backgroundColor: Colors.deepPurple,
                child: Text('JGG'),
              ),
            ),
          )
        ],
      ),
      body: const Center(
        child: FadeInImage(
          image: NetworkImage('https://www.trecebits.com/wp-content/uploads/2018/08/logo_one_icon.0-1-1.jpg'),
          fadeInDuration: Duration(seconds: 2),
          fadeInCurve: Curves.fastLinearToSlowEaseIn,
          placeholder: AssetImage('assets/loading.gif'),
        ),
      ),
    );
  }
}
