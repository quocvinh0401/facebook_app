import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ShowHideContainer extends StatefulWidget {

  const ShowHideContainer({this.controller});
  final ScrollController controller;

  @override
  _ShowHideContainerState createState() => _ShowHideContainerState();
}

class _ShowHideContainerState extends State<ShowHideContainer> {

  static final _containerHeight = 100.0;

  // You don't need to change any of these variables
  var _fromTop = -_containerHeight;
  var _allowReverse = true, _allowForward = true;
  var _prevOffset = 0.0;
  var _prevForwardOffset = -_containerHeight;
  var _prevReverseOffset = 0.0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_listener);
  }

  // entire logic is inside this listener for ListView
  void _listener() {
    double offset = widget.controller.offset;
    var direction = widget.controller.position.userScrollDirection;

    if (direction == ScrollDirection.reverse) {
      _allowForward = true;
      if (_allowReverse) {
        _allowReverse = false;
        _prevOffset = offset;
        _prevForwardOffset = _fromTop;
      }

      var difference = offset - _prevOffset;
      _fromTop = _prevForwardOffset + difference;
      if (_fromTop > 0) _fromTop = 0;
    } else if (direction == ScrollDirection.forward) {
      _allowReverse = true;
      if (_allowForward) {
        _allowForward = false;
        _prevOffset = offset;
        _prevReverseOffset = _fromTop;
      }

      var difference = offset - _prevOffset;
      _fromTop = _prevReverseOffset + difference;
      if (_fromTop < -_containerHeight) _fromTop = -_containerHeight;
    }
    setState(() {}); // for simplicity I'm calling setState here, you can put bool values to only call setState when there is a genuine change in _fromTop
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _fromTop,
      left: 0,
      right: 0,
      child: Opacity(
        opacity: 1 - (-_fromTop / _containerHeight),
        child: Container(
          height: _containerHeight,
          color: Colors.white,
          alignment: Alignment.center,
          child: Text("Your Container", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
        ),
      ),
    );
  }
}
