Class {
	#name : #TypStaVariableResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Static-Core'
}

{ #category : #'as yet unclassified' }
TypStaVariableResolver >> resolverFor: anAssociation [
	| clazz |
	self assert: [ self resolves: anAssociation ].
	clazz := anAssociation key asClass.
	^ clazz isMeta
		ifTrue: [ (clazz instanceSide typStaResolvesClassInstanceVariable: anAssociation value)
				ifTrue: [ clazz instanceSide typStaClassInstanceVariableResolver ]
				ifFalse: [ clazz instanceSide typStaClassVariableResolver ] ]
		ifFalse: [ (clazz typStaResolvesInstanceVariable: anAssociation value)
				ifTrue: [ clazz typStaInstanceVariableResolver ]
				ifFalse: [ clazz typStaClassVariableResolver ] ]
]

{ #category : #'as yet unclassified' }
TypStaVariableResolver >> resolves: anAssociation [
	| clazz |
	anAssociation key hasClass
		ifFalse: [ ^ false ].
	clazz := anAssociation key asClass.
	^ clazz isMeta
		ifTrue: [ (clazz instanceSide typStaResolvesClassInstanceVariable: anAssociation value) or: [ clazz instanceSide typStaResolvesClassVariable: anAssociation value ] ]
		ifFalse: [ (clazz typStaResolvesInstanceVariable: anAssociation value) or: [ clazz typStaResolvesClassVariable: anAssociation value ] ]
]
