Class {
	#name : #TypGtTypeCursorBodyStyler,
	#superclass : #TypGtTypeValueBodyStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #visiting }
TypGtTypeCursorBodyStyler >> styleValueNode: aNode [
	<typTypeArgument: 1 as: 'RBValueNode'>
	self flag: 'not working yet, needs work'.
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
