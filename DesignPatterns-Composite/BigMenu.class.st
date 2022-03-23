Class {
	#name : #BigMenu,
	#superclass : #Object,
	#instVars : [
		'submenus'
	],
	#category : #'DesignPatterns-Composite'
}

{ #category : #adding }
BigMenu >> add: aMenuComponent [
	submenus add: aMenuComponent
]

{ #category : #initialization }
BigMenu >> initialize [
	submenus  := OrderedCollection new.
]

{ #category : #printing }
BigMenu >> print [
	Transcript show: 'Main Menu'.
	Transcript cr.
	submenus do: [ :item | item print ]
]

{ #category : #removing }
BigMenu >> remove: aMenuComponent [
	submenus remove: aMenuComponent
]

{ #category : #accessing }
BigMenu >> submenus [
	^ submenus
]

{ #category : #accessing }
BigMenu >> submenus: anObject [
	submenus := anObject
]
