Class {
	#name : #TypGtDeclarationBodyStyler,
	#superclass : #TypGtBodyStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #visiting }
TypGtDeclarationBodyStyler >> visitArgumentNode: aNode [
	super visitArgumentNode: aNode.
	(aNode parent isBlock or: [ aNode parent isSequence or: [ aNode parent isMethod ] ])
		ifTrue: [ self styleValueNode: aNode ]
]

{ #category : #visiting }
TypGtDeclarationBodyStyler >> visitMethodNode: aNode [
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
