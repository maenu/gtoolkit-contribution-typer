Class {
	#name : #TypInfContextResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Inference-Lookup'
}

{ #category : #accessing }
TypInfContextResolver >> canResolve: aLookup [
	^ TypInfNodeStack canPush: aLookup node
]

{ #category : #printing }
TypInfContextResolver >> printOn: aStream [
	aStream nextPutAll: 'inf context'
]

{ #category : #accessing }
TypInfContextResolver >> result: aLookup root: anotherLookup [
	^ TypInfContext
		sender: nil
		state: TypInfState new
		node: aLookup node
		lookup: anotherLookup
]

{ #category : #accessing }
TypInfContextResolver >> result: aLookup root: anotherLookup update: aContext [
	TypInfNodeStack actives size + 1 < aContext nodeStackDepth
		ifFalse: [ ^ aContext ].
	(TypInfNodeStack canPush: aLookup node) ifFalse: [ ^ aContext ].
	^ self result: aLookup root: anotherLookup
]
