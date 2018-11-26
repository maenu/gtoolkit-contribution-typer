Class {
	#name : #TypGtBodyStyler,
	#superclass : #GtCoderBodyStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #visiting }
TypGtBodyStyler >> styleFrom: from to: to with: attributes [
	"style only if within body"

	from - patternSource size - 1 <= 0
		ifFalse: [ super styleFrom: from to: to with: attributes ]
]

{ #category : #visiting }
TypGtBodyStyler >> styleValueNode: aNode [
	self
		styleFrom: aNode stop
		to: aNode stop
		with:
			{(TypGtTypeAttribute new
				type: aNode typType;
				yourself)}
]

{ #category : #visiting }
TypGtBodyStyler >> visitArgumentNode: aNode [
	super visitArgumentNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitArrayNode: aNode [
	super visitArrayNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitBlockNode: aNode [
	super visitBlockNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitGlobalNode: aNode [
	super visitGlobalNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitInstanceVariableNode: aNode [
	super visitInstanceVariableNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitLiteralArrayNode: aNode [
	super visitLiteralArrayNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitLiteralNode: aNode [
	super visitLiteralNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitMessageNode: aNode [
	super visitMessageNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitSelfNode: aNode [
	super visitSelfNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitSuperNode: aNode [
	super visitSuperNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitTemporaryNode: aNode [
	super visitTemporaryNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitThisContextNode: aNode [
	super visitThisContextNode: aNode.
	self styleValueNode: aNode
]
