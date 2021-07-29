Class {
	#name : #TypGtCursorStyler,
	#superclass : #TypGtValueStyler,
	#category : #'Typer-GToolkit'
}

{ #category : #visiting }
TypGtCursorStyler >> styleValueNode: aNode [
	<typPraArguments: 'RBValueNode'>
	self
		styleFrom: aNode start
		to: aNode stop
		with:
			{(TypGtCursorAttribute new
				coder: coder;
				attribute:
					(TypGtAttribute new
						type_: aNode typInfType;
						yourself);
				yourself)}
]
