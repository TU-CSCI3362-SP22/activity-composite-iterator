Class {
	#name : #BigMenu,
	#superclass : #Object,
	#instVars : [
		'steakhouseMenu',
		'pancakeMenu'
	],
	#category : #'DesignPatterns-Composite'
}

{ #category : #initialization }
BigMenu >> initialize [ 
	pancakeMenu := PancakeHouse new.
	steakhouseMenu := Steakhouse new.
]

{ #category : #accessing }
BigMenu >> pancakeMenu [
	^ pancakeMenu
]

{ #category : #accessing }
BigMenu >> pancakeMenu: anObject [
	pancakeMenu := anObject
]

{ #category : #printing }
BigMenu >> print [
	Transcript show: 'Main Menu'.
	Transcript cr.
	pancakeMenu print.
	steakhouseMenu print.
]

{ #category : #accessing }
BigMenu >> steakhouseMenu [
	^ steakhouseMenu
]

{ #category : #accessing }
BigMenu >> steakhouseMenu: anObject [
	steakhouseMenu := anObject
]
