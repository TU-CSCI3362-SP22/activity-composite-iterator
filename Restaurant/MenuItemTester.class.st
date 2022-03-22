Class {
	#name : #MenuItemTester,
	#superclass : #TestCase,
	#category : #Restaurant
}

{ #category : #'as yet unclassified' }
MenuItemTester >> sandwichTest [
| sandwich |
	sandwich := MenuItem new.
	sandwich name: 'sand'.
	"self assert: sandwhich name = 'sand'."
	sandwich price: '1.00'.
	sandwich raw: true.
	sandwich veg: true.
	sandwich description: 'a sandwich, yum'.
	sandwich print.
]
