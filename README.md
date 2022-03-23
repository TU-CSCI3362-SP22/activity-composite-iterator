## Composite/Iterator
March 23, 2022

Amber Carlson <br />
Liliana Villarreal <br />
Travis Mewborne <br />

**Link to better version as a GoogleDoc: https://docs.google.com/document/d/1orm8D9fmFXzVbEroChFoIG5bcN60IXdlQCxUE8o_MRI/edit?usp=sharing
**

## Phase 0: What is the Composite Pattern?

🌶The basic idea of the Composite Pattern is to create a tree where each node can either be a leaf or another branching node. This allows for more flexibility in future growth but comes at a hefty refactoring cost.



## Phase 1: Become Familiar with our code

Recently the two popular restaurants Pancake House and Steak House merged into one “affordable” business! To accommodate this change, your new manager wants a combined menu with both menus from the old businesses. However, one menu is implemented with an OrderedCollection and the other with a Dictionary. What’s more, the chefs at each restaurant refuse to change their implementation insisting that their way is better. 
To solve this, the menus of the two restaurants have been given a common superclass, with both restaurant menus using the same item class. This works, however, it confuses the “has-a” and “is-a” relationships because Item and each menu are at the same depth, but the menus have items in their menus.

BigMenu - overarching menu that contains all the submenus from the two restaurants. <br />
Item - A menu item <br />
Beware: this implementation contains both a class Item and a variable items, which is a [Item]. <br />
PancakeHouse - menu from the Pancake House containing a list of items on its menu. It has a print method that prints all the items on its menu.<br />
SteakHouse - menu from the Steak House containing a list of item items on its menu. It has a print method that prints all the items on its menu.<br />
BigMenuTester - contains a method called menuTester which has no actual test code in it. Instead, it contains some sample code that, when copied into the playground, will show some of the capabilities of the above classes. Mess around with this code to become familiar with the existing class hierarchy.<br />



## Phase 2: Problem and Bad Solution

Breaking News! The Steak House manager has announced a new Dessert submenu, and they didn’t consult with you! Now you have to create another, separate menu called Dessert which is a subclass of SteakHouse. You asked if it could be its own menu, but the manager refused. “The customer is always right 🙄.”

Add a class called Dessert as a subclass of SteakHouse.<br />
It should have an instance variable that can store the items in its menu.<br />
Dessert has to be able to handle its list of Items.<br />
It must initialize all its variables, including the OrderedCollection storing its items.<br />
It must also extend add: and remove:.<br />
It also needs a new print method that prints its own information and calls the print methods of all the Items it stores.<br />
SteakHouse must now acknowledge the Dessert menu<br />
Somewhere, a list of submenus must be stored<br />
SteakHouse’s print must call the print method of all its submenus<br />
<br />
To test your code:<br />
	(BigMenuTester new) menuTester.<br />
<br />
Alternatively, copy and paste the code from menuTester into the playground (omitting the method name)<br />
<br />
After running the sample test code, the output should resemble the following:<br />
Main Menu<br />
IHOB<br />
a house of cowcakes<br />
a steak*, $500.00<br />
     a whole cow<br />
IHOB's Dessert Menu <br />
a house of cowcakes, but with more sugar <br />
Moonpie (v), $1,000,000.00 <br />
     A nice slice o moon <br />
Not IHOB <br />
a house of pancakes <br />
buttermilk pancake (v), $700.00 <br />
     its like butter, but bread. Also it's the size of Mississippi <br />
<br />
Discussion: What makes this code bad?<br />
If the “has-a” and “is-a” relationships were confused before, now they are so much worse. Items and subclasses are fundamentally different things but are being used similarly. What’s more, the Dessert class is deeper than the Item class despite having items.
Further, there is so much copy-pasting required to make this change and any similar changes that may occur in the future. It is not well extensible.


## Phase 3: Good Solution

Time to refactor! To follow the Composite Pattern, we must abstract out all the menus and item types to one overarching class, MenuComponent. Having one class for each menu is unnecessary and messy. This way we can have a tree of where each menu’s children can be either MenuItems or Menus. To achieve this, all the methods that either class will need to have to be defined in the overarching MenuComponent, but return errors. They can then be overridden in the classes that need them to function properly. If any methods are called that make no sense for the class they are being called on, for instance, if someone asks whether a menu is vegetarian, it will return an error. <br />
<br />

MenuComponent -  needs to have the methods add:, print, and remove:. These should call errors. When they are implemented, you can reference their implementation in the old restaurant code for guidance.<br />
Menu - <br />
Instance variables - name, description, items<br />
Needs accessor methods<br />
Override the methods add:, initialize, print, and remove:.<br />
MenuItem - <br />
Instance Variables - name, price, description, veg, raw<br />
Needs accessor Methods for each of the above<br />
Override Methods - print<br />


MenuTester - Like before, this is not really test code, but some sample code that can be run if copied into the playground or created as an object. To test your code, run:<br />
(MenuTester new) addPrintTest.<br />
<br />
The resultant output should resemble the following:<br />
Entre<br />
a menu<br />
sand* (v), $1.00<br />
     a sandwich, yum<br />
sugar, yes, yes, all the sugar<br />
not a vegetable<br />


## Phase 4: Takeaways

The composite pattern is essentially a redesign which is going to be more difficult the more code there to be redesigned. However, it much more easily handles growth because of its flexibility. Thus, it only really makes sense to apply to smaller projects that have the potential to grow in oddly nested ways.
