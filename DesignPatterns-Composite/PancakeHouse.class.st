Class {
	#name : #PancakeHouse,
	#superclass : #BigMenu,
	#instVars : [
		'items'
	],
	#category : #'DesignPatterns-Composite'
}

{ #category : #adding }
PancakeHouse >> add: aMenuComponent [
	items add: aMenuComponent
]

{ #category : #initialization }
PancakeHouse >> initialize [
	"have to comment this out! Keeps making an infinite loop for some reason. Weird!"
	"super initialize."
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
