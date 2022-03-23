Class {
	#name : #Steakhouse,
	#superclass : #BigMenu,
	#instVars : [
		'items'
	],
	#category : #'DesignPatterns-Composite'
}

{ #category : #adding }
Steakhouse >> add: aMenuComponent [
	items at: aMenuComponent name put: aMenuComponent
]

{ #category : #initialization }
Steakhouse >> initialize [
	"have to comment this out! Keeps making an infinite loop for some reason. Weird!"
	"super initialize."
	items := Dictionary new.
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
	"had to comment out the name printing cause it printed twice!"
	items keysAndValuesDo: [ :name :item | "Transcript show: name." item print ]
]

{ #category : #removing }
Steakhouse >> remove: aMenuComponent [
	items removeKey: (aMenuComponent name).
]
