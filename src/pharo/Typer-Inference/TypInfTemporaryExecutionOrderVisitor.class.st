Class {
	#name : #TypInfTemporaryExecutionOrderVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'node',
		'definer',
		'types',
		'stopped',
		'selfType'
	],
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfTemporaryExecutionOrderVisitor class >> typeForTemporary: aNode self: aType [

	| definer |
	self assert: [ aNode isVariable ].
	self assert: [ aNode isDefinition not ].
	definer := aNode whoDefines: aNode name.
	^ (self typesFor: aNode self: aType in: definer definer: definer) typAsType
]

{ #category : #accessing }
TypInfTemporaryExecutionOrderVisitor class >> typesFor: aNode self: aType in: anotherNode definer: yetAnotherNode [

	^ self new
		  initializeNode: aNode self: aType definer: yetAnotherNode;
		  visitNode: anotherNode;
		  types
]

{ #category : #visiting }
TypInfTemporaryExecutionOrderVisitor >> initialize [
	<typPraVariable: 'node' as: 'RBTemporaryNode'>
	<typPraVariable: 'definer' as: '{!,RBSequenceNode}'>
	<typPraVariable: 'types' as: 'OrderedCollection<TypType>'>
	<typPraVariable: 'stopped' as: 'Boolean'>
	super initialize.
	types := OrderedCollection new.	"typParameters TypType"
	stopped := false
]

{ #category : #accessing }
TypInfTemporaryExecutionOrderVisitor >> initializeNode: aNode self: aType definer: anotherNode [

	self assert: [ aNode isVariable ].
	self assert: [ aNode isDefinition not ].
	node := aNode.
	selfType := aType.
	definer := anotherNode
]

{ #category : #generated }
TypInfTemporaryExecutionOrderVisitor >> types [
	^ types
]

{ #category : #visiting }
TypInfTemporaryExecutionOrderVisitor >> visitArrayNode: anArrayNode [
	"blocks can at the earliest time be evaluated after the non-block children"

	(anArrayNode children reject: #isBlock)
		do: [ :each | self visitNode: each ].
	(anArrayNode children select: #isBlock)
		do: [ :each | self visitNode: each ]
]

{ #category : #visiting }
TypInfTemporaryExecutionOrderVisitor >> visitAssignmentNode: aNode [

	self visitNode: aNode value.
	stopped ifTrue: [ ^ self ].
	aNode variable name = node name ifTrue: [ 
		(aNode parentSuchAs: #isSequence) == definer ifTrue: [ 
			types removeAll ].
		types add: (aNode value typInfTypeSelf: selfType) ].
	self visitNode: aNode variable
]

{ #category : #visiting }
TypInfTemporaryExecutionOrderVisitor >> visitBlockNode: aBlockNode [

	"can ignore stopping, must always consider type after, using the node which is not in there, as we start from sequence nodes."

	stopped ifTrue: [ ^ self ].
	self visitArgumentNodes: aBlockNode arguments.
	types addAll: (self class
			 typesFor: node
			 self: selfType
			 in: aBlockNode body
			 definer: (node whoDefines: node name))
]

{ #category : #visiting }
TypInfTemporaryExecutionOrderVisitor >> visitMessageNode: aMessageNode [
	"blocks can at the earliest time be evaluated after the receiver and non-block arguments"

	| shouldVisitReceiver |
	shouldVisitReceiver := aMessageNode isCascaded not
		or: [ aMessageNode isFirstCascaded ].
	(shouldVisitReceiver and: [ aMessageNode receiver isBlock not ])
		ifTrue: [ self visitNode: aMessageNode receiver ].
	(aMessageNode arguments reject: #isBlock)
		do: [ :each | self visitNode: each ].
	(aMessageNode arguments select: #isBlock)
		do: [ :each | self visitNode: each ].
	(shouldVisitReceiver and: [ aMessageNode receiver isBlock ])
		ifTrue: [ self visitNode: aMessageNode receiver ]
]

{ #category : #visiting }
TypInfTemporaryExecutionOrderVisitor >> visitNode: aNode [
	stopped
		ifTrue: [ ^ self ].
	aNode == node
		ifTrue: [ stopped := true.
			^ self ].
	super visitNode: aNode
]

{ #category : #visiting }
TypInfTemporaryExecutionOrderVisitor >> visitSequenceNode: aSequenceNode [

	aSequenceNode == definer ifTrue: [ 
		types
			removeAll;
			add: (aSequenceNode typInfNilSelf: selfType) ].
	super visitSequenceNode: aSequenceNode
]
