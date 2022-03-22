Class {
	#name : #PancakeHouse,
	#superclass : #BigMenu,
	#instVars : [
		'items'
	],
	#category : #BadRestaurant
}

{ #category : #adding }
PancakeHouse >> add: aMenuComponent [
	items add: aMenuComponent
]

{ #category : #initialization }
PancakeHouse >> initialize [
	super initialize.
	items := OrderedCollection new.
]

{ #category : #accessing }
PancakeHouse >> items [
	^ items
]

{ #category : #accessing }
PancakeHouse >> items: anObject [
	items := anObject
]

{ #category : #printing }
PancakeHouse >> print [
	Transcript show: 'Not IHOB'.
	Transcript cr.
	Transcript show: 'a house of pancakes'.
	Transcript cr.
	items do: [ :item | item print ]
]

{ #category : #removing }
PancakeHouse >> remove: aMenuComponent [
	items remove: aMenuComponent
]
