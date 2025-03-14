from monitorcontrol import get_monitors
from sys import argv

print(argv)

if len(argv) <= 1:
    for i, monitor in enumerate(get_monitors()):
        with monitor:
            print(f"Monitor {i+1}, {monitor.get_luminance()}%")
    exit()

for i, monitor in enumerate(get_monitors()):
    with monitor:
        new_brightness = argv[i+1] if i+1 < len(argv) else argv[-1]
        try:
            monitor.set_luminance(int(new_brightness))
            print(f"Monitor {i+1}, {monitor.get_luminance()}%")
        except ValueError:
            print("Invalid brightness value", argv[1:])
