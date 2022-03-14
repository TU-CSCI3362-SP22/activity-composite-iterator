Class {
	#name : #MenuComponent,
	#superclass : #Object,
	#category : #Restaurant
}

{ #category : #printing }
MenuComponent >> add: aMenuComponent [
	self subclassResponsibility 
]

{ #category : #printing }
MenuComponent >> getChild: anInt [
	self subclassResponsibility 
]

{ #category : #private }
MenuComponent >> getDescription [ 
	self subclassResponsibility 
]

{ #category : #private }
MenuComponent >> getName [
	self subclassResponsibility 
]

{ #category : #private }
MenuComponent >> getPrice [ 
	self subclassResponsibility 
]

{ #category : #private }
MenuComponent >> isPerhapsRaw [ 
	self subclassResponsibility 
]

{ #category : #private }
MenuComponent >> isVegetarian [ 
	self subclassResponsibility 
]

{ #category : #printing }
MenuComponent >> print [
	self subclassResponsibility 
]

{ #category : #printing }
MenuComponent >> remove: aMenuComponent [
	self subclassResponsibility 
]
