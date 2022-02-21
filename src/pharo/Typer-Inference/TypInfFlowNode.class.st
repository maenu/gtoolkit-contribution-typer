Class {
	#name : #TypInfFlowNode,
	#superclass : #TypNode,
	#instVars : [
		'node'
	],
	#category : #'Typer-Inference-Flow'
}

{ #category : #accessing }
TypInfFlowNode class >> node: aNode [

	^ self new
		  initializeNode: aNode;
		  yourself
]

{ #category : #accessing }
TypInfFlowNode >> = anObject [

	anObject == self ifTrue: [ ^ true ].
	anObject class = self class ifFalse: [ ^ false ].
	anObject node == node ifFalse: [ ^ false ].
	^ true
]

{ #category : #'as yet unclassified' }
TypInfFlowNode >> controlFlowNodes [

	| nodes queue |
	nodes := IdentitySet new.
	queue := LinkedList with: self.
	[ queue isEmpty ] whileFalse: [ 
		| current origins targets |
		current := queue removeFirst.
		origins := current incoming
			           select: [ :e | e isKindOf: TypInfFlowEdge ]
			           thenCollect: #origin.
		targets := current outgoing
			           select: [ :e | e isKindOf: TypInfFlowEdge ]
			           thenCollect: #target.
		queue addAll: ((origins , targets) asIdentitySet difference: nodes).
		nodes add: current ].
	^ nodes
]

{ #category : #accessing }
TypInfFlowNode >> hash [

	^ node identityHash
]

{ #category : #initialization }
TypInfFlowNode >> initializeNode: aNode [

	node := aNode
]

{ #category : #accessing }
TypInfFlowNode >> invalidateOnClassChange: aClassAnnouncement [

	self flag: 'FIXME'
	"^ selfType <= aClassAnnouncement classAffected typAsType"
]

{ #category : #accessing }
TypInfFlowNode >> invalidateOnMethodChange: aMethodAnnouncement [

	self flag: 'FIXME'
	"^ selfType <= aMethodAnnouncement methodAffected methodClass typAsType"
]

{ #category : #accessing }
TypInfFlowNode >> next: aNode [

	^ self outgoingAt: #next put: aNode
]

{ #category : #accessing }
TypInfFlowNode >> node [
	^ node
]

{ #category : #printing }
TypInfFlowNode >> printOn: aStream [

	aStream nextPutAll: (node printStringLimitedTo: 32)
]

{ #category : #'as yet unclassified' }
TypInfFlowNode >> returnSelfTo: aNode [

	^ self outgoingAt: #returnSelf put: aNode
]

{ #category : #'as yet unclassified' }
TypInfFlowNode >> returnTo: aNode [

	^ self outgoingAt: #return put: aNode
]

{ #category : #generated }
TypInfFlowNode >> type [

	^ self outgoingAt: #type
]

{ #category : #generated }
TypInfFlowNode >> type: aType [

	^ self outgoingAt: #type put: aType
]

{ #category : #'as yet unclassified' }
TypInfFlowNode >> typeIn: aType [

	| data |
	data := TypEdgePragmaData selector: #typeIn: arguments: { aType }.
	^ outgoing
		  detect: [ :e | e data = data ]
		  ifFound: #target
		  ifNone: [ 
			  | type |
			  self outgoingAt: data put: TypUnknownType instance.
			  type := node typInfAnnotated: (node typInfTypeRecursiveIn: self).
			  self outgoingAt: data put: type ]
]

{ #category : #'standard reduction rules' }
TypInfFlowNode >> typeNil [

	<typEdge>
	^ node typInfAnnotated: TypNilType instance
]

{ #category : #'instance creation' }
TypInfFlowNode >> typeUnknown [

	<typEdge>
	^ node typInfAnnotated: TypUnknownType instance
]
