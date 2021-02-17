Class {
	#name : #TypLookup,
	#superclass : #Object,
	#instVars : [
		'stack',
		'origin'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypLookup >> asOrigin [
	^ TypLookupOrigin lookup: self
]

{ #category : #copying }
TypLookup >> copyWithSuperType [
	self assert: [ self hasSuperType ].
	^ self copy
		origin: self asOrigin;
		yourself
]

{ #category : #testing }
TypLookup >> hasSuperType [
	<typTypeResultAs: 'Boolean'>
	self subclassResponsibility
]

{ #category : #accessing }
TypLookup >> initialize [
	super initialize.
	stack := Stack new
]

{ #category : #accessing }
TypLookup >> origin: aLookup [
	origin := aLookup
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
	^ origin ifNil: self
]
