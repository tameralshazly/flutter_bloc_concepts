import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/business_logic/cubit/counter_cubit.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key, required this.title, required this.color});
  final String title;
  final Color color;

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                // if (state.wasIncremented == true) {
                //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                //     content: Text("Incremented"),
                //     duration: Duration(milliseconds: 300),
                //   ));
                // } else if (state.wasIncremented == false) {
                //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                //     content: Text("Decremented"),
                //     duration: Duration(milliseconds: 300),
                //   ));
                // }
              },
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    'Brr, Negative ${state.counterValue.toString()}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                    'Yaaay ${state.counterValue.toString()}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else if (state.counterValue == 5) {
                  return Text(
                    'Hmm, Number ${state.counterValue.toString()}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else {
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
              },
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            MaterialButton(
              color: Colors.blueAccent,
              child: const Text(
                'Go to Home screen',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/');
              },
            ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              color: Colors.redAccent,
              onPressed: () {
                Navigator.of(context).pushNamed('/SecondScreen');
              },
              child: const Text(
                'Go to Second screen',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
