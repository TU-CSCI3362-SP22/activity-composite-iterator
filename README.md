# Visitor Activity

This activity is designed to be completed in groups of 1-3. Phase 1 involves familiarizing yourself with the existing code base and add features. In Phase 2 we will cover the visitor pattern in the abstract. In Phase 3 you will implement the visitor pattern.

## Phase 1 - 
Browse to the DesignPatterns-Visitor package. I will explain the structure of the code, and you will then have 25 minutes to add the `annualCost` feature. You can create an example shop in the Playground with `Shop fidgetEmporium`.

We need to know the annual cost of operating the machine shop. The annual cost for job machines is simply their maintenance cost. However, for utility machines we must factor both the maintenance cost and the amortized purchase price (i.e. purchase price divided by lifetime). There is no annual cost for tools.
You will need to add the `annualCost` method to:
- `Shop`
- `Room`
- `Equipment` (as an abstract method)
- Appropriate subclasses of equipment.

## Phase 2 - 
The visitor pattern is used to decouple operations that are performed over a wide range of objects from the class definitions of those objects. When adding a new property we want to evaluate (or operation we want to perform), the straightforward approach is to create a new method for shops, rooms, and each piece of equipment. By using dynamic dispatch, the correct version of the method gets called for the correct object. However, each property requires a new method for each class, and the evaluation of th eproperty is spread across the class hierarchy.

To solve this, we will embody the operations or properties as individual objects called visitors. Each object in our hierarchy will accept visitors, inform the visitor to process itself using a `visit` method, and then send the visitor on to any composite objects. This means we require only a single `accept` method in each class. Dynamic dispatch will be used to invoke the correct `visit` method, based on the property we are evaluating.

The visitor is then responsible for knowing how to process each object, based on it's class. In order to know the class of the object, we use *double dispatch* - objects of class `Foo` will invoke a specific `visitFoo` method. Each visitor will then implement `visitFoo` for every relevant class in the hierarchy. Picking the relevant classes requires some care.

Note that the number of `visit` methods can be quite large - and many visitors might only need to process specific ones. For example, a power visitor doesn't need to look at unpowered tools. One solution to this is an abstract visitor base class that implements "null methods" - methods which do nothing, but can be overridden if needed.

## Phase 3 -
Refactor your code to use the visitor pattern.
1. Create an abstract `MachineShopVisitor` class with the following methods.
   - `report` (fully abstract)
   - `visitX:` for all important classes `X`. Begin with `visitRoom:`, `visitShop:`, and `visitEquipment:`. 
   - `visitX:` can, by default, do nothing.
1. You will need to add `accept: aVisitor` methods to `Room`, `Shop`, and `Equipment`.   
   - For rooms and shops, you will both tell the visitor to `visitRoom`/`visitShop` and inform all components that they should accept the visitor.
   - For equipment, you can just tell the visitor to `visitEquipment`.
1. Create a `PowerVisitor` subclass of `MachineShopVisitor`.
   - Store both idle power usage and maximum peak power usage. Initialize both to 0. 
   - On `report` print both usages to the `Transcript`.
   - Create the `visitX` methods necessary to compute appropriate values. If necessary, split `visitEquipment` by subclasses.
   - Remove the corresponding methods from `Machine` (and subclasses), `Room`, and `Shop`. This will likely break the per-room power check.
1. Add an `AnnualCostVisitor` subclass and repeat the above process.
1. Time permitting, use a dictionary to associate the name of each room to the rooms total power usage. You will have to re-implement `powerRequired`!

## Phase 4 -
In this phase we will identify some limitations of the visitor pattern. One has already been afforded by the activity, the rest will be outlined in class.

- The visitor pattern has to pick which classes in the hierarchy get named `visit` methods. Some properties might require specifics of subclasses, while others might operate better over superclasses. It is possible to make the visit methods for subclasses default to the superclass implementation. For example, in the abstract Visitor base class, we can implement of `visitJobMachine: aJobMachine` as `self visitMachine: aJobMachine`. Then subclasses can override either both `visitJobMachine` and `visitUtility`, or just `visitMachine.` This approach introduces a lot of choice, and therefore complexity and the chance for bugs, when implementing new visitors - a problem for a pattern that is focused around implementing new visitors.
