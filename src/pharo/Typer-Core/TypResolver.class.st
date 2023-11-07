Class {
	#name : #TypResolver,
	#superclass : #Object,
	#category : #'Typer-Core-Lookup'
}

{ #category : #resolving }
TypResolver >> canResolve: aLookup [
	self subclassResponsibility
]

{ #category : #resolving }
TypResolver >> resolve: aLookup [
	^ aLookup resolved: aLookup resolver: self
]

{ #category : #accessing }
TypResolver >> result: aLookup root: anotherLookup [
	self subclassResponsibility
]

{ #category : #accessing }
TypResolver >> result: aLookup root: anotherLookup update: aType [
	^ aType
]
