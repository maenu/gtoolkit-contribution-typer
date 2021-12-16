Class {
	#name : #TypGtCursorStyler,
	#superclass : #TypGtValueStyler,
	#category : #'Typer-GToolkit'
}

{ #category : #visiting }
TypGtCursorStyler >> styleNode: aNode [

	<typPraArguments: 'RBValueNode'>
	self
		styleFrom: aNode start
		to: aNode stop
		with: { (TypGtCursorAttribute new
				 coder: coder;
				 node: aNode;
				 attribute: (TypGtAttribute new
						  type_: aNode typInfTypeInSelf;
						  yourself);
				 yourself) }
]
