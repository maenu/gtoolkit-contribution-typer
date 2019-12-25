Class {
	#name : #TypLookup,
	#superclass : #Object,
	#category : #'Typer-Core-Lookup'
}

{ #category : #copying }
TypLookup >> adaptWithSuperType [
	<typTypeResultAs: 'TypLookup'>
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
TypLookup >> emptyResult [
	self subclassResponsibility
]

{ #category : #testing }
TypLookup >> hasSuperType [
	<typTypeResultAs: 'Boolean'>
	self subclassResponsibility
]
