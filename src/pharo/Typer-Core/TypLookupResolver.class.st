Class {
	#name : #TypLookupResolver,
	#superclass : #Object,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypLookupResolver >> canResolve: aLookup [
	self subclassResponsibility
]

{ #category : #accessing }
TypLookupResolver >> reduce: aCollection [
	aCollection
		ifEmpty: [ ^ TypUnknownType new
				addOrigin: (TypLookupAlternativeOrigin alternatives: #());
				yourself ].
	aCollection sort.
	^ aCollection first
		addOrigin:
			(TypLookupAlternativeOrigin alternatives: aCollection copyWithoutFirst);
		yourself
]

{ #category : #initialization }
TypLookupResolver >> reset [
	
]

{ #category : #accessing }
TypLookupResolver >> resolve: aLookup [
	self subclassResponsibility
]
