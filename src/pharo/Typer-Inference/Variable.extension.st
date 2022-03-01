Extension { #name : #Variable }

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

	aState at: aNode put: TypNilType instance
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
