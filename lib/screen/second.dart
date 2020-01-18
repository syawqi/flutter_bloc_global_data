import 'package:blocstate/bloc/bloc.dart';
import 'package:blocstate/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({Key key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  CounterBloc _counterBloc;
  @override
  void initState() {
    _counterBloc = CounterBloc();

    _counterBloc.add(GetCounter());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
          Navigator.pop(context);
        },),
        centerTitle: false,
        title: Text("Second Screen"),
      ),
      body: BlocProvider(
        create: (context) => _counterBloc,
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if (state is GetStateData) {
              return Center(
                child: Text(state.data.toString(), style: TextStyle(fontSize: 50),),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
