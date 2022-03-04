Extension { #name : #Variable }

{ #category : #'*Typer-Inference' }
Variable >> typInfAssignmentNodes [

	^ (TypInfMethodIndex instance writers: self) do: [ :s | 
		  s flatCollect: [ :m | 
			  m variableNodes
				  select: [ :n | n variable == self and: [ n isWrite ] ]
				  thenCollect: #parent ] ]
]

{ #category : #'*Typer-Inference' }
Variable >> typInfFlowConstrain: aNode to: aType in: aState [

	| type |
	"root is not constraining"
	aType >= ProtoObject typAsType ifTrue: [ ^ self ].
	type := aState at: aNode.
	(type isUnknown or: [ type > aType ]) ifFalse: [ ^ self ].
	aState at: aNode put: aType.
	aNode
		incomingAt: #read
		ifPresent: [ :e | e constrainTo: aType in: aState ]
		ifAbsent: [ "noop" ]
]

{ #category : #'*Typer-Inference' }
Variable >> typInfFlowInitialize: aNode in: aState [

	aState at: aNode put: self typInfFromName
]

{ #category : #'*Typer-Inference' }
Variable >> typInfFlowTransfer: aNode in: aState [

	| type |
	type := aNode
		        incomingAt: #read
		        ifPresent: [ :e | aState at: e ]
		        ifAbsent: [ TypUnknownType instance ].
	aState at: aNode put: type
]

{ #category : #'*Typer-Inference' }
Variable >> typInfFromName [

	| className global |
	(name beginsWith: 'an') ifTrue: [ className := name allButFirst: 2 ].
	(name beginsWith: 'a') ifTrue: [ className := name allButFirst: 1 ].
	className ifNil: [ ^ TypUnknownType instance ].
	global := Smalltalk globals
		          at: className asSymbol
		          ifAbsent: [ ^ TypUnknownType instance ].
	global isClass ifFalse: [ ^ TypUnknownType instance ].
	^ global typAsType
]
