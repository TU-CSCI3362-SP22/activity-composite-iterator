Composite/Iterator
March 23, 2022

Amber Carlson
Liliana Villarreal
Travis Mewborne

**Link to better version as a GoogleDoc: https://docs.google.com/document/d/1orm8D9fmFXzVbEroChFoIG5bcN60IXdlQCxUE8o_MRI/edit?usp=sharing
**

## Phase 0: What is the Composite Pattern?

🌶The basic idea of the Composite Pattern is to create a tree where each node can either be a leaf or another branching node. This allows for more flexibility in future growth but comes at a hefty refactoring cost.



Phase 1: Become Familiar with our code

Restaurant story - owners each want to keep everything their own way
Recently the two popular restaurants Pancake House and Steak House merged into one “affordable” business! To accommodate this change, your new manager wants a combined menu with both menus from the old businesses. However, one menu is implemented with an OrderedCollection and the other with a Dictionary. What’s more, the chefs at each restaurant refuse to change their implementation insisting that their way is better. 
To solve this, the menus of the two restaurants have been given a common superclass, with both restaurant menus using the same item class. This works, however, it confuses the “has-a” and “is-a” relationships because Item and each menu are at the same depth, but the menus have items in their menus.

BigMenu - overarching menu that contains all the submenus from the two restaurants.
Item - A menu item
Beware: this implementation contains both a class Item and a variable items, which is a [Item].
PancakeHouse - menu from the Pancake House containing a list of items on its menu. It has a print method that prints all the items on its menu.
SteakHouse - menu from the Steak House containing a list of item items on its menu. It has a print method that prints all the items on its menu.
BigMenuTester - contains a method called menuTester which has no actual test code in it. Instead, it contains some sample code that, when copied into the playground, will show some of the capabilities of the above classes. Mess around with this code to become familiar with the existing class hierarchy.



Phase 2: Problem and Bad Solution

Breaking News! The Steak House manager has announced a new Dessert submenu, and they didn’t consult with you! Now you have to create another, separate menu called Dessert which is a subclass of SteakHouse. You asked if it could be its own menu, but the manager refused. “The customer is always right 🙄.”

Add a class called Dessert as a subclass of SteakHouse.
It should have an instance variable that can store the items in its menu.
Dessert has to be able to handle its list of Items.
It must initialize all its variables, including the OrderedCollection storing its items.
It must also extend add: and remove:.
It also needs a new print method that prints its own information and calls the print methods of all the Items it stores.
SteakHouse must now acknowledge the Dessert menu
Somewhere, a list of submenus must be stored
SteakHouse’s print must call the print method of all its submenus

To test your code:
	(BigMenuTester new) menuTester.

Alternatively, copy and paste the code from menuTester into the playground (omitting the method name)

After running the sample test code, the output should resemble the following:
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

Discussion: What makes this code bad?
If the “has-a” and “is-a” relationships were confused before, now they are so much worse. Items and subclasses are fundamentally different things but are being used similarly. What’s more, the Dessert class is deeper than the Item class despite having items.
Further, there is so much copy-pasting required to make this change and any similar changes that may occur in the future. It is not well extensible.


Phase 3: Good Solution

Time to refactor! To follow the Composite Pattern, we must abstract out all the menus and item types to one overarching class, MenuComponent. Having one class for each menu is unnecessary and messy. This way we can have a tree of where each menu’s children can be either MenuItems or Menus. To achieve this, all the methods that either class will need to have to be defined in the overarching MenuComponent, but return errors. They can then be overridden in the classes that need them to function properly. If any methods are called that make no sense for the class they are being called on, for instance, if someone asks whether a menu is vegetarian, it will return an error. 


A bit about the composite
Instructions for good code
MenuComponent -  needs to have the methods add:, print, and remove:. These should call errors. When they are implemented, you can reference their implementation in the old restaurant code for guidance.
Menu - 
Instance variables - name, description, items
Needs accessor methods
Override the methods add:, initialize, print, and remove:.
MenuItem - 
Instance Variables - name, price, description, veg, raw
Needs accessor Methods for each of the above
Override Methods - print


MenuTester - Like before, this is not really test code, but some sample code that can be run if copied into the playground or created as an object. To test your code, run:
(MenuTester new) addPrintTest.

The resultant output should resemble the following:
Entre
a menu
sand* (v), $1.00
     a sandwich, yum
sugar, yes, yes, all the sugar
not a vegetable


Phase 4: Takeaways

The composite pattern is essentially a redesign which is going to be more difficult the more code there to be redesigned. However, it much more easily handles growth because of its flexibility. Thus, it only really makes sense to apply to smaller projects that have the potential to grow in oddly nested ways.
