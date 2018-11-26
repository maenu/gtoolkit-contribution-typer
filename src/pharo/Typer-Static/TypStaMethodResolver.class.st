Class {
	#name : #TypStaMethodResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Static-Core'
}

{ #category : #'as yet unclassified' }
TypStaMethodResolver >> resolverFor: anAssociation [
	| clazz |
	self assert: [ self resolves: anAssociation ].
	clazz := anAssociation key asClass.
	^ (clazz isMeta
		ifTrue: [ clazz instanceSide typStaClassMethodResolver ]
		ifFalse: [ clazz typStaInstanceMethodResolver ]) resolverFor: anAssociation
]

{ #category : #'as yet unclassified' }
TypStaMethodResolver >> resolves: anAssociation [
	| clazz |
	anAssociation key hasClass
		ifFalse: [ ^ false ].
	clazz := anAssociation key asClass.
	^ clazz isMeta
		ifTrue: [ clazz instanceSide typStaResolvesClassMethod: anAssociation ]
		ifFalse: [ clazz typStaResolvesInstanceMethod: anAssociation ]
]
