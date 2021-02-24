Class {
	#name : #TypLookup,
	#superclass : #Object,
	#instVars : [
		'stack',
		'parent'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #copying }
TypLookup >> copy [
	^ super copy
		initializeParent: self;
		yourself
]

{ #category : #copying }
TypLookup >> copyAsSuper [
	self subclassResponsibility
]

{ #category : #testing }
TypLookup >> hasSuper [
	<typTypeResultAs: 'Boolean'>
	self subclassResponsibility
]

{ #category : #accessing }
TypLookup >> initialize [
	super initialize.
	stack := Stack new
]

{ #category : #accessing }
TypLookup >> initializeParent: aLookup [
	parent := aLookup
]

{ #category : #accessing }
TypLookup >> postCopy [
	super postCopy.
	stack := stack copy
]

{ #category : #accessing }
TypLookup >> push: aResolver [
	stack push: aResolver
]

{ #category : #accessing }
TypLookup >> root [
	^ parent ifNil: self ifNotNil: #root
]
