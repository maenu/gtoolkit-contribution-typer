Class {
	#name : #TypInfImpMethodResolver,
	#superclass : #TypMethodResolver,
	#category : #'Typer-Inference-Implementation-Core'
}

{ #category : #initialization }
TypInfImpMethodResolver >> initialize [
	super initialize.
	self
		argumentTypes: [ TypUnknownType instance ];
		resultType: [ :a | 
			"assume self return if no explicit return, otherwise check all return values"
			| method |
			method := a receiverType asClass lookupSelector: a selector.
			(method ast allChildren select: #isReturn)
				ifEmpty: [ a receiverType ]
				ifNotEmpty: [ :e | 
					((e collect: [ :f | f value typType ])
						inject: TypUnionType new
						into: [ :f :g | 
							f increment: g.
							f ]) asType ] ]
]

{ #category : #'as yet unclassified' }
TypInfImpMethodResolver >> resolves: aLookup [
	^ aLookup receiverType hasClass
		and: [ | method |
			method := aLookup receiverType asClass lookupSelector: aLookup selector.
			method isNotNil and: [ method isAbstract not ] ]
]
