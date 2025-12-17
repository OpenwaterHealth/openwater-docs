# OpenMOTION Basic Usage

```python
import openmotion

sensor = openmotion.Sensor()
data = sensor.acquire(duration=60)
flow = openmotion.analysis.calculate_flow(data)
```

[Blood Flow Analysis](blood-flow.md)
