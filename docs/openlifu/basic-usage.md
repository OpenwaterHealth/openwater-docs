# OpenLIFU Basic Usage

```python
import openlifu

transducer = openlifu.xdc.Transducer("H317")
protocol = openlifu.Protocol(pulse_count=1000)
plan = openlifu.Plan(transducer, protocol)
plan.calc_focus_pattern()
```

[Treatment Planning](treatment-planning.md) | [API](api-reference.md)
