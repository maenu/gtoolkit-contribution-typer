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
				type:
					([ aNode typType ]
						on: Error
						do: [ Halt now ]);
				yourself)}
]

{ #category : #visiting }
TypGtBodyStyler >> styleValueNodeWithCursor: aNode [
	self
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
				yourself)}
]

{ #category : #visiting }
TypGtBodyStyler >> visitArgumentNode: aNode [
	super visitArgumentNode: aNode.
	self styleValueNodeWithCursor: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitArrayNode: aNode [
	super visitArrayNode: aNode.
	self styleValueNodeWithCursor: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitBlockNode: aNode [
	super visitBlockNode: aNode.
	self styleValueNodeWithCursor: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitGlobalNode: aNode [
	super visitGlobalNode: aNode.
	self styleValueNodeWithCursor: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitInstanceVariableNode: aNode [
	super visitInstanceVariableNode: aNode.
	self styleValueNodeWithCursor: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitLiteralArrayNode: aNode [
	super visitLiteralArrayNode: aNode.
	self styleValueNodeWithCursor: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitLiteralNode: aNode [
	super visitLiteralNode: aNode.
	self styleValueNodeWithCursor: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitMessageNode: aNode [
	super visitMessageNode: aNode.
	self styleValueNodeWithCursor: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitSelfNode: aNode [
	super visitSelfNode: aNode.
	self styleValueNodeWithCursor: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitSuperNode: aNode [
	super visitSuperNode: aNode.
	self styleValueNodeWithCursor: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitTemporaryNode: aNode [
	super visitTemporaryNode: aNode.
	self styleValueNodeWithCursor: aNode
]

{ #category : #visiting }
TypGtBodyStyler >> visitThisContextNode: aNode [
	super visitThisContextNode: aNode.
	self styleValueNodeWithCursor: aNode
]
