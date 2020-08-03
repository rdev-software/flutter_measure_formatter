@JS()
library quantities.js;

import 'package:js/js.dart';

class Quantities {
  QuantitiesJs _quantities;

  //Quantities Constructor
  Quantities(toParse) : _quantities = QuantitiesJs(toParse);

  Quantities.scalar(double value, String unit) {
    _quantities = QuantitiesJs(value, unit);
  }

  String kind() => _quantities.kind();

  String toString() => _quantities.toString();

  String format({String unit}) {
    return _quantities.format(unit);
  }

  static List<String> getKinds() {
    return QuantitiesJs.getKinds();
  }

  Quantities parse(String toParse) {
    var newThis = this;
    newThis._quantities = _quantities.parse(toParse);
    return newThis;
  }

  Quantities to(String unit) {
    var newThis = this;
    newThis._quantities = _quantities.to(unit);
    return newThis;
  }

  Quantities toPrec(double precision) {
    var newThis = this;
    newThis._quantities = _quantities.toPrec(precision);
    return newThis;
  }

  Quantities toPrecParse(String precision) {
    var newThis = this;
    newThis._quantities = _quantities.toPrec(precision);
    return newThis;
  }
}

@JS("Qty")
class QuantitiesJs {
  ///Qty constructor accepts strings, numbers and Qty instances as initializing values.
  ///If scalars and their respective units are available programmatically, the two argument signature may be useful
  external QuantitiesJs([dynamic p1, dynamic p2]); //initializer

  external String kind();

  external QuantitiesJs parse(toParse);

  external QuantitiesJs to(String unit);

  external QuantitiesJs toPrec(dynamic precision);

  external String toString();

  ///Array of names of every well-known kind of units
  external static List<String> getKinds();

  external String format([String unit]);
}
