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
	^ self resolve: aLookup root: aLookup
]

{ #category : #resolving }
TypResolver >> resolve: aLookup root: anotherLookup [
	aLookup
		resolved: aLookup
		resolver: self
		result: (self result: aLookup root: aLookup).
	anotherLookup
		resolved: aLookup
		resolver: self
		result: (self result: aLookup root: anotherLookup).
	^ aLookup
]

{ #category : #accessing }
TypResolver >> result: aLookup root: anotherLookup [
	self subclassResponsibility
]

{ #category : #accessing }
TypResolver >> update: aLookup [
	"noop by default"

	
]
