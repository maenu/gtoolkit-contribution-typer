Class {
	#name : #TypGtAllBodyStyler,
	#superclass : #TypGtBodyStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #visiting }
TypGtAllBodyStyler >> visitArgumentNode: aNode [
	super visitArgumentNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtAllBodyStyler >> visitArrayNode: aNode [
	super visitArrayNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtAllBodyStyler >> visitBlockNode: aNode [
	super visitBlockNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtAllBodyStyler >> visitGlobalNode: aNode [
	super visitGlobalNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtAllBodyStyler >> visitInstanceVariableNode: aNode [
	super visitInstanceVariableNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtAllBodyStyler >> visitLiteralArrayNode: aNode [
	super visitLiteralArrayNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtAllBodyStyler >> visitLiteralNode: aNode [
	super visitLiteralNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtAllBodyStyler >> visitMessageNode: aNode [
	super visitMessageNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtAllBodyStyler >> visitMethodNode: aNode [
	| position |
	super visitMethodNode: aNode.
	position := aNode arguments isEmpty
		ifTrue: [ aNode selector size ]
		ifFalse: [ aNode arguments last stop ].
	self
		styleFrom: position
		to: position
		with:
			{(TypGtTypeAttribute new
				type:
					([ aNode typTypeForResult ]
						on: Error
						do: [ Halt now ]);
				yourself)}
]

{ #category : #visiting }
TypGtAllBodyStyler >> visitSelfNode: aNode [
	super visitSelfNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtAllBodyStyler >> visitSuperNode: aNode [
	super visitSuperNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtAllBodyStyler >> visitTemporaryNode: aNode [
	super visitTemporaryNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtAllBodyStyler >> visitThisContextNode: aNode [
	super visitThisContextNode: aNode.
	self styleValueNode: aNode
]
