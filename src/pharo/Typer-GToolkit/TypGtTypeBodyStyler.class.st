Class {
	#name : #TypGtTypeBodyStyler,
	#superclass : #GtCoderBodyStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #visiting }
TypGtTypeBodyStyler >> styleValueNode: aNode [
	<typTypeArgument: 1 as: 'RBValueNode'>
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
