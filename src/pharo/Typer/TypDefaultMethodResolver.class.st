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
			((method ast allChildren select: #isReturn) reject: [ :e | (e "typCastAs RBReturnNode") value isSelf ]) ifEmpty: [ a receiverType ] ifNotEmpty: [ TypUnknownType instance ] ]
]

{ #category : #accessing }
TypDefaultMethodResolver >> resolves: aLookup [
	^ aLookup receiverType hasClass
		and: [ | method |
			method := aLookup receiverType asClass lookupSelector: aLookup selector.
			method isNotNil and: [ method isAbstract not and: [ method isPrimitive not ] ] ]
]
