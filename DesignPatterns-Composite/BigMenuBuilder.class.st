Class {
	#name : #BigMenuBuilder,
	#superclass : #Object,
	#category : #'DesignPatterns-Composite'
}

{ #category : #example }
BigMenuBuilder >> exampleMenu [
| steak buttermilk cowHouse pancakeHouse menu |
Transcript clear.
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

menu := BigMenu new.
menu steakhouseMenu add: steak.
menu pancakeMenu add: buttermilk.

menu print.



]
