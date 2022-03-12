Class {
	#name : #TypGtCursorStyler,
	#superclass : #TypGtValueStyler,
	#category : #'Typer-GToolkit'
}

{ #category : #visiting }
TypGtCursorStyler >> styleNode: aNode [

	<typPraArguments: 'RBValueNode'>
	| node |
	node := TypInfMethodResolver instance
		        nodeAt: aNode
		        self: selfType
		        super: selfType superOrNil.
	self
		styleFrom: aNode start
		to: aNode stop
		with: { (TypGtCursorAttribute new
				 coder: coder;
				 node: aNode;
				 attribute: (TypGtAttribute node: node)) }
]
