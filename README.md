# flutter_measure_formatter

Provides a way to format length measurements in a human readable way. 
Based on currently selected region and scale.

## Usage

There are two main methods: convertLength and formatLength.

### convertLength()

Returns string with value and unit based on current region and potentially value scale. For example 5000 metres becomes 3.11mi.

### formatLength()

Returns string with value and unit. For example 500 kilometres becomes 500km

```dart
  _formattingResult =
          await FlutterMeasureFormatter().formatLength(_selectedUnit, 500);
      _conversionResult =
          await FlutterMeasureFormatter().convertLength(_selectedUnit, 500);
```

### Unit Definition

Available units are defined in `FlutterMeasureFormatterUnit`.


### Limitations

- Android scaling is very limited and hardcoded for now.
- There is no web implementation, looking for viable solutions.
