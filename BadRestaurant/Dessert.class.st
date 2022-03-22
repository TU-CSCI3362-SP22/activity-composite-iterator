Class {
	#name : #Dessert,
	#superclass : #Steakhouse,
	#instVars : [
		'dessertItems'
	],
	#category : #BadRestaurant
}

{ #category : #adding }
Dessert >> add: aMenuComponent [
	dessertItems add: aMenuComponent
]

{ #category : #accessing }
Dessert >> dessertItems [
	^ dessertItems
]

{ #category : #accessing }
Dessert >> dessertItems: anObject [
	dessertItems := anObject
]

{ #category : #initialization }
Dessert >> initialize [
	super initialize.
	dessertItems := OrderedCollection new.
]

{ #category : #printing }
Dessert >> print [
	Transcript show: 'IHOB`s Dessert Menu'.
	Transcript cr.
	Transcript show: 'a house of cowcakes, but with more sugar'.
	Transcript cr.
	dessertItems  do: [ :item | item print ]
]

{ #category : #removing }
Dessert >> remove: aMenuComponent [
	items remove: aMenuComponent
]
