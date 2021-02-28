Class {
	#name : #TypLookupResolver,
	#superclass : #Object,
	#category : #'Typer-Core-Lookup'
}

{ #category : #initialization }
TypLookupResolver >> reset [
	
]

{ #category : #accessing }
TypLookupResolver >> resolve: aLookup [
	| types |
	aLookup push: self.
	types := self resolveBasic: aLookup.
	self assert: [ types allSatisfy: [ :e | e origin isNotNil ] ].
	^ types
]

{ #category : #accessing }
TypLookupResolver >> resolveBasic: aLookup [
	self subclassResponsibility
]
