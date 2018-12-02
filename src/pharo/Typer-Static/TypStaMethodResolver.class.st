Class {
	#name : #TypStaMethodResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Static-Core'
}

{ #category : #'as yet unclassified' }
TypStaMethodResolver >> resolverFor: aLookup [
	| clazz |
	self assert: [ self resolves: aLookup ].
	clazz := aLookup receiverType asClass.
	^ (clazz isMeta
		ifTrue: [ clazz instanceSide typStaClassMethodResolver ]
		ifFalse: [ clazz typStaInstanceMethodResolver ]) resolverFor: aLookup
]

{ #category : #'as yet unclassified' }
TypStaMethodResolver >> resolves: aLookup [
	| clazz |
	aLookup receiverType hasClass
		ifFalse: [ ^ false ].
	clazz := aLookup receiverType asClass.
	^ clazz isMeta
		ifTrue: [ clazz instanceSide typStaResolvesClassMethod: aLookup ]
		ifFalse: [ clazz typStaResolvesInstanceMethod: aLookup ]
]
