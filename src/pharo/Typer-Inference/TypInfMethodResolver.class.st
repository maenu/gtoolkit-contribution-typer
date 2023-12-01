Class {
	#name : #TypInfMethodResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Inference-Lookup'
}

{ #category : #accessing }
TypInfMethodResolver >> canResolve: aLookup [
	^ aLookup compiledMethod isNotNil
]

{ #category : #printing }
TypInfMethodResolver >> printOn: aStream [
	aStream nextPutAll: 'inf method'
]

{ #category : #accessing }
TypInfMethodResolver >> result: aLookup root: anotherLookup [
	| context |
	(TypInfNodeStack canPush: aLookup compiledMethod ast) ifFalse: [ ^ nil ].
	context := TypInfContext
			sender: nil
			state: TypInfState new
			node: aLookup compiledMethod ast
			lookup: anotherLookup.
	anotherLookup context: context.
	context run.
	^ context root type
]

{ #category : #accessing }
TypInfMethodResolver >> result: aLookup root: anotherLookup update: aType [
	(TypInfNodeStack canPush: aLookup compiledMethod ast) ifFalse: [ ^ aType ].
	TypInfNodeStack actives size + 1
		< (anotherLookup context ifNil: 0 ifNotNil: #nodeStackDepth)
		ifFalse: [ ^ aType ].
	anotherLookup context: nil.
	^ self result: aLookup root: anotherLookup
]
