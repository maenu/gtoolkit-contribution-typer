Class {
	#name : #TypGtTypeDeclarationBodyStyler,
	#superclass : #TypGtTypeBodyStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #visiting }
TypGtTypeDeclarationBodyStyler >> visitArgumentNode: aNode [
	super visitArgumentNode: aNode.
	(aNode parent isBlock or: [ aNode parent isSequence or: [ aNode parent isMethod ] ])
		ifTrue: [ self styleValueNode: aNode ]
]

{ #category : #visiting }
TypGtTypeDeclarationBodyStyler >> visitMethodNode: aNode [
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
