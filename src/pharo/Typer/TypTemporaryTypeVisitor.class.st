Class {
	#name : #TypTemporaryTypeVisitor,
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
TypTemporaryTypeVisitor class >> typeFor: aTemporaryNode [
	^ (self
		typesFor: aTemporaryNode
		in: (aTemporaryNode whoDefines: aTemporaryNode name)) typAsType
]

{ #category : #accessing }
TypTemporaryTypeVisitor class >> typesFor: aTemporaryNode [
	^ self
		typesFor: aTemporaryNode
		in: (aTemporaryNode whoDefines: aTemporaryNode name)
]

{ #category : #accessing }
TypTemporaryTypeVisitor class >> typesFor: aTemporaryNode in: aSequenceNode [
	^ self new
		node: aTemporaryNode;
		visitNode: aSequenceNode;
		types
]

{ #category : #visiting }
TypTemporaryTypeVisitor >> initialize [
	super initialize.
	types := OrderedCollection new.
	stopped := false
]

{ #category : #accessing }
TypTemporaryTypeVisitor >> node: aNode [
	self
		assert: [ (aNode isKindOf: RBTemporaryNode)
				and: [ aNode typIsDeclaration not ] ].
	node := aNode.
	definer := node whoDefines: node name
]

{ #category : #generated }
TypTemporaryTypeVisitor >> types [
	^ types
]

{ #category : #visiting }
TypTemporaryTypeVisitor >> visitArrayNode: anArrayNode [
	"blocks can at the earliest time be evaluated after the non-block children"

	(anArrayNode children reject: #isBlock)
		do: [ :each | self visitNode: each ].
	(anArrayNode children select: #isBlock)
		do: [ :each | self visitNode: each ]
]

{ #category : #visiting }
TypTemporaryTypeVisitor >> visitAssignmentNode: aNode [
	self visitNode: aNode value.
	(stopped not and: [ aNode variable name = node name ])
		ifTrue: [ (aNode parentSuchAs: #isSequence) == definer
				ifTrue: [ types removeAll ].
			types add: aNode value typType ]
]

{ #category : #visiting }
TypTemporaryTypeVisitor >> visitBlockNode: aBlockNode [
	"can ignore stopping, must always consider type after, using the node which is not in there, as we start from sequence nodes."

	stopped
		ifFalse: [ types addAll: (self class typesFor: node in: aBlockNode body) ]
]

{ #category : #visiting }
TypTemporaryTypeVisitor >> visitMessageNode: aMessageNode [
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
TypTemporaryTypeVisitor >> visitSequenceNode: aSequenceNode [
	aSequenceNode == definer
		ifTrue: [ types
				removeAll;
				add: TypNilType instance ].
	super visitSequenceNode: aSequenceNode
]

{ #category : #visiting }
TypTemporaryTypeVisitor >> visitTemporaryNode: aNode [
	aNode == node
		ifTrue: [ stopped := true ]
]
