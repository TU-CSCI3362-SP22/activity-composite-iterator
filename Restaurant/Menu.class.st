Class {
	#name : #Menu,
	#superclass : #MenuComponent,
	#instVars : [
		'name',
		'description',
		'items'
	],
	#category : #Restaurant
}

{ #category : #printing }
Menu >> add: aMenuComponent [
	items add: aMenuComponent
]

{ #category : #accessing }
Menu >> description [
	^ description
]

{ #category : #accessing }
Menu >> description: anObject [
	description := anObject
]

{ #category : #initialization }
Menu >> initialize [
	super initialize.
	items := OrderedCollection new.
]

{ #category : #accessing }
Menu >> items [
	^ items
]

{ #category : #accessing }
Menu >> items: anObject [
	items := anObject
]

{ #category : #accessing }
Menu >> name [
	^ name
]

{ #category : #accessing }
Menu >> name: anObject [
	name := anObject
]

{ #category : #printing }
Menu >> print [
	Transcript show: name.
	Transcript cr.
	Transcript show: description.
	Transcript cr.
	items do: [ :item | item print ]
]

{ #category : #printing }
Menu >> remove: aMenuComponent [
	items remove: aMenuComponent
]
