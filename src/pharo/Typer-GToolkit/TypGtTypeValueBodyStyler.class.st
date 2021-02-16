Class {
	#name : #TypGtTypeValueBodyStyler,
	#superclass : #TypGtTypeBodyStyler,
	#category : #'Typer-GToolkit'
}

{ #category : #visiting }
TypGtTypeValueBodyStyler >> visitArgumentNode: aNode [
	super visitArgumentNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtTypeValueBodyStyler >> visitArrayNode: aNode [
	super visitArrayNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtTypeValueBodyStyler >> visitGlobalNode: aNode [
	super visitGlobalNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtTypeValueBodyStyler >> visitInstanceVariableNode: aNode [
	super visitInstanceVariableNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtTypeValueBodyStyler >> visitLiteralArrayNode: aNode [
	super visitLiteralArrayNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtTypeValueBodyStyler >> visitMessageNode: aNode [
	super visitMessageNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtTypeValueBodyStyler >> visitMethodNode: aNode [
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
				type_: aNode typResultType;
				yourself)}
]

{ #category : #visiting }
TypGtTypeValueBodyStyler >> visitTemporaryNode: aNode [
	super visitTemporaryNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtTypeValueBodyStyler >> visitThisContextNode: aNode [
	super visitThisContextNode: aNode.
	self styleValueNode: aNode
]
