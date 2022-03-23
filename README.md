## Composite/Iterator
March 23, 2022

- Amber Carlson
- Liliana Villarreal
- Travis Mewborne

## Prelude: What is the Composite Pattern?
 
Composition is one of the fundemental elements of object-orientation: objects can contain other objects as instance variables (or fields). If Class B has an instance variable that holds an object of Class A, then Class B can extend the functionality of Class A without modifying the original definition. The other OO way to extend functionality is through _inheritance_. The difference between the two can be thought of as follows: with composition an instance of class B _has an_ instance of class A; with inheritance an instance of class B _is an_ instance of class A.

🌶 The composite __design pattern__ generalizes this idea even further: rather than using specific instance variables that contain specific classes, the basic idea of the Composite Pattern is to create a tree where each node can either be a leaf or another branching node. This allows for more flexibility in future growth but comes at a hefty refactoring cost.

![Composites are trees](https://learning.oreilly.com/api/v2/epubs/urn:orm:book:9781492077992/files/assets/f0360-01.png)

## Phase 1: Become Familiar With our Code

**Restaurant story** - owners each want to keep everything their own way

Recently the two popular restaurants Pancake House and Steak House merged into one “affordable” business! Both restaurants already had a Pharo class that held their important information, including the menus. To accommodate this change, your new manager wants a combined menu with both menus from the old businesses. However, one menu is implemented with an OrderedCollection and the other with a Dictionary. What’s more, the chefs at each restaurant refuse to change their implementation insisting that their way is better! 

To solve this, the menus of the two restaurants have been given a common superclass, with both restaurant menus using the same `Item` class. The superclass then holds instances of the menus for the two different restaurants. This works, however, it confuses the “has-a” and “is-a” relationships because `Item` and each menu are at the same depth, but the menus have items in their menus. The resulting class hierarchy is this:

- `BigMenu` - overarching menu that contains the submenus from the two restaurants. It can print the menus to the transcript.
  - `Item` - A menu item that knows how to print itself.
    - **Beware:** this implementation contains both a class `Item` and a variable `items`, which is a list of `Item`s.
  - `PancakeHouse` - menu from the Pancake House containing a list of `Item`s on its menu. It has a print method that prints all the items on its menu.
  - `Steakhouse` - menu from the Steak House containing a list of `Items` on *their* menu. It also has a print method.
- `BigMenuBuilder` - contains a method called `exampleMenu` which has builds and prints a menu. You can either run this with `BigMenuBuilder new exampleMenu`, or browse to the method and copy the code into the Playground. Mess around with this code to become familiar with the existing class hierarchy. The menu prints to the `Transcript`, so be sure to open that from the Tools menu.


## Phase 2: Making the Problem Worse

Breaking News! The Steak House manager has announced a new Dessert submenu, and they didn’t consult with you! Now you have to create another, separate menu called `Dessert` which is a subclass of `Steakhouse`. You asked if it could be its own menu, but the manager refused. “The customer is always right 🙄.”

1. Add a class called `Dessert` as a subclass of `Steakhouse`.
   - It should have an instance variable that can store the items in its menu.
1. `Dessert` has to be able to handle its list of Items.
   - It must initialize all its variables, including the `Dictionary` storing its items. Be careful, it may not be safe to call `super initialize`!
1. `Steakhouse` must now acknowledge the `Dessert` menu
   - Somewhere, the submenu must be sored. 
   - `Steakouse`’s `print` must call the `print` method on its submenu.
     - This means you must *override* the print menu for `Dessert`. It should only print its own information and call the `print` methods of all the Items it stores. 
1. Extend the `menuExample` method of `BigMenuTester` by creating a million-dollar moon pie and adding it 
```Smalltalk
	moonpie := Item new.
	moonpie name: 'Moonpie'.
	moonpie description: 'A nice slice o moon'.
	moonpie price: '1,000,000.00'.
	moonpie raw: false.
	moonpie veg: true.
```
- How you add the moonpie to a dessert menu, and attach that dessert menu to the `BigMenu Steakhouse` depends on your implementation.

To test your code: `(BigMenuBuilder new) exampleMenu.`, or copy and paste the code from `exampleMenu` into the playground (omitting the method name).

After running the sample test code, the output should resemble the following:
```
Main Menu
IHOB
a house of cowcakes
a steak*, $500.00
     a whole cow
IHOB`s Dessert Menu
a house of cowcakes, but with more sugar
Moonpie (v), $1,000,000.00
     A nice slice o moon
Not IHOB
a house of pancakes
buttermilk pancake (v), $700.00
      its like butter, but bread. Also it`s the size of Mississippi
```

### Takeout: What makes this code bad?

This code confuses the "is-a" relation of inheritance and the "has-a" relation of composition. Yes, all menus are a kind of menu, but menus are also *holding* other menus. Take a look at the `initialize` methods for `Steakhouse` and `PancakeHouse` - we can't even use `super initialize` because our parent `BigMenu`'s intializer creates it's component sub-menus! The `Dessert` class makes this so much worse. *Contained classes* and *subclasses* are fundamentally different, but are being used similarly. When implementing the `Dessert` class you had the same problem - it cannot use the inherited `print` method, because `Steakhouse`'s `print` has the dessert menus hard-coded in! Because our class hierarchy is so muddled with the idea of composition, we can't even re-use code between different classes. There is so much copy-pasting required to make this change and any similar changes that may occur in the future. It is not extensible.


## Phase 3: A Better Solution

Time to refactor! Having one class for each menu is unnecessary and messy. To follow the Composite Pattern,  we must abstract out all the menus and item types to one overarching class, `MenuComponent`. All methods common to all menus and items, such as `print`, are defiend in the abstract base class. This abstract base class will have two concrete implementations: `Menu`s that are *composed* of other objects, and `MenuItem`s that represent actual food the customer can order. This way we can have a tree of where each menu’s children can be either `MenuItem`s or `Menu`s: the `Dessert` submenu does not have to be handled  different from other components of the `Steakhouse` menu.

To achieve this, all the methods that both classes will need to have to be defined in the overarching `MenuComponent` as `self subclassResponsibility`. They can then be overridden in the classes that need them to function properly.

The class hierarchy can be created by refactoring the existing classes.
- `MenuComponent` - Rename the `BigMenu` class to `MenuComponent`. It should have a fully abstract method for `print`. Remove all instance variables, accessors, and extraneous methods.
  - `Menu` - Rename `PancakeHouse` to `Menu`, and keep it a subclass of `MenuComponent`. `Menu` objects will represent internal nodes in our tree.
    - Instance variables - `name`, `description`, `items`. We *should* rename `item` to `components` or `subMenus`, but it's optional.
    - Create accessor methods. For now we will use these, instead of defining custom constructors.
    - The `initialize` method can now call `super initialize`.
    - Keep the overriding `print` method, which should show the name and description to the transcript, and then call print on the components (`items`).
    - Check that the definitions of `add:` and `remove:` 
  - `MenuItem` - Rename `Item` to `MenuItem`. `MenuItem`s represent a specific piece of food the customer cna order.
    - Instance Variables - `name`, `price`, `description`, `veg`, `raw`
    - Create accessor Methods for each of the above.
    - Override the `print` method. Note that a `MenuItem`, being a leaf, does not have components!
- Delete any extraneous classes (`Steakhouse`, `Dessert`)
- Replace the code for `BigMenuBuilder >> exampleMenu`. 
  - The big menu, steakhouse menu, pancakehouse menu, and dessert menu are all `Menu`s. You will have to set the descriptions and names here.
  - You will have to manually compose these menus using the `add:` method.
  - The items will still be created in the same way, and should be `add:`ed to the submenus as appropriate. 

The resultant output should be similar to the above!

### Takeaway: Limitations of the Composite Pattern

- The composite pattern uses the class hierarchy to describe what kind of node an object is, rather than something more concrete. However, it handles growth and arbitrary composition much more easily, because of its flexibility. Thus, it only really makes sense to apply to smaller projects that have the potential to grow in oddly nested ways.
- Because the composite pattern requires significant redesign, it is going to be more difficult the more code has already been written.
- Pharo avoids one ugliness of the Composite pattern that shows up in other language. Our abstract base class only has one method: `print`. That is because `print` is the only method common to both internal nodes and leaves. However, this only works because we are in an untyped language. In a language with strong typing, the abstract base class will need to contain methods in *either* the internal node or leaf classe. Some methods make no sense for the class they are being called on, and should throw an error *other* than `subclassResponsibility`. For instance, if someone asks whether a menu is vegetarian, it will return an error. 



