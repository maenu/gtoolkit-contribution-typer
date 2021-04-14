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
	aCollection ifEmpty: [ ^ self unknown ].
	aCollection sort.
	^ aCollection first
		addOrigin:
			(TypLookupAlternativeOrigin alternatives: aCollection copyWithoutFirst)
]

{ #category : #initialization }
TypLookupResolver >> reset [
	
]

{ #category : #accessing }
TypLookupResolver >> resolve: aLookup [
	self subclassResponsibility
]

{ #category : #accessing }
TypLookupResolver >> unknown [
	^ TypUnknownType new
		addOrigin: (TypDescriptionOrigin description: 'no type found');
		yourself
]
