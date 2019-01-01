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
	<typTypeResultAs: 'TypGtMethodCoder'>
	^ coder
]

{ #category : #accessing }
TypGtTypeCursorBodyStyler >> coder: anObject [
	<typTypeArgument: 1 as: 'TypGtMethodCoder'>
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
						type: aNode typType;
						yourself);
				yourself)}
]
