Class {
	#name : #TypGtTypeCursorBodyStyler,
	#superclass : #TypGtTypeValueBodyStyler,
	#instVars : [
		'coder'
	],
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtTypeCursorBodyStyler >> coder [
	^ coder
]

{ #category : #accessing }
TypGtTypeCursorBodyStyler >> coder: anObject [
	coder := anObject
]

{ #category : #visiting }
TypGtTypeCursorBodyStyler >> styleValueNode: aNode [
	<typTypeArgument: 1 as: 'RBValueNode'>
	self
		styleFrom: aNode start 
		to: aNode stop
		with:
			{(TypGtTypeCursorAttribute new
				coder: coder;
				attribute:
					(TypGtTypeAttribute new
						type:
							([ aNode typType ]
								on: Error
								do: [ Halt now ]);
						yourself);
				yourself)}
]
