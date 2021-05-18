import 'package:flutter/widgets.dart';
import 'package:quiz/app/fragments/base/fragment.dart';

// ignore: must_be_immutable
class BaseList extends StatefulWidget {
  _State _state;
  Fragment _fragment;
  ListView _listView;

  BaseList({Fragment fragment}) {
    _fragment = fragment;
  }

  @override
  // ignore: missing_return
  _State createState() {
    _state = _State(_fragment);
    _listView = _state.listView;

    return _state;
  }

  void update({Fragment fragment}) {
    this._fragment = fragment;

    if (_state == null) {
      return;
    }

    _state.fragment = fragment;

    // ignore: invalid_use_of_protected_member
    _state.setState(() {
      // This call to setState tells the Flutter framework that
      // something has changed in this State, which causes it to rerun
      // the build method below so that the display can reflect the
      // updated values. If you change _counter without calling
      // setState(), then the build method won't be called again,
      // and so nothing would appear to happen.
    });
  }

  get listView {
    return _listView;
  }
}

class _State extends State<BaseList> {
  Fragment fragment;
  ListView listView;

  _State(this.fragment);

  @override
  Widget build(BuildContext context) {
    listView = ListView.builder(
        itemCount: fragment.getListCount(),
        itemBuilder: (BuildContext context, int index) {
          return fragment.getListItem(index);
        }
    );

    return listView;
  }
}
