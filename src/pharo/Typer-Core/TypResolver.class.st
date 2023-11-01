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
	self assert: [ self canResolve: aLookup ].
	aLookup resolveTo: (self result: aLookup) by: self.
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
