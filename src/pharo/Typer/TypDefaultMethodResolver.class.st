Class {
	#name : #TypDefaultMethodResolver,
	#superclass : #TypMethodResolver,
	#category : #'Typer-Core'
}

{ #category : #initialization }
TypDefaultMethodResolver >> initialize [
	super initialize.
	self
		argumentTypes: [ TypUnknownType instance ];
		resultType: [ :a | 
			"assume self return if no explicit return"
			| method |
			method := a receiverType asClass lookupSelector: a selector.
			method ast typIsReturnSelf
				ifTrue: [ a receiverType ]
				ifFalse: [ TypUnknownType instance ] ]
]

{ #category : #accessing }
TypDefaultMethodResolver >> resolves: aLookup [
	^ aLookup receiverType representsClass
		and: [ | method |
			method := aLookup receiverType asClass lookupSelector: aLookup selector.
			method isNotNil and: [ method isAbstract not and: [ method ast isPrimitive not ] ] ]
]
