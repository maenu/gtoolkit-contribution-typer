Class {
	#name : #TypInfFlowVariable,
	#superclass : #TypInfFlowNode,
	#category : #'Typer-Inference-Flow'
}

{ #category : #'as yet unclassified' }
TypInfFlowVariable >> constrainTo: aType in: aState [

	node variable typInfFlowConstrain: self to: aType in: aState
]

{ #category : #accessing }
TypInfFlowVariable >> initialize: aState [

	node variable typInfFlowInitialize: self in: aState
]

{ #category : #'meta-object-protocol' }
TypInfFlowVariable >> read [

	^ self incomingAt: #read ifPresent: #yourself ifAbsent: [ self ]
]

{ #category : #'meta-object-protocol' }
TypInfFlowVariable >> read: aNode [

	^ self incomingAt: #read put: aNode
]

{ #category : #private }
TypInfFlowVariable >> transfer [

	node variable typInfFlowTransfer: self in: state
]

{ #category : #visiting }
TypInfFlowVariable >> visitArgumentVariableNode: aNode [

	| type sendNodes sendSelectors sendClasses useTypes selfType |
	self flag: 'REWRITE'.
	aNode isDefinition ifFalse: [ 
		^ self visitNode:
			  ((aNode whoDefines: aNode name) arguments detect: [ :e | 
				   e = aNode ]) ].
	type := aNode parent typInfArgumentTypeOf: aNode in: selfType.
	type isUnknown ifFalse: [ ^ type ].
	sendNodes := (aNode whoDefines: aNode name) sendNodes select: [ :e | 
		             e receiver = aNode ].
	sendSelectors := sendNodes collect: #selector as: Set.
	sendClasses := (sendSelectors flatCollect: #typInfImplementors)
		               inject: Set new
		               into: [ :r :e | 
			               r
				               detect: [ :f | e methodClass inheritsFrom: f ]
				               ifNone: [ r add: e methodClass ].
			               r ].
	(sendClasses size between: 1 and: 8) ifTrue: [ 
		^ (sendClasses collect: #typAsType) typAsType ].
	useTypes := OrderedCollection new.
	(aNode whoDefines: aNode name) nodesDo: [ :e | 
		e = aNode ifTrue: [ 
			| parent |
			parent := e parent.
			(parent isMessage and: [ parent arguments includes: aNode ]) 
				ifTrue: [ 
					useTypes add: ((parent typInfMethodIn: selfType) arguments
							 at: (parent arguments indexOf: aNode)
							 ifAbsent: [ aNode typInfNode typeUnknown ]) ].
			(parent isAssignment and: [ parent value = aNode ]) ifTrue: [ 
				useTypes add: (self visitNode: parent variable) ] ] ].
	useTypes ifEmpty: [ ^ aNode typInfNode typeUnknown ].
	^ useTypes typAsType
]
