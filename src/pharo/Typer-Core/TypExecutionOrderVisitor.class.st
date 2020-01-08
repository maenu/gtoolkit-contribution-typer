Class {
	#name : #TypExecutionOrderVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'node',
		'definer',
		'types',
		'stopped'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypExecutionOrderVisitor class >> typeForTemporary: aTemporaryNode [
	| definer |
	self
		assert: [ (aTemporaryNode isKindOf: RBTemporaryNode)
				and: [ aTemporaryNode typIsDeclaration not ] ].
	definer := aTemporaryNode whoDefines: aTemporaryNode name.
	^ (self typesFor: aTemporaryNode in: definer definer: definer) typAsType
]

{ #category : #accessing }
TypExecutionOrderVisitor class >> typesFor: aNode in: anotherNode definer: yetAnotherNode [
	^ self new
		initializeNode: aNode definer: yetAnotherNode;
		visitNode: anotherNode;
		types
]

{ #category : #visiting }
TypExecutionOrderVisitor >> initialize [
	<typTypeVariable: 'node' as: 'RBTemporaryNode'>
	<typTypeVariable: 'definer' as: '{!,RBSequenceNode}'>
	<typTypeVariable: 'types' as: 'OrderedCollection<TypType>'>
	<typTypeVariable: 'stopped' as: 'Boolean'>
	super initialize.
	types := OrderedCollection new "typParameters TypType".
	stopped := false
]

{ #category : #accessing }
TypExecutionOrderVisitor >> initializeNode: aNode definer: anotherNode [
	self assert: [ aNode isKindOf: RBTemporaryNode ].
	self assert: [ aNode typIsDeclaration not ].
	node := aNode.
	definer := anotherNode
]

{ #category : #accessing }
TypExecutionOrderVisitor >> node: aNode [
	self
		assert: [ (aNode isKindOf: RBTemporaryNode)
				and: [ aNode typIsDeclaration not ] ].
	node := aNode.
	definer := node whoDefines: node name
]

{ #category : #generated }
TypExecutionOrderVisitor >> types [
	^ types
]

{ #category : #visiting }
TypExecutionOrderVisitor >> visitArrayNode: anArrayNode [
	"blocks can at the earliest time be evaluated after the non-block children"

	(anArrayNode children reject: #isBlock)
		do: [ :each | self visitNode: each ].
	(anArrayNode children select: #isBlock)
		do: [ :each | self visitNode: each ]
]

{ #category : #visiting }
TypExecutionOrderVisitor >> visitAssignmentNode: aNode [
	self visitNode: aNode value.
	(stopped not and: [ aNode variable name = node name ])
		ifTrue: [ (aNode parentSuchAs: #isSequence) == definer
				ifTrue: [ types removeAll ].
			types add: aNode value typType ].
	self visitNode: aNode variable.
]

{ #category : #visiting }
TypExecutionOrderVisitor >> visitBlockNode: aBlockNode [
	"can ignore stopping, must always consider type after, using the node which is not in there, as we start from sequence nodes."

	stopped
		ifFalse: [ self visitArgumentNodes: aBlockNode arguments.
			types addAll: (self class typesFor: node in: aBlockNode body definer: (node whoDefines: node name)) ]
]

{ #category : #visiting }
TypExecutionOrderVisitor >> visitMessageNode: aMessageNode [
	"blocks can at the earliest time be evaluated after the receiver and non-block arguments"

	| shouldVisitReceiver |
	shouldVisitReceiver := aMessageNode isCascaded not
		or: [ aMessageNode isFirstCascaded ].
	(shouldVisitReceiver and: [ aMessageNode receiver isBlock not ])
		ifTrue: [ self visitNode: aMessageNode receiver ].
	(aMessageNode arguments reject: #isBlock)
		do: [ :each | self visitNode: each ].
	(shouldVisitReceiver and: [ aMessageNode receiver isBlock ])
		ifTrue: [ self visitNode: aMessageNode receiver ].
	(aMessageNode arguments select: #isBlock)
		do: [ :each | self visitNode: each ]
]

{ #category : #visiting }
TypExecutionOrderVisitor >> visitNode: aNode [
	aNode == node
		ifTrue: [ stopped := true ]
		ifFalse: [ super visitNode: aNode ]
]

{ #category : #visiting }
TypExecutionOrderVisitor >> visitSequenceNode: aSequenceNode [
	aSequenceNode == definer
		ifTrue: [ types
				removeAll;
				add: TypNilType instance ].
	super visitSequenceNode: aSequenceNode
]
