Class {
	#name : #MenuItem,
	#superclass : #MenuComponent,
	#instVars : [
		'name',
		'price',
		'description',
		'veg',
		'raw'
	],
	#category : #Restaurant
}

{ #category : #accessing }
MenuItem >> description [
	^ description
]

{ #category : #accessing }
MenuItem >> description: anObject [
	description := anObject
]

{ #category : #accessing }
MenuItem >> name [
	^ name
]

{ #category : #accessing }
MenuItem >> name: anObject [
	name := anObject
]

{ #category : #accessing }
MenuItem >> price [
	^ price
]

{ #category : #accessing }
MenuItem >> price: anObject [
	price := anObject
]

{ #category : #printing }
MenuItem >> print [ 
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
MenuItem >> raw [
	^ raw
]

{ #category : #accessing }
MenuItem >> raw: anBoolean [
	raw := anBoolean
]

{ #category : #accessing }
MenuItem >> veg [
	^ veg
]

{ #category : #accessing }
MenuItem >> veg: anObject [
	veg := anObject
]
