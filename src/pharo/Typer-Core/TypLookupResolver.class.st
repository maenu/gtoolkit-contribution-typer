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
	self flag: 'FIXME this is odd'.
	self assert: [ types allSatisfy: [ :e | e origins isNotEmpty ] ].
	^ types
]

{ #category : #accessing }
TypLookupResolver >> resolveBasic: aLookup [
	self subclassResponsibility
]
