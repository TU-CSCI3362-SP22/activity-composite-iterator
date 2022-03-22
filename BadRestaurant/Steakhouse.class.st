Class {
	#name : #Steakhouse,
	#superclass : #BigMenu,
	#instVars : [
		'items'
	],
	#category : #BadRestaurant
}

{ #category : #adding }
Steakhouse >> add: aMenuComponent [
	items add: aMenuComponent
]

{ #category : #initialization }
Steakhouse >> initialize [
	super initialize.
	items := OrderedCollection new.
]

{ #category : #accessing }
Steakhouse >> items [
	^ items
]

{ #category : #accessing }
Steakhouse >> items: anObject [
	items := anObject
]

{ #category : #printing }
Steakhouse >> print [
	Transcript show: 'IHOB'.
	Transcript cr.
	Transcript show: 'a house of cowcakes'.
	Transcript cr.
	items do: [ :item | item print ].
	submenus do: [ :ms | ms print ].
]

{ #category : #removing }
Steakhouse >> remove: aMenuComponent [
	items remove: aMenuComponent
]
