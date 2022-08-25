import 'dart:async';

class CounterBloc{
  int _counter = 0;
  //
  // StreamController<String> _inputController = StreamController<String>.broadcast();
  // StreamController<int> _inputController = BehaviorSubject();
  StreamController _inputController = StreamController();
  //selang penghubung input
  StreamSink get inputan => _inputController.sink;

  StreamController _outputController = StreamController();
  //selang penghubung output
  StreamSink get _sinkOut => _outputController.sink;

  Stream get output => _outputController.stream;

  CounterBloc(){
    _inputController.stream.listen((event) {
      if(event == 'add'){
        _counter++;
      }else{
        _counter--;
      }
      _sinkOut.add(_counter);
    });
  }
  void dispose(){
    _inputController.close();
    _outputController.close();
  }
}