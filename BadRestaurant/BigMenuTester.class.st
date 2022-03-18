Class {
	#name : #BigMenuTester,
	#superclass : #TestCase,
	#category : #BadRestaurant
}

{ #category : #'as yet unclassified' }
BigMenuTester >> menuTester [
| steak buttermilk cowHouse pancakeHouse menu |
steak := Item new.
steak name: 'a steak'.
steak description: 'a whole cow'.
steak price: '500.00'.
steak raw: true.
steak veg: false.

buttermilk := Item new.
buttermilk name: 'buttermilk pancake'.
buttermilk description: 'its like butter, but bread. Also it`s the size of Mississippi'.
buttermilk price: '700.00'.
buttermilk raw: false.
buttermilk veg: true.

pancakeHouse := PancakeHouse new.
pancakeHouse add: buttermilk.

cowHouse := Steakhouse new.
cowHouse add: steak.

menu := BigMenu new.
menu add: cowHouse.
menu add: pancakeHouse.

menu print.



]
