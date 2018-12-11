Class {
	#name : #TypGtBodyStyler,
	#superclass : #GtCoderBodyStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #visiting }
TypGtBodyStyler >> styleValueNode: aNode [
	<typTypeArgument: 1 as: 'RBValueNode'>
	self
		styleFrom: aNode stop
		to: aNode stop
		with:
			{(TypGtTypeAttribute new
				type:
					([ aNode typType ]
						on: Error
						do: [ Halt now ]);
				yourself)}
]

{ #category : #visiting }
TypGtBodyStyler >> styleValueNodeWithCursor: aNode [
	<typTypeArgument: 1 as: 'RBValueNode'>
	self flag: 'not working yet, needs work'.
	"self
		styleFrom: aNode start
		to: aNode stop
		with:
			{(TypGtTypeCursorAttribute new
				attribute:
					(TypGtTypeAttribute new
						type:
							([ aNode typType ]
								on: Error
								do: [ Halt now ]);
						yourself);
				yourself)}"
]

{ #category : #visiting }
TypGtBodyStyler >> visitArgumentNode: aNode [
	<typTypeArgument: 1 as: 'RBArgumentNode'>
	super visitArgumentNode: aNode.
	self styleValueNodeWithCursor: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitArrayNode: aNode [
	<typTypeArgument: 1 as: 'RBArrayNode'>
	super visitArrayNode: aNode.
	self styleValueNodeWithCursor: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitBlockNode: aNode [
	<typTypeArgument: 1 as: 'RBBlockNode'>
	super visitBlockNode: aNode.
	self styleValueNodeWithCursor: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitGlobalNode: aNode [
	<typTypeArgument: 1 as: 'RBGlobalNode'>
	super visitGlobalNode: aNode.
	self styleValueNodeWithCursor: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitInstanceVariableNode: aNode [
	<typTypeArgument: 1 as: 'RBInstanceVariableNode'>
	super visitInstanceVariableNode: aNode.
	self styleValueNodeWithCursor: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitLiteralArrayNode: aNode [
	<typTypeArgument: 1 as: 'RBLiteralArrayNode'>
	super visitLiteralArrayNode: aNode.
	self styleValueNodeWithCursor: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitLiteralNode: aNode [
	<typTypeArgument: 1 as: 'RBLiteralNode'>
	super visitLiteralNode: aNode.
	self styleValueNodeWithCursor: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitMessageNode: aNode [
	<typTypeArgument: 1 as: 'RBMessageNode'>
	super visitMessageNode: aNode.
	self styleValueNodeWithCursor: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitMethodNode: aNode [
	<typTypeArgument: 1 as: 'RBMethodNode'>
	super visitMethodNode: aNode.
	self styleValueNodeWithCursor: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitSelfNode: aNode [
	<typTypeArgument: 1 as: 'RBSelfNode'>
	super visitSelfNode: aNode.
	self styleValueNodeWithCursor: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitSuperNode: aNode [
	<typTypeArgument: 1 as: 'RBSuperNode'>
	super visitSuperNode: aNode.
	self styleValueNodeWithCursor: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitTemporaryNode: aNode [
	<typTypeArgument: 1 as: 'RBTemporaryNode'>
	super visitTemporaryNode: aNode.
	self styleValueNodeWithCursor: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitThisContextNode: aNode [
	<typTypeArgument: 1 as: 'RBThisContextNode'>
	super visitThisContextNode: aNode.
	self styleValueNodeWithCursor: aNode
]
