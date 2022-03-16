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
| sandwich m |
sandwich := MenuItem new.
sandwich name: 'sand'.
sandwich price: '1.00'.
sandwich raw: true.
sandwich veg: true.
sandwich description: 'a sandwich, yum'.

m := Menu new.
m add: sandwich.
m print.
m remove: sandwich.
m print
]
