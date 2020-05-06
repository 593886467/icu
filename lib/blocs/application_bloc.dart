
import 'bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class ApplicationBloc implements BlocBase {
  BehaviorSubject<int> _appEvent = BehaviorSubject<int>();

  Sink<int> get _appEventSink => _appEvent.sink;

  Stream<int> get appEventStream => _appEvent.stream;

  @override
  void dispose() {
    _appEvent.close();
  }

  @override
  Future getData({data}) {
    // TODO: implement getData
    return null;
  }

  @override
  Future onLoadMore({data}) {
    // TODO: implement onLoadMore
    return null;
  }

  @override
  Future onRefresh({data}) {
    // TODO: implement onRefresh
    return null;
  }

  void sendAppEvent(int type) {
    _appEventSink.add(type);
  }
}
