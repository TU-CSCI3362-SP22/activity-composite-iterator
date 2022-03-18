Class {
	#name : #Item,
	#superclass : #BigMenu,
	#instVars : [
		'name',
		'price',
		'description',
		'veg',
		'raw'
	],
	#category : #BadRestaurant
}

{ #category : #accessing }
Item >> description [
	^ description
]

{ #category : #accessing }
Item >> description: anObject [
	description := anObject
]

{ #category : #accessing }
Item >> name [
	^ name
]

{ #category : #accessing }
Item >> name: anObject [
	name := anObject
]

{ #category : #accessing }
Item >> price [
	^ price
]

{ #category : #accessing }
Item >> price: anObject [
	price := anObject
]

{ #category : #printing }
Item >> print [ 
	| output |
	output := name.
	raw
	ifTrue: [ output := output, '*' ].
	veg
	ifTrue: [ output := output, ' (v)' ].	
	output := output, ', $', price.
	Transcript show: output.
	Transcript cr.
	output := '     ', description.
	Transcript show: output.
	Transcript cr
	
]

{ #category : #accessing }
Item >> raw [
	^ raw
]

{ #category : #accessing }
Item >> raw: anObject [
	raw := anObject
]

{ #category : #accessing }
Item >> veg [
	^ veg
]

{ #category : #accessing }
Item >> veg: anObject [
	veg := anObject
]
