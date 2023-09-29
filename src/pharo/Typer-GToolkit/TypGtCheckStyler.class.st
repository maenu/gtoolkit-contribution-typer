Class {
	#name : #TypGtCheckStyler,
	#superclass : #TypGtRbAstStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtCheckStyler >> styleNode: aNode for: aBlock [
	[ aBlock cull: aNode ]
		on: TypCheError
		do: [ :e | 
			self
				attributes: {e typGtAsAttribute}
				from: aNode stopWithoutParentheses
				to: aNode stopWithoutParentheses ]
]

{ #category : #visiting }
TypGtCheckStyler >> styleNodeUnknown: aNode message: aString [
	self
		attributes: {TypGtCheckAttribute
					object: aNode
					color: Color blue
					message: aString}
		from: aNode stopWithoutParentheses
		to: aNode stopWithoutParentheses
]

{ #category : #accessing }
TypGtCheckStyler >> styleNodesAt: aNode for: aBlock [
	(self context nodesAt: aNode) do: [ :n | self styleNode: aNode for: aBlock ]
]

{ #category : #visiting }
TypGtCheckStyler >> visitArgumentNode: aNode [
	super visitArgumentNode: aNode.
	(self context type: aNode) isUnknown
		ifTrue: [ self styleNodeUnknown: aNode message: 'Argument is unknown' ]
]

{ #category : #visiting }
TypGtCheckStyler >> visitAssignmentNode: aNode [
	super visitAssignmentNode: aNode.
	(self context type: aNode) isUnknown
		ifTrue: [ self styleNodeUnknown: aNode value message: 'Value is unknown'.
			^ self ].
	self styleNodesAt: aNode for: #typCheCheckCompatibility
]

{ #category : #visiting }
TypGtCheckStyler >> visitMessageNode: aNode [
	super visitMessageNode: aNode.
	(self context type: aNode receiver) isUnknown
		ifTrue: [ self styleNodeUnknown: aNode message: 'Receiver is unknown'.
			^ self ].
	self styleNodesAt: aNode for: #typCheCheckMethod.
	self styleNodesAt: aNode for: #typCheCheckReceiver.
	aNode arguments
		withIndexDo: [ :nn :i | 
			(self context nodesAt: nn)
				do: [ :n | 
					(n type isUnknown or: [ (n typCheMethod arguments at: i) isUnknown ])
						ifTrue: [ self styleNodeUnknown: nn message: 'Argument is unknown' ]
						ifFalse: [ self styleNode: nn for: [ n typCheCheckArgumentCompatibilityAt: i ] ] ] ]
]

{ #category : #visiting }
TypGtCheckStyler >> visitMethodNode: aNode [
	super visitMethodNode: aNode.
	aNode typCheHasUnknownResult
		ifTrue: [ self styleNodeUnknown: aNode message: 'Result is unknown' ]
]

{ #category : #visiting }
TypGtCheckStyler >> visitReturnNode: aNode [
	super visitReturnNode: aNode.
	(self context type: aNode value) isUnknown
		ifTrue: [ self styleNodeUnknown: aNode value message: 'Return is unknown'.
			^ self ].
	self styleNodesAt: aNode value for: #typCheCheckCompatibility.
	self styleNodesAt: aNode value for: #typCheCheckNullables
]

{ #category : #visiting }
TypGtCheckStyler >> visitTemporaryNode: aNode [
	super visitTemporaryNode: aNode.
	aNode isDefinition ifFalse: [ ^ self ].
	(self context type: aNode) isUnknown
		ifTrue: [ self styleNodeUnknown: aNode message: 'Temp is unknown' ]
]
