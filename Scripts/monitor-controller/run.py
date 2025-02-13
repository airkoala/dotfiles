from monitorcontrol import get_monitors

for i, monitor in enumerate(get_monitors()):
    with monitor:
        print(f"Monitor {i+1}, {monitor.get_luminance()}%")

        new_brightness = input("New brightness: ")

        if new_brightness != "":
            try:
                monitor.set_luminance(int(new_brightness))
            except ValueError:
                print("Invalid brightness value")

        print("")
