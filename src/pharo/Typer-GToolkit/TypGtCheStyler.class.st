Class {
	#name : #TypGtCheStyler,
	#superclass : #TypGtRbAstStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #visiting }
TypGtCheStyler >> visitArgumentNode: aNode [
	super visitArgumentNode: aNode.
	(self context type: aNode) isUnknown
		ifTrue: [ self styleNodeUnknown: aNode message: 'Argument is unknown' ]
]

{ #category : #visiting }
TypGtCheStyler >> visitAssignmentNode: aNode [
	super visitAssignmentNode: aNode.
	(self context type: aNode) isUnknown
		ifTrue: [ self styleNodeUnknown: aNode value message: 'Value is unknown'.
			^ self ].
	self styleNodesAt: aNode for: #typCheCheckCompatibility
]

{ #category : #visiting }
TypGtCheStyler >> visitMessageNode: aNode [
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
TypGtCheStyler >> visitMethodNode: aNode [
	super visitMethodNode: aNode.
	aNode typCheHasUnknownResult
		ifTrue: [ self styleNodeUnknown: aNode message: 'Result is unknown' ]
]

{ #category : #visiting }
TypGtCheStyler >> visitNode: aNode [
	super visitNode: aNode.
	(self context nodesAt: aNode)
		do: [ :n | 
			n typCheErrors
				ifNotEmpty: [ :c | 
					self
						attributes: {TypGtCheAttribute
									object: c
									color: c first typGtColor
									message: c first messageText}
						from: aNode stopWithoutParentheses
						to: aNode stopWithoutParentheses ] ]
]

{ #category : #visiting }
TypGtCheStyler >> visitReturnNode: aNode [
	super visitReturnNode: aNode.
	(self context type: aNode value) isUnknown
		ifTrue: [ self styleNodeUnknown: aNode value message: 'Return is unknown'.
			^ self ].
	self styleNodesAt: aNode value for: #typCheCheckCompatibility.
	self styleNodesAt: aNode value for: #typCheCheckNullables
]

{ #category : #visiting }
TypGtCheStyler >> visitTemporaryNode: aNode [
	super visitTemporaryNode: aNode.
	aNode isDefinition ifFalse: [ ^ self ].
	(self context type: aNode) isUnknown
		ifTrue: [ self styleNodeUnknown: aNode message: 'Temp is unknown' ]
]
