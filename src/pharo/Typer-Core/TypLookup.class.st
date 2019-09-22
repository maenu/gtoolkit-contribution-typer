Class {
	#name : #TypLookup,
	#superclass : #Object,
	#category : #'Typer-Core'
}

{ #category : #copying }
TypLookup >> adaptWithSuperType [
	<typTypeResultAs: 'TypLookup'>
	self subclassResponsibility
]

{ #category : #testing }
TypLookup >> hasSuperType [
	<typTypeResultAs: 'Boolean'>
	self subclassResponsibility
]
