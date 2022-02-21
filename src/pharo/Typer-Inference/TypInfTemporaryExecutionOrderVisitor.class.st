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
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfTemporaryExecutionOrderVisitor class >> node: aNode definer: anotherNode self: aType [

	^ self new
		  initializeNode: aNode definer: anotherNode self: aType;
		  yourself
]

{ #category : #accessing }
TypInfTemporaryExecutionOrderVisitor class >> typeOf: aNode self: aType [

	| definer |
	self assert: [ aNode isVariable ].
	self assert: [ aNode isDefinition not ].
	definer := aNode whoDefines: aNode name.
	^ (self
		   typesOf: aNode
		   in: definer
		   definer: definer
		   self: aType) typAsType
]

{ #category : #accessing }
TypInfTemporaryExecutionOrderVisitor class >> typesOf: aNode in: anotherNode definer: yetAnotherNode self: aType [

	^ (self node: aNode definer: yetAnotherNode self: aType)
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
TypInfTemporaryExecutionOrderVisitor >> initializeNode: aNode definer: anotherNode self: aType [

	self assert: [ aNode isVariable ].
	self assert: [ aNode isDefinition not ].
	node := aNode.
	definer := anotherNode.
	selfType := aType
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
		types add: (aNode value typInfTypeIn: selfType) ].
	self visitNode: aNode variable
]

{ #category : #visiting }
TypInfTemporaryExecutionOrderVisitor >> visitBlockNode: aBlockNode [

	"can ignore stopping, must always consider type after, using the node which is not in there, as we start from sequence nodes."

	stopped ifTrue: [ ^ self ].
	self visitArgumentNodes: aBlockNode arguments.
	types addAll: (self class
			 typesOf: node
			 in: aBlockNode body
			 definer: (node whoDefines: node name)
			 self: selfType)
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

	stopped ifTrue: [ ^ self ].
	aNode == node ifTrue: [ 
		stopped := true.
		^ self ].
	super visitNode: aNode
]

{ #category : #visiting }
TypInfTemporaryExecutionOrderVisitor >> visitSequenceNode: aSequenceNode [

	aSequenceNode == definer ifTrue: [ 
		types
			removeAll;
			add: aSequenceNode typInfNode typeNil ].
	super visitSequenceNode: aSequenceNode
]
