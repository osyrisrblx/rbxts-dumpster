# Dumpster

Written by [Fraktality](https://www.github.com/Fraktality) ( [Source](https://gist.github.com/Fraktality/f0ab4ad950698e9f08bb01bea486845e) )

### Crash Course
```TS
import Dumpster from "@rbxts/dumpster";
import { RunService } from "@rbxts/services";

// creation
const dumpster = new Dumpster();
const myPart = new Instance("Part");

// Instance
dumpster.dump(myPart);

// RBXScriptConnection
dumpster.dump(RunService.Stepped.Connect(() => print("Step!")));

// Function
dumpster.dump(() => print("Cleaned!"));

// later..
dumpster.burn();
```