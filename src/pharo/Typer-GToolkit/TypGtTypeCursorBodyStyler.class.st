Class {
	#name : #TypGtTypeCursorBodyStyler,
	#superclass : #TypGtTypeValueBodyStyler,
	#category : #'Typer-GToolkit'
}

{ #category : #accessing }
TypGtTypeCursorBodyStyler >> coder [
	<typPraResult: 'TypGtMethodCoder'>
	^ coder
]

{ #category : #accessing }
TypGtTypeCursorBodyStyler >> coder: anObject [
	<typPraArguments: 'TypGtMethodCoder'>
	coder := anObject
]

{ #category : #visiting }
TypGtTypeCursorBodyStyler >> styleValueNode: aNode [
	<typPraArguments: 'RBValueNode'>
	self
		styleFrom: aNode start
		to: aNode stop
		with:
			{(TypGtTypeCursorAttribute new
				coder: coder;
				attribute:
					(TypGtTypeAttribute new
						type_: aNode typInfType;
						yourself);
				yourself)}
]
