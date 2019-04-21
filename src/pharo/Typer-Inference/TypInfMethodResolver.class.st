Class {
	#name : #TypInfMethodResolver,
	#superclass : #TypMethodResolver,
	#category : #'Typer-Inference-Core'
}

{ #category : #initialization }
TypInfMethodResolver >> initialize [
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
TypInfMethodResolver >> resolves: aLookup [
	^ aLookup receiverType representsClass
		and: [ | method |
			method := aLookup receiverType asClass lookupSelector: aLookup selector.
			method isNotNil and: [ method isAbstract not and: [ method ast isPrimitive not ] ] ]
]
