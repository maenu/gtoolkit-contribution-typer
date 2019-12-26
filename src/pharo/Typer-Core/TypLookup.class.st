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

{ #category : #accessing }
TypLookup >> emptyResult [
	<typTypeResultAs: 'TypLookupResult'>
	self subclassResponsibility
]

{ #category : #testing }
TypLookup >> hasSuperType [
	<typTypeResultAs: 'Boolean'>
	self subclassResponsibility
]
