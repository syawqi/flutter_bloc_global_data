import 'package:blocstate/bloc/counter_bloc.dart';
import 'package:blocstate/bloc/counter_event.dart';
import 'package:blocstate/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({Key key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  CounterBloc _counterBloc;
  num counter;

  @override
  void initState() {
    _counterBloc = CounterBloc();
    counter = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("First Screen"),
      ),
      body: BlocProvider(
        create: (context) => _counterBloc,
        child: BlocListener<CounterBloc, CounterState>(
          listener: (context, state) {
            if(state is SetStateData)
            {
              setState(() {
                counter = state.data;
              });
            }
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  this.counter.toString(),
                  style: TextStyle(fontSize: 50),
                ),
                FlatButton(
                  onPressed: (){
                    _counterBloc.add(SetCounter(true));
                  },
                  child: Text(
                    "Increment",
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: (){
                    _counterBloc.add(SetCounter(false));
                  },
                  child: Text(
                    "Decrement",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: (){
                    Navigator.pushNamed(context, "/second");
                  },
                  child: Text(
                    "Check State",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
