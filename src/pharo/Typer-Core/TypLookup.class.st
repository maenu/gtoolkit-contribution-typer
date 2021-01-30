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
TypLookup >> asLookupOrigin [
	^ TypLookupLookupOrigin lookup: self
]

{ #category : #copying }
TypLookup >> asSuperType [
	<typTypeResultAs: '@self'>
	self assert: [ self hasSuperType ].
	^ self class new
		origin: self asLookupOrigin;
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
	stack := Stack new.
	origin := nil
]

{ #category : #accessing }
TypLookup >> origin [
	^ origin
]

{ #category : #accessing }
TypLookup >> origin: aLookup [
	origin := aLookup
]

{ #category : #accessing }
TypLookup >> push: aResolver [
	stack push: aResolver
]

{ #category : #accessing }
TypLookup >> stack [
	^ stack
]
