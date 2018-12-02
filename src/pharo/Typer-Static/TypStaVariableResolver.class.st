Class {
	#name : #TypStaVariableResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Static-Core'
}

{ #category : #'as yet unclassified' }
TypStaVariableResolver >> resolverFor: aLookup [
	| clazz |
	self assert: [ self resolves: aLookup ].
	clazz := aLookup receiverType asClass.
	^ (clazz isMeta
		ifTrue: [ (clazz instanceSide typStaResolvesClassInstanceVariable: aLookup)
				ifTrue: [ clazz instanceSide typStaClassInstanceVariableResolver ]
				ifFalse: [ clazz instanceSide typStaClassVariableResolver ] ]
		ifFalse: [ (clazz typStaResolvesInstanceVariable: aLookup)
				ifTrue: [ clazz typStaInstanceVariableResolver ]
				ifFalse: [ clazz typStaClassVariableResolver ] ]) resolverFor: aLookup
]

{ #category : #'as yet unclassified' }
TypStaVariableResolver >> resolves: aLookup [
	| clazz |
	aLookup receiverType hasClass
		ifFalse: [ ^ false ].
	clazz := aLookup receiverType asClass.
	^ clazz isMeta
		ifTrue: [ (clazz instanceSide typStaResolvesClassInstanceVariable: aLookup) or: [ clazz instanceSide typStaResolvesClassVariable: aLookup ] ]
		ifFalse: [ (clazz typStaResolvesInstanceVariable: aLookup) or: [ clazz typStaResolvesClassVariable: aLookup ] ]
]
