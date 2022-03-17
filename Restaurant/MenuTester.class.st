Class {
	#name : #MenuTester,
	#superclass : #TestCase,
	#instVars : [
		'name',
		'description',
		'items'
	],
	#category : #Restaurant
}

{ #category : #adding }
MenuTester >> addPrintTest [
| sandwich m dessert |
sandwich := MenuItem new.
sandwich name: 'sand'.
sandwich price: '1.00'.
sandwich raw: true.
sandwich veg: true.
sandwich description: 'a sandwich, yum'.

m := Menu new.
m name: 'Entre'.
m description: 'a menu'.
m add: sandwich.

dessert := Menu new.
dessert name: 'sugar, yes, yes, all the sugar'.
dessert description: 'not a vegetable'.
m add: dessert.
m print
]
