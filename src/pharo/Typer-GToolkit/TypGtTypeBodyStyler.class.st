Class {
	#name : #TypGtTypeBodyStyler,
	#superclass : #GtCoderBodyStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #styling }
TypGtTypeBodyStyler >> style: aText ast: anAst [
	anAst typIsTyped
		ifFalse: [ ^ self ].
	super style: aText ast: anAst
]

{ #category : #visiting }
TypGtTypeBodyStyler >> styleValueNode: aNode [
	<typTypeArgument: 1 as: 'RBValueNode'>
	self
		styleFrom: aNode stop
		to: aNode stop
		with:
			{(TypGtTypeAttribute new
				type_: aNode typType;
				yourself)}
]
