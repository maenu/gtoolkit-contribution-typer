Class {
	#name : #REMOVETypInfTemporaryExecutionOrderVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'node',
		'definer',
		'types',
		'stopped',
		'selfType'
	],
	#category : #'Typer-Inference-Flow'
}

{ #category : #'as yet unclassified' }
REMOVETypInfTemporaryExecutionOrderVisitor class >> node: aNode definer: anotherNode self: aType [

	^ self new
		  initializeNode: aNode definer: anotherNode self: aType;
		  yourself
]

{ #category : #accessing }
REMOVETypInfTemporaryExecutionOrderVisitor class >> typeOf: aNode self: aType [

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
REMOVETypInfTemporaryExecutionOrderVisitor class >> typesOf: aNode in: anotherNode definer: yetAnotherNode self: aType [

	^ (self node: aNode definer: yetAnotherNode self: aType)
		  visitNode: anotherNode;
		  types
]

{ #category : #visiting }
REMOVETypInfTemporaryExecutionOrderVisitor >> visitAssignmentNode: aNode [

	self visitNode: aNode value.
	stopped ifTrue: [ ^ self ].
	aNode variable name = node name ifTrue: [ 
		(aNode parentSuchAs: #isSequence) == definer ifTrue: [ 
			types removeAll ].
		types add: (aNode value typInfTypeIn: selfType) ].
	self visitNode: aNode variable
]

{ #category : #visiting }
REMOVETypInfTemporaryExecutionOrderVisitor >> visitBlockNode: aBlockNode [

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
REMOVETypInfTemporaryExecutionOrderVisitor >> visitSequenceNode: aSequenceNode [

	aSequenceNode == definer ifTrue: [ 
		types
			removeAll;
			add: aSequenceNode typInfNode typeNil ].
	super visitSequenceNode: aSequenceNode
]
