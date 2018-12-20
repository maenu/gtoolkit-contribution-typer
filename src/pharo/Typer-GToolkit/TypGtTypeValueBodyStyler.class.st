Class {
	#name : #TypGtTypeValueBodyStyler,
	#superclass : #TypGtTypeBodyStyler,
	#category : #'Typer-GToolkit-Core'
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
TypGtTypeValueBodyStyler >> visitBlockNode: aNode [
	super visitBlockNode: aNode.
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
TypGtTypeValueBodyStyler >> visitLiteralNode: aNode [
	super visitLiteralNode: aNode.
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
	[ aNode typType ]
		on: Error
		do: [ Halt now ].
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
TypGtTypeValueBodyStyler >> visitSelfNode: aNode [
	super visitSelfNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtTypeValueBodyStyler >> visitSuperNode: aNode [
	super visitSuperNode: aNode.
	self styleValueNode: aNode
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
