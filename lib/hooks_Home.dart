import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeView extends HookWidget {
  @override
  Widget build(BuildContext context) {

    // useState() ==state management ==statfullWidget ,
//************** بيتخليك تحتفظ بالداتا وتقدر تعمل ريبلد من غير متستخدم ستات مانجمينت*******************************
    // in this example we not use setState() to change the state of widget ,Flutter_hooks do this
    final count = useState(1);



    // useEffect() ==(inialState() $ dispose()  )
    useEffect((){
         print('intialState ');
            final timer= Timer.periodic(Duration(seconds:1), (timer) {
           //   count.value=timer.tick;


            });
                print("Timer is :"+ timer.tick.toString());
          return timer.cancel;


    },[]);


    void countIncrement() {
      count.value++;
    }

    void resetCount() {
      count.value = 0;
    }
    void counterDecrease(){
      count.value--;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter_hooks package"),
        elevation: 1,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "hello hooks count: ${count.value.toString()}",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              IconButton(onPressed:
              countIncrement
                  , icon:Icon( Icons.add)),
              TextButton(
                onPressed: resetCount,
                child: Text(
                  "reset",
                  style: TextStyle(color: Colors.blue
                  ,fontSize: 20),
                ),
              ),
              IconButton(onPressed:
              counterDecrease
                  , icon:Icon( Icons.indeterminate_check_box_outlined)),


            ],
          ),


          // this button to know that the useEffect() work like dispose()
          TextButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ScondWidget()));
    },
            child: Text(
              "Click to Navigator",
              style: TextStyle(color: Theme.of(context).errorColor,
              fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
class ScondWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:      TextButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeView()));
          },
          child: Center(
            child: Text(
              "Click to BacK",
              style: TextStyle(color: Theme.of(context).errorColor
              ,fontSize: 30),
            ),
          ),
        ),
        
      ),
    );
  }
}
